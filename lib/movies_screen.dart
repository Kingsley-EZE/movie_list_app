import 'package:flutter/material.dart';
import 'TheMovieDatabase.dart';
import 'movie_details screen.dart';


class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {

  TheMovieDatabase theMovieDatabase = TheMovieDatabase();

  late List<dynamic> movieResult;

  fetchMovies() async {
    Map popularMovies = await theMovieDatabase.getMovies();
    return popularMovies['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie-List',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body:FutureBuilder(
        future: fetchMovies(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasError){
            return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700) ),);
          }
          if(snapshot.hasData){
            return ListView.builder(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(
                          imageUrl: "https://image.tmdb.org/t/p/w500" + snapshot.data[index]['poster_path'],
                          movieTitle: snapshot.data[index]['title'],
                          movieReleaseDate: snapshot.data[index]['release_date'],
                          movieDescription: snapshot.data[index]['overview']),
                      ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 150.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage("https://image.tmdb.org/t/p/w500" + snapshot.data[index]['poster_path']), fit: BoxFit.cover,
                              ),
                            ),
                            child: null,
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data[index]['title'], style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),),
                                    SizedBox(height: 10.0,),
                                    Text(snapshot.data[index]['release_date'], style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}



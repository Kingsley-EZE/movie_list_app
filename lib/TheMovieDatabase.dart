
import 'package:movie_list_app/networking.dart';

const ApiKey = '';  //Here's where you paste your APIKEY. Get on from https://themoviedb.org

class TheMovieDatabase{

  Future<dynamic> getMovies(){
    NetworkHelper networkHelper = NetworkHelper(url: 'https://api.themoviedb.org/3/movie/popular?api_key=$ApiKey&language=en-US&page=1');

    var movieData = networkHelper.getData();
    return movieData;
  }
}
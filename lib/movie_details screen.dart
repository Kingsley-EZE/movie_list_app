import 'package:flutter/material.dart';


class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({required this.imageUrl, required this.movieTitle, required this.movieReleaseDate, required this.movieDescription});

  String imageUrl;
  String movieTitle;
  String movieReleaseDate;
  String movieDescription;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          height: 250.0,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
          ),
          child: null,
          ),
          SizedBox(height: 10.0,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieTitle, style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w700),),
          ),

          SizedBox(height: 10.0,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieReleaseDate, style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w500),),
          ),

          SizedBox(height: 20.0,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieDescription, style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400),),
          ),
        ],
      ),
    );
  }
}

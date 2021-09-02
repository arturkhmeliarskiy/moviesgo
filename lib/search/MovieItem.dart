import 'package:flutter/material.dart';
import 'package:moviego_models/movie_model.dart' as models;

class MovieItem extends StatelessWidget {
  final models.MovieModel movie;

  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(children: <Widget>[
            if (this.movie.posterPath != "N/A")
              Image.network(this.movie.posterPath, height: 100, width: 100)
          ]),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.movie.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(this.movie.title),
                  Text(this.movie.releaseDate)
                ]),
          )
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 8, left: 10, right: 10),
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
    );
  }
}

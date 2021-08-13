import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_category.dart';
import 'package:hexcolor/hexcolor.dart';

import '../services/movie_services.dart';

class CategoryMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: MovieSevice().getGenres(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingCategory(),
          );
        }
        final genres = snapshot.data as List<MovieModel>;
        return Container(
          height: 70,
          margin: EdgeInsets.only(left: 0, top: 10),
          child: ListView.builder(
            itemCount: genres.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 120.0,
                margin: EdgeInsets.only(left: 40, bottom: 20),
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor('#9b9b9b'),
                          blurRadius: 10,
                          offset: Offset(0, 6), // Shadow position
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ColorFiltered(
                          child: Image.network(
                            genres[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 120,
                          ),
                          colorFilter: ColorFilter.mode(
                              HexColor('#242757'), BlendMode.color),
                        )),
                  ),
                  Text(
                    genres[index].title,
                    style: TextStyle(fontSize: 17, color: HexColor('#f4f4ff')),
                  )
                ]),
              );
            },
          ),
        );
      });
}

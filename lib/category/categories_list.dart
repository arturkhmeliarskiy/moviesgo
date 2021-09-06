import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/category/catergories_movies.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_models/genre_model.dart';
import 'package:moviego_models/movie_model.dart';

final backImage = MovieModel;

class CategoriesList extends StatelessWidget {
  final List<GenreModel> genres;
  const CategoriesList({
    required this.genres,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 70,
        // color: Colors.green,
        margin: EdgeInsets.only(left: 0, top: 0),
        child: ListView.builder(
          itemCount: genres.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => CategoriesMovie(
                        genres: genres[index].id, name: genres[index].name));
                Navigator.push(context, route);
              },
              child: Container(
                width: 120.0,
                margin: EdgeInsets.only(left: 40, bottom: 0),
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor('#9b9b9b'),
                          blurRadius: 4,
                          offset: Offset(0, 6), // Shadow position
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: ColorFiltered(
                          child: CachedNetworkImage(
                            imageUrl: genres[index].imageUrl,
                            fit: BoxFit.cover,
                            height: 50,
                            width: 120,
                          ),
                          colorFilter: ColorFilter.mode(
                              HexColor('#242757'), BlendMode.color),
                        )),
                  ),
                  Text(
                    genres[index].name,
                    style: TextStyle(fontSize: 17, color: HexColor('#f4f4ff')),
                  )
                ]),
              ),
            );
          },
        ),
      );
}

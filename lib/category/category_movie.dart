import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_category.dart';
import 'package:flutter_app/services/genre.dart';
import 'package:flutter_app/services/movie_data.dart';
import 'package:hexcolor/hexcolor.dart';

final backImage = MovieModel;

class CategoryMovie extends StatelessWidget {
  final Future future;
  const CategoryMovie({Key? key, required this.future}) : super(key: key);
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingCategory(),
          );
        }
        final genres = snapshot.data as List<Genre>;

        print(backImage);
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
                            'https://image.tmdb.org/t/p/original/${genres[index]}',
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
              );
            },
          ),
        );
      });
}

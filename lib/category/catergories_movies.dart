import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/catergories_bloc/catergories_bloc.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/loading/loading_category.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoriesMovie extends StatefulWidget {
  final int genres;
  final String name;

  const CategoriesMovie({
    required this.genres,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  _CategoriesMovieState createState() => _CategoriesMovieState();
}

class _CategoriesMovieState extends State<CategoriesMovie> {
  final CategoriesBloc _bloc = CategoriesBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.add(CategoriesInitializeEvent(widget.genres, widget.name));
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: HexColor('#242757')),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CategoriesStateLoadingState) {
            return Center(
              child: LoadingCategory(
                n: 5,
              ),
            );
          }
          if (state is CategoriesStateSuccessState) {
            return Container(
                child: ListView.builder(
                    itemCount: state.searchMovies.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 0, left: 20, bottom: 25),
                        child: Column(children: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => DescriptionScreen(
                                          id: state.searchMovies[index].id));
                                  Navigator.push(context, route);
                                },
                                child: Container(
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: HexColor('#9b9b9b'),
                                          blurRadius: 10,
                                          offset:
                                              Offset(0, 8), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original/${state.searchMovies[index].posterPath}',
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 150,
                                      ),
                                    )),
                              ),
                              Container(
                                width: 190,
                                margin: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 180.0,
                                      margin: EdgeInsets.only(left: 35),
                                      child: Text(
                                        state.searchMovies[index].title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor('#242757')),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 20,
                                      margin: EdgeInsets.only(left: 0),
                                      child: StarRating(
                                        rating: double.parse(state
                                                .searchMovies[index]
                                                .voteAverage) /
                                            2,
                                        iconSize: 16.0,
                                        icon: Icons.star,
                                        icon2: Icons.star_border,
                                        fontSizes: 14,
                                        marginLeft: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]),
                      );
                    }));
          }
          return SizedBox();
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/description_bloc/description_bloc.dart';
import 'package:flutter_app/description/cover_movie.dart';
import 'package:flutter_app/description/descrition_movie.dart';
import 'package:flutter_app/description/genre_movie.dart';
import 'package:flutter_app/description/icon_info.dart';
import 'package:flutter_app/description/movie_nems.dart';
import 'package:flutter_app/description/screenshots.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/loading/loading_discription.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class DescriptionScreen extends StatefulWidget {
  final int id;
  const DescriptionScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  final DescriptionBloc _bloc = DescriptionBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.add(DescriptionInitializeEvent(widget.id));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#4b1d97')),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        color: HexColor('#f4f4f4'),
        child: SingleChildScrollView(
          child: BlocBuilder<DescriptionBloc, DescriptionState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is DescriptionStateLoadingState) {
                return Center(
                  child: LoadingDiscription(),
                );
              }

              if (state is DescriptionStateSuccessState) {
                return Column(
                  children: [
                    CoverMovie(
                        id: state.searchMovies.id,
                        images: state.searchMovies.posterpath,
                        trailerId: state.searchMovies.trailerId,
                        mylist: state.searchMovies,
                        switches: state.myListMovie == null
                            ? 0
                            : state.myListMovie.id),
                    Container(
                        margin: EdgeInsets.only(left: 0, top: 20),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                  width: 350,
                                  child: MovieNems(
                                      name: state.searchMovies.title)),
                              GenneMovie(nameGenre: state.searchMovies.genres),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                width: 135,
                                child: Row(
                                  children: [
                                    StarRating(
                                      rating:
                                          state.searchMovies.voteAverage / 2,
                                      iconSize: 20,
                                      icon: Icons.star,
                                      fontSizes: 16,
                                      marginLeft: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 45,
                        width: 250,
                        child: IconInfo(
                            year: state.searchMovies.releaseDate,
                            country: state.searchMovies.productionCountries,
                            length: state.searchMovies.runtime)),
                    DescritionMovie(
                      descrition: state.searchMovies.overview,
                    ),
                    HeaderTitle(title: "Screenshots"),
                    Screenshots(modelId: state.searchMovies.id)
                  ],
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

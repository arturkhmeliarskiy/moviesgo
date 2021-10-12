import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/description_bloc/description_bloc.dart';
import 'package:flutter_app/description/cover_movie.dart';
import 'package:flutter_app/description/descrition_movie.dart';
import 'package:flutter_app/description/genres_movie.dart';
import 'package:flutter_app/description/icon_info.dart';
import 'package:flutter_app/description/name_movie.dart';
import 'package:flutter_app/description/screenshots.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/loading/loading_discription.dart';
import 'package:flutter_app/star_rating/star_rating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DescriptionScreen extends StatefulWidget {
  final int id;
  const DescriptionScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  final DescriptionBloc _bloc = DescriptionBloc();

  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-4975133035299985/3402235641',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  void initState() {
    super.initState();
    myBanner.load();
  }

  String text = '';

  void changeText(String text) {
    setState(() {
      text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(DescriptionInitializeEvent(widget.id));
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          text,
          style: TextStyle(color: HexColor('#4b1d97')),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).canvasColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              flex: 11,
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
                              addToFavorites: () {
                                _bloc.add(AddToFavoritesInitializeEvent());
                              },
                              removeFromFavorites: () {
                                _bloc.add(RemoveFromFavoritesInitializeEvent());
                              },
                              movie: state.movie,
                              switches: state.isFavorit),
                          Container(
                              margin: EdgeInsets.only(left: 0, top: 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                        width: 350,
                                        child:
                                            NameMovie(name: state.movie.title)),
                                    GenresMovie(nameGenre: state.movie.genres),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      alignment: Alignment.center,
                                      width: 135,
                                      child: Row(
                                        children: [
                                          StarRating(
                                            rating: state.movie.voteAverage / 2,
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
                                  year: state.movie.releaseDate,
                                  country: state.movie.productionCountries,
                                  length: state.movie.runtime)),
                          DescritionMovie(
                            descrition: state.movie.overview,
                          ),
                          HeaderTitle(title: "Screenshots"),
                          Screenshots(movieImage: state.screenshots)
                        ],
                      );
                    }

                    return SizedBox();
                  },
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     color: Colors.red.withOpacity(0),
            //     width: 350,
            //     height: 60,
            //     child: AdWidget(
            //       ad: myBanner,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

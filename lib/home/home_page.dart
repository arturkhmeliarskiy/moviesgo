import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app/category/category_of_films.dart';
import 'package:flutter_app/colors/movie_color.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/loading/loading_home_page.dart';
import 'package:flutter_app/movie_list/movie_list.dart';
import 'package:flutter_app/my_list/my_switcher.dart';
import 'package:flutter_app/slider/%D1%81arousel_movie_slides.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _bloc = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    // ignore: unnecessary_statements
  }

  @override
  Widget build(BuildContext context) {
    _bloc.add(LoadMoviesEvent());
    return Scaffold(
      // backgroundColor: HexColor('#fdfdfd'),
      appBar: AppBar(
        backgroundColor: HexColor('#fdfdfd'),
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: MovieColor.purple),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return LoadingHomePage();
          }
          if (state is HomeLoadedState) {
            return Container(
              // color: HexColor('#fdfdfd'),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselMovieSlides(movies: state.carouselMovies),
                    GenresOfFilms(genres: state.genres),
                    MySwitcher(
                        myMovies: state.myListMovies,
                        moviesFantasy: state.moviesFantasy),
                    HeaderTitle(title: "Comedy"),
                    CarouselMovie(mylist: state.moviesComedy),
                    Container(height: 15),
                  ],
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}

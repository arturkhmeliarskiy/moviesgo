import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/home_bloc/home_bloc.dart';
import 'package:flutter_app/category/categories_list.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/loading/loading_home.dart';
import 'package:flutter_app/movie_list/movie_list.dart';
import 'package:flutter_app/my_list/my_list_home.dart';
import 'package:flutter_app/slider/carousel_sliders.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(HomeInitializeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#fdfdfd'),
      appBar: AppBar(
        backgroundColor: HexColor('#fdfdfd'),
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#4b1d97')),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return LoadingHome();
          }
          if (state is HomeLoadedState) {
            return Container(
              color: HexColor('#fdfdfd'),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSliders(movies: state.carouselMovies),
                    CategoriesList(genres: state.genres),
                    HeaderTitle(title: "MyList"),
                    MyListHome(myMovies: state.myListMovies),
                    HeaderTitle(title: "Comedy"),
                    MovieList(mylist: state.moviesByGenre),
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

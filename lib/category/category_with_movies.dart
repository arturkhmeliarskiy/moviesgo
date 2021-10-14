
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/category_bloc/catergories_bloc.dart';
import 'package:flutter_app/loading/loading_genres.dart';
import 'package:flutter_app/movie_info/movie_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesByCategoryPage extends StatefulWidget {
  final int genres;
  final String name;

  const MoviesByCategoryPage({
    required this.genres,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  _MoviesByCategoryPageState createState() => _MoviesByCategoryPageState();
}

class _MoviesByCategoryPageState extends State<MoviesByCategoryPage> {
  final CategoriesBloc _bloc = CategoriesBloc();

  @override
  Widget build(BuildContext context) {
    _bloc.add(CategoriesInitializeEvent(widget.genres, widget.name));
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor, //change your color here
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
              child: LoadingGenres(
                n: 5,
              ),
            );
          }
          if (state is CategoriesStateSuccessState) {
            return Container(
                child: ListView.builder(
                    itemCount: state.searchMovies.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return MovieInfo(movie: state.searchMovies[i]);
                    }));
          }
          return SizedBox();
        },
      ),
    );
  }
}

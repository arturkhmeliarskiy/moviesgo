import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading/loading_genres.dart';
import 'package:flutter_app/search/movie_info.dart';
import 'package:moviego_models/movie_model.dart';

class MoviesFromSearch extends StatefulWidget {
  final List<MovieModel> mylist;

  const MoviesFromSearch({
    required this.mylist,
    Key? key,
  }) : super(key: key);

  @override
  _MoviesFromSearchState createState() => _MoviesFromSearchState();
}

class _MoviesFromSearchState extends State<MoviesFromSearch> {
  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      return MovieInfo(movie: widget.mylist[i]);
    }
    _currentMax = _currentMax + 10;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          child: ListView.builder(
            itemExtent: 190,
            controller: _scrollController,
            itemCount: widget.mylist.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              if (i == widget.mylist.length) {
                return LoadingGenres(n: 5);
              }
              return MovieInfo(movie: widget.mylist[i]);
            },
          ),
        ),
      );
}

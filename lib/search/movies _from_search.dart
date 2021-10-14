import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/movie_info/movie_info.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
          widget.mylist.add(widget.mylist[i]);
    }
      _currentMax = _currentMax + 20;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: Container(
          child: ListView.builder(
            itemExtent: 190,
            controller: _scrollController,
            itemCount: widget.mylist.length - 9,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              if (_currentMax == i) {
                return Padding(
              padding: const EdgeInsets.all(64),
              child: Center(
                child: LoadingIndicator(
                  indicatorType: Indicator.pacman,
                  colors: [Theme.of(context).primaryColor],
                  strokeWidth: 3.0,
                  pathBackgroundColor:
                      Theme.of(context).backgroundColor,
                ),
              ),
            );
              }
               return MovieInfo(movie: widget.mylist[i]);
            },
          ),
        ),
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/header_title/header_title.dart';
import 'package:flutter_app/movie_list/movie_list.dart';
import 'package:flutter_app/my_list/my_list_home.dart';
import 'package:moviego_models/movie_model.dart';

class MySwitcher extends StatefulWidget {
  final List<MovieModel> myMovies;
  final List<MovieModel> moviesFantasy;

  const MySwitcher({
    required this.myMovies,
    required this.moviesFantasy,
    Key? key,
  }) : super(key: key);

  @override
  _MySwitcherState createState() => _MySwitcherState();
}

class _MySwitcherState extends State<MySwitcher> {
  @override
  void initState() {
    super.initState();
    setState(() {});
    // ignore: unnecessary_statements
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.myMovies.length == 0
            ? Column(children: [
                HeaderTitle(title: "Fantasy"),
                CarouselMovie(mylist: widget.moviesFantasy),
              ])
            : Column(children: [
                HeaderTitle(title: "MyList"),
                MyListHome(myMovies: widget.myMovies),
              ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/search_bloc/search_bloc.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/loading/loading_genres.dart';
import 'package:flutter_app/search/movies%20_from_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_models/movie_model.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageScreen createState() => SearchPageScreen();
}

class SearchPageScreen extends State<SearchPage> {
  final SearchBloc _bloc = SearchBloc();
  final searchTextController = TextEditingController();

  @override
  void dispose() {
    //Dispose the controller when the screen is disposed
    searchTextController.dispose();
    super.dispose();
  }

  //When a movie is clicked navigate to the movie detail screen
  void itemClick(MovieModel item) {
    //The movie details will be passed via the list
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DescriptionScreen(
                id: item.id,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#fdfdfd'),
          elevation: 0,
          centerTitle: true,
          title: Container(
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  style: TextStyle(color: HexColor('#4b1d97')),
                  onSubmitted: (value) {
                    _bloc.add(SearchInitializeEvent(value));
                  },
                  controller: searchTextController,
                  decoration: InputDecoration(
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: HexColor('#4b1d97'), width: 2.0),
                    // ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#4b1d97'))),

                    hintText: 'Search movie',
                    suffixIcon: IconButton(
                        onPressed: searchTextController.clear,
                        icon: Icon(Icons.clear),
                        color: HexColor('#4b1d97')),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: HexColor('#4b1d97'),
                ),
                tooltip: 'Search Movies',
                onPressed: () {
                  _bloc.add(SearchInitializeEvent(
                      searchTextController.text.toString()));
                },
              ),
            ]),
            padding: EdgeInsets.all(10),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            children: <Widget>[
              BlocBuilder<SearchBloc, SearchState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is SearchStateLoadingState) {
                    return Center(
                      child: LoadingGenres(n: 5),
                    );
                  }
                  if (state is SearchStateErrorState) {
                    return Container(
                      child: Text('Error'),
                    );
                  }
                  if (state is SearchStateSuccessState) {
                    return MoviesFromSearch(mylist: state.searchMovies);
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ));
  }
}

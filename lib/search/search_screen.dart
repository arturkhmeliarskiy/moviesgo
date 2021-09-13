import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/search_bloc/search_bloc.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/search/movie_lists.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviego_models/movie_model.dart';

class Search extends StatefulWidget {
  @override
  SearchScreen createState() => SearchScreen();
}

class SearchScreen extends State<Search> {
  final SearchBloc _bloc = SearchBloc();
  final searchTextController = new TextEditingController();

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
                model: item.id,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  onSubmitted: (value) {
                    _bloc.add(SearchInitializeEvent(value));
                  },
                  controller: searchTextController,
                  decoration: InputDecoration(
                    hintText: 'Search movie',
                    suffixIcon: IconButton(
                      onPressed: searchTextController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search Movies',
                onPressed: () {},
              ),
            ]),
            padding: EdgeInsets.all(10),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is SearchStateLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is SearchStateErrorState) {
                return Container(
                  child: Text('Error'),
                );
              }
              if (state is SearchStateSuccessState) {
                return MovieLists(mylist: state.searchMovies);
              }
              return SizedBox();
            },
          ),
        ],
      ),
    ));
  }
}

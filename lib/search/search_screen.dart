import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/search/MovieLists.dart';
import 'package:moviego_models/movie_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

class Search extends StatefulWidget {
  @override
  SearchScreen createState() => SearchScreen();
}

class SearchScreen extends State<Search> {
  String searchText = "";
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
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(children: <Widget>[
              Flexible(
                child: TextField(
                  controller: searchTextController,
                  decoration: InputDecoration(hintText: 'Search movie'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search Movies',
                onPressed: () {
                  setState(() {
                    //   //Set the state with the new value so that the widget will re render
                    searchText = searchTextController.text;
                    //   //Hide keyboard when the state is set
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  });
                },
              ),
            ]),
            padding: EdgeInsets.all(10),
          ),
          //Only send the service request if the keyword is not empty
          if (searchText.length > 0)
            //A future builder to render the
            FutureBuilder<List<MovieModel>>(
                //Initiate the service request
                future: MoviesRepository().searchMovies(searchText),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final mylist = snapshot.data as List<MovieModel>;
                    //if the response has data render the movie list
                    return Expanded(child: MovieLists(mylist: mylist));
                  } else if (snapshot.hasError) {
                    //if there is an error show the error message
                    return Text("${snapshot.error}");
                  }
                  //if the service call is in progress show the progress indicator
                  return CircularProgressIndicator();
                }),
        ],
      ),
    ));
  }
}

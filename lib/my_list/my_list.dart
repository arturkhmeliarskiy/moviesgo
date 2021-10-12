import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/my_list_blloc/my_list_bloc.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/loading/loading_genres.dart';
import 'package:flutter_app/star_rating/star_rating.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_locales/flutter_locales.dart';

class MyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyList();
}

class _MyList extends State<MyList> {
  final MyListBloc _bloc = MyListBloc();

  Widget build(BuildContext context) {
    _bloc.add(MyListInitializeEvent(0));
    return Scaffold(
      appBar: AppBar(
        title: LocaleText(
          "MyList",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: BlocBuilder<MyListBloc, MyListState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is MyListLoadingState) {
            return Center(
              child: LoadingGenres(n: 5),
            );
          }
          if (state is MyListStateSuccessState) {
            return Container(
              child: ListView.builder(
                itemCount: state.myListMovie.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 0, left: 0, bottom: 25),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => DescriptionScreen(
                                      id: state.myListMovie[index].id));
                              Navigator.push(context, route);
                            },
                            child: Container(
                                width: 120.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).shadowColor,
                                      blurRadius: 10,
                                      offset: Offset(0, 8), // Shadow position
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        state.myListMovie[index].posterPath,
                                    fit: BoxFit.cover,
                                    width: 120,
                                    height: 150,
                                  ),
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 190,
                                // margin: EdgeInsets.only(right: 15),
                                // color: Colors.red,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 250.0,
                                      margin: EdgeInsets.only(left: 35),
                                      child: Text(
                                        state.myListMovie[index].title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).splashColor),
                                        maxLines: 2,
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 20,
                                      margin: EdgeInsets.only(left: 0),
                                      child: StarRating(
                                        rating: double.parse(state
                                                .myListMovie[index]
                                                .voteAverage) /
                                            2,
                                        iconSize: 16.0,
                                        icon: Icons.star,
                                        icon2: Icons.star_border,
                                        fontSizes: 14,
                                        marginLeft: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.all(0),
                            // color: Colors.green,
                            child: IconButton(
                              onPressed: () {
                                _bloc.add(MyListInitializeEvent(
                                    state.myListMovie[index].id));
                                // setState(() {});
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ]),
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}

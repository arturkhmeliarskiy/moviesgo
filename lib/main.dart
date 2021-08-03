import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'carousel_item.dart';
import 'movie_services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: HexColor('#ffffff'),
        appBar: AppBar(
          backgroundColor: HexColor('#ffffff'),
          title: Text(
            'MOVIEGO',
            style: TextStyle(color: HexColor('#ce412e')),
          ),
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu_sharp),
            onPressed: () {},
            color: HexColor('#434670'),
            iconSize: 30,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: HexColor('#434670'),
              iconSize: 30,
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: MovieSevice().searcMovies('dfdfd'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final movies = snapshot.data as List<MovieModel>;
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: false,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                        ),
                        items: movies
                            .map((e) => CarouselItem(ImageUrl: e.ImageUrl))
                            .toList(),
                      );
                    }),
                FutureBuilder(
                    future: MovieSevice().searcMovies('dfdfd'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final genres = snapshot.data as List<String>;
                      return ListView.builder(
                        itemCount: genres.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              Container(
                                width: 100.0,
                                color: Colors.red,
                                margin: const EdgeInsets.only(right: 20.0),
                                child: Text('Hello'),
                              ),
                            ],
                          );
                        },
                      );
                    }),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 20.0),
                //   height: 50.0,
                //   padding: EdgeInsets.only(left: 30, right: 0),
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children:
                //     <Widget>[
                //       Container(
                //         width: 100.0,
                //         color: Colors.red,
                //         margin: const EdgeInsets.only(right: 20.0),
                //         child: Text('Hello'),
                //       ),
                //       Container(
                //         width: 100.0,
                //         color: Colors.blue,
                //         margin: const EdgeInsets.only(right: 20.0),
                //       ),
                //       Container(
                //         width: 100.0,
                //         color: Colors.green,
                //         margin: const EdgeInsets.only(right: 20.0),
                //       ),
                //       Container(
                //         width: 100.0,
                //         color: Colors.yellow,
                //         margin: const EdgeInsets.only(right: 20.0),
                //       ),
                //       Container(
                //         width: 100.0,
                //         color: Colors.orange,
                //         margin: const EdgeInsets.only(right: 20.0),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

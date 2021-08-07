import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'carousel_item.dart';
import 'description_screen.dart';
import 'movie_services.dart';
import 'dart:developer';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children2 = [
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
                  .map((e) => CarouselItem(ImageUrl: e.imageUrl))
                  .toList(),
            );
          }),
      FutureBuilder(
          future: MovieSevice().getGenres(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final genres = snapshot.data as List<MovieModel>;
            return Container(
              height: 50,
              margin: EdgeInsets.only(left: 0, top: 25),
              child: ListView.builder(
                itemCount: genres.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    // color: Colors.red,

                    margin: EdgeInsets.only(
                      left: 40,
                    ),
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: ColorFiltered(
                            child: Image.network(
                              genres[index].imageUrl,
                              fit: BoxFit.cover,
                              height: 90,
                              width: 120,
                            ),
                            colorFilter: ColorFilter.mode(
                                HexColor('#242757'), BlendMode.color),
                          )),
                      Text(
                        genres[index].title,
                        style:
                            TextStyle(fontSize: 17, color: HexColor('#f4f4ff')),
                      )
                    ]),
                  );
                },
              ),
            );
          }),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('My list',
                style: TextStyle(fontSize: 18, color: HexColor('#242757'))),
            IconButton(
              icon: Icon(Icons.arrow_right_alt_rounded),
              onPressed: () {},
              color: HexColor('#242757'),
              iconSize: 30,
            ),
          ],
        ),
      ),
      FutureBuilder(
          future: MovieSevice().getMyList('adadad'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final mylist = snapshot.data as List<MovieModel>;

            return Container(
              height: 240,
              // color: HexColor('#c42a2a'),
              child: ListView.builder(
                itemCount: mylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Route route = MaterialPageRoute(
                            builder: (context) => DescriptionScreen());
                        Navigator.push(context, route);
                      },
                      child: Container(
                          width: 120.0,
                          // color: Colors.red,
                          margin: EdgeInsets.only(
                            left: 40,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              mylist[index].imageUrl,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 150,
                            ),
                          )),
                    ),
                    Container(
                      width: 120.0,
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 40,
                      ),
                      child: Text(mylist[index].title,
                          style: TextStyle(
                              fontSize: 15, color: HexColor('#161616'))),
                    ),
                    Container(
                      width: 100,
                      height: 20,
                      margin: EdgeInsets.only(
                        top: 5,
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            mylist[index].stars > 1
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 1
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 2
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 2
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 3
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 3
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 4
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 4
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 5
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 5
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                        ],
                      ),
                    )
                  ]);
                },
              ),
            );
          }),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Films populaires',
                style: TextStyle(fontSize: 18, color: HexColor('#242757'))),
            IconButton(
              icon: Icon(Icons.arrow_right_alt),
              onPressed: () {},
              color: HexColor('#242757'),
              iconSize: 30,
            ),
          ],
        ),
      ),
      FutureBuilder(
          future: MovieSevice().getPopular('adadad'),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final mylist = snapshot.data as List<MovieModel>;
            return Container(
              height: 240,
              // color: HexColor('#c42a2a'),
              child: ListView.builder(
                itemCount: mylist.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(children: <Widget>[
                    Container(
                        width: 120.0,
                        // color: Colors.red,
                        margin: EdgeInsets.only(
                          left: 40,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            mylist[index].imageUrl,
                            fit: BoxFit.cover,
                            width: 120,
                            height: 150,
                          ),
                        )),
                    Container(
                      width: 120.0,
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 40,
                      ),
                      child: Text(mylist[index].title,
                          style: TextStyle(
                              fontSize: 15, color: HexColor('#161616'))),
                    ),
                    Container(
                      width: 100,
                      height: 20,
                      margin: EdgeInsets.only(
                        top: 5,
                        left: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            mylist[index].stars > 1
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 1
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 2
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 2
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 3
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 3
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 4
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 4
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                          Icon(
                            mylist[index].stars > 5
                                ? Icons.star
                                : Icons.star_border,
                            size: 14,
                            color: HexColor(mylist[index].stars > 5
                                ? '#ebcc1b'
                                : '#000000'),
                          ),
                        ],
                      ),
                    )
                  ]);
                },
              ),
            );
          }),
    ];
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
            color: HexColor('#555baf'),
            iconSize: 30,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: HexColor('#555baf'),
              iconSize: 30,
            )
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: children2,
            ),
          ),
        ),
      ),
    );
  }
}

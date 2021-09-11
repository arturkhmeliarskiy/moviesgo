import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/description/description_screen.dart';
import 'package:flutter_app/starr_ating/star_rating.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_services/data_models/my_lists.dart';
import 'package:moviego_services/database.dart';

class MyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyList();
}

class _MyList extends State<MyList> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My list',
          style: TextStyle(color: HexColor('#242757')),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Center(
          child: FutureBuilder(
              future: DBProvider.db.getAllMovie(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: null,
                  );
                }
                final mylist = snapshot.data as List<MyLists>;
                return Container(
                  child: ListView.builder(
                    itemCount: mylist.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 0, left: 20, bottom: 25),
                        child: Column(children: <Widget>[
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => DescriptionScreen(
                                          model: mylist[index].id));
                                  Navigator.push(context, route);
                                },
                                child: Container(
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: HexColor('#9b9b9b'),
                                          blurRadius: 10,
                                          offset:
                                              Offset(0, 8), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/original/${mylist[index].posterpath}',
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
                                    margin: EdgeInsets.only(left: 15),
                                    // color: Colors.red,
                                    child: Column(
                                      children: [
                                        Container(
                                          // color: Colors.red,
                                          width: 180.0,
                                          margin: EdgeInsets.only(left: 35),
                                          child: Text(
                                            mylist[index].title,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#242757')),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          height: 20,
                                          margin: EdgeInsets.only(left: 0),
                                          child: StarRating(
                                            rating:
                                                mylist[index].voteAverage / 2,
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
                                  IconButton(
                                    onPressed: () async {
                                      await DBProvider.db
                                          .deleteMovie(mylist[index].id);
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: HexColor('#242757'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ]),
                      );
                    },
                  ),
                );
              })),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class CoverMovie extends StatelessWidget {
  final String trailerId;
  final String images;
  final IconData icon;
  final IconData icon2;
  final MovieDetailModel mylist;

  const CoverMovie({
    required this.trailerId,
    required this.images,
    required this.mylist,
    this.icon = Icons.add_outlined,
    this.icon2 = Icons.share_outlined,
    Key? key,
  }) : super(key: key);

  Map toJson() => {
        'id': mylist.id,
        'title': mylist.title,
        'posterpath': mylist.posterpath,
        'voteAverage': mylist.voteAverage,
        'genres': mylist.genres,
      };

  _getResult() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = jsonEncode(toJson());
    prefs.setString('key', jsonUser + ',$jsonUser');
    print(prefs.getString('key'));
  }

  _getRemove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('key');
    print(prefs.remove('key'));
  }

  @override
  Widget build(BuildContext context) => Container(
        color: HexColor('#f4f4f4'),
        height: 380,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.0),
                  boxShadow: [
                    BoxShadow(
                      color: HexColor('#9b9b9b'),
                      blurRadius: 20,
                      offset: Offset(0, 8), // Shadow position
                    ),
                  ],
                ),
                child: ClipPath(
                  clipper: ClippingClass(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 320.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/original/$images',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 268,
                left: 150.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: HexColor('#ffffff'),
                      borderRadius: BorderRadius.circular(80.0),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor('#9b9b9b'),
                          blurRadius: 14,
                          offset: Offset(0, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        final youtubeUrl =
                            'https://www.youtube.com/embed/${trailerId}';
                        if (await canLaunch(youtubeUrl)) {
                          await launch(youtubeUrl);
                        }
                      },
                      child:
                          Stack(alignment: Alignment.center, children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            width: 90,
                            height: 90,
                          ),
                        ),
                        Icon(Icons.play_arrow,
                            color: new Color(0xffd60506), size: 50.0),
                      ]),
                    ),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 0, top: 330),
              // color: HexColor('#9b9b9b'),
              height: 50,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        icon,
                        color: HexColor('#242757'),
                        size: 30,
                      ),
                      onPressed: _getResult,
                    ),
                    IconButton(
                      icon: Icon(
                        icon2,
                        color: HexColor('#242757'),
                        size: 30,
                      ),
                      onPressed: _getRemove,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

class FontAwesomeIcons {}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final List<String> screenshots = [
  'https://www.wallpapertip.com/wmimgs/159-1598575_avengers-original-cast.jpg',
  'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
  'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
  'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
  'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
];

class DescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hexColor = HexColor('#ce412e');
    var children2 = [
      Container(
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
                          color: Colors.red,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://wallpaperaccess.com/full/240167.jpg")),
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
                        Icons.add_outlined,
                        color: HexColor('#242757'),
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share_outlined,
                        color: HexColor('#242757'),
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(left: 0, top: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'The Avengers',
                  style: TextStyle(
                      color: HexColor('#242757'),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, top: 10),
                  child: Text(
                    'The Avengers',
                    style: TextStyle(
                      color: HexColor('#585858'),
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 24,
                          color: HexColor('#ebcc1b'),
                        ),
                        Icon(
                          Icons.star,
                          size: 24,
                          color: HexColor('#ebcc1b'),
                        ),
                        Icon(
                          Icons.star,
                          size: 24,
                          color: HexColor('#ebcc1b'),
                        ),
                        Icon(
                          Icons.star,
                          size: 24,
                          color: HexColor('#ebcc1b'),
                        ),
                        Icon(
                          Icons.star,
                          size: 24,
                          color: HexColor('#ebcc1b'),
                        ),
                      ],
                    )),
              ],
            ),
          )),
      Container(
        margin: EdgeInsets.only(top: 10),
        height: 50,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Year',
                  style: TextStyle(color: HexColor('#585858'), fontSize: 15),
                ),
                Text(
                  '2012',
                  style: TextStyle(
                      color: HexColor('#242757'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Country',
                  style: TextStyle(color: HexColor('#585858'), fontSize: 15),
                ),
                Text(
                  'USA',
                  style: TextStyle(
                      color: HexColor('#242757'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Lenght',
                  style: TextStyle(color: HexColor('#585858'), fontSize: 15),
                ),
                Text(
                  '140',
                  style: TextStyle(
                      color: HexColor('#242757'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 10),
          width: 320,
          child: Center(
            child: Text(
                "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
                style: TextStyle(
                  color: HexColor('#585858'),
                  fontSize: 15,
                ),
                maxLines: 6,
                overflow: TextOverflow.ellipsis),
          )),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Screenshots',
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
      Container(
        height: 170,
        child: ListView.builder(
          itemCount: screenshots.length,
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
                    width: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor('#9b9b9b'),
                          blurRadius: 10,
                          offset: Offset(0, 12), // Shadow position
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      left: 40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        screenshots[index],
                        fit: BoxFit.cover,
                        width: 120,
                        height: 130,
                      ),
                    )),
              ),
            ]);
          },
        ),
      )
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#ce412e')),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: HexColor('#ffffff'),
            iconSize: 30,
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: Container(
        color: HexColor('#f4f4f4'),
        child: SingleChildScrollView(
          child: Column(
            children: children2,
          ),
        ),
      ),
    );
  }
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/youtube_player/youtube_player.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CoverMovie extends StatefulWidget {
  final VoidCallback addToFavorites;
  final VoidCallback removeFromFavorites;
  final IconData icon;
  final bool switches;
  final IconData icon2;
  final MovieDetailModel movie;

  const CoverMovie({
    required this.addToFavorites,
    required this.removeFromFavorites,
    required this.movie,
    required this.switches,
    this.icon = Icons.add_outlined,
    this.icon2 = Icons.share_outlined,
    Key? key,
  }) : super(key: key);

  @override
  _CoverMovie createState() => _CoverMovie();
}

class _CoverMovie extends State<CoverMovie> {
  InterstitialAd? interstitialAd;
  bool isLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    InterstitialAd.load(
        adUnitId: "ca-app-pub-4975133035299985/9961040605",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
            this.interstitialAd = ad;
          });
          print("Ad Loaded");
        }, onAdFailedToLoad: (error) {
          print('InterstitialAd failed to load: $error');
        }));
  }

  @override
  void initState() {
    super.initState();
  }

  void share(String url) {
    String message = 'Link to the trailer $url';
    RenderBox? box = context.findRenderObject() as RenderBox;

    Share.share(message,
        subject: 'Description',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  bool select = false;
  bool selected() => widget.switches;
  get selecteds => selected();

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
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
                      color: Theme.of(context).shadowColor,
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
                          color: Theme.of(context).shadowColor,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.movie.posterpath,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 258),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(80.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).shadowColor,
                          blurRadius: 14,
                          offset: Offset(0, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => YPlay(
                                      id: widget.movie.trailerId,
                                    )));
                        // if (isLoaded) {
                        //   interstitialAd!.show();
                        // }
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
                            color: Theme.of(context).dividerColor, size: 50.0),
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
                        selecteds
                            ? select
                                ? widget.icon
                                : Icons.check_sharp
                            : select
                                ? Icons.check_sharp
                                : widget.icon,
                        // : Icons.check_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      onPressed: () async {
                        await selecteds
                            ? widget.removeFromFavorites()
                            : widget.addToFavorites();
                        setState(() {
                          // ignore: unnecessary_statements
                          selecteds != selecteds;
                          select = !select;
                        });
                        final snackBar = SnackBar(
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(selecteds
                              ? select
                                  ? 'Фильм удален'
                                  : 'Фильм добавлен'
                              : select
                                  ? 'Фильм добавлен'
                                  : 'Фильм удален'),
                          action: SnackBarAction(
                            label: '',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      //  async { await DBProvider.db.addMovie(testClients)},
                    ),
                    IconButton(
                      icon: Icon(
                        widget.icon2,
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                      onPressed: () => share(widget.movie.homePage),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

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

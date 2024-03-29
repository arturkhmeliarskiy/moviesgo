import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class YPlay extends StatefulWidget {
  String id;
  YPlay({required this.id});
  @override
  _YPlayState createState() => _YPlayState();
}

class _YPlayState extends State<YPlay> {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-4975133035299985/3402235641',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    myBanner.load();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        controller = YoutubePlayerController(
          initialVideoId: widget.id,
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'MOVIEGO',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor, //change your color here
          ),
          elevation: 0,
          centerTitle: true,
        ),
      body: Container(
        child: Column(
          children: [
            YoutubePlayerControllerProvider(
              // Provides controller to all the widget below it.
              controller: controller,
              child: YoutubePlayerIFrame(
                aspectRatio: 16 / 9,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 20),
            //   width: 300,
            //   height: 50,
            //   child: AdWidget(
            //     ad: myBanner,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

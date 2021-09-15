import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// ignore: must_be_immutable
class YPlay extends StatefulWidget {
  String id;
  YPlay({required this.id});
  @override
  _YPlayState createState() => _YPlayState();
}

class _YPlayState extends State<YPlay> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();

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
        backgroundColor: HexColor('#fdfdfd'),
        title: Text(
          'MOVIEGO',
          style: TextStyle(color: HexColor('#4b1d97')),
        ),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          YoutubePlayerControllerProvider(
            // Provides controller to all the widget below it.
            controller: controller,
            child: YoutubePlayerIFrame(
              aspectRatio: 16 / 9,
            ),
          )
        ],
      ),
    );
  }
}

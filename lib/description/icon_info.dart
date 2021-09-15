import 'package:flutter/cupertino.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class IconInfo extends StatelessWidget {
  final DateTime? year;
  final List<dynamic> country;
  final int length;

  const IconInfo({
    required this.year,
    required this.country,
    required this.length,
    Key? key,
  }) : super(key: key);

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2)}h ${parts[1].padLeft(2, '0')}m';
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              LocaleText(
                "Year",
                style: TextStyle(color: HexColor('#585858'), fontSize: 15),
              ),
              Text(
                DateFormat.y().format(DateTime.parse(year.toString())),
                style: TextStyle(
                    color: HexColor('#4b1d97'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              LocaleText(
                "Country",
                style: TextStyle(color: HexColor('#585858'), fontSize: 15),
              ),
              Text(
                country.map((e) => e["iso_3166_1"]).join(''),
                style: TextStyle(
                    color: HexColor('#4b1d97'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            children: [
              LocaleText(
                "Length",
                style: TextStyle(color: HexColor('#585858'), fontSize: 15),
              ),
              Text(
                durationToString(length),
                style: TextStyle(
                    color: HexColor('#4b1d97'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      );
}

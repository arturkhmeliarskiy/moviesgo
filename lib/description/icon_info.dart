import 'package:flutter/cupertino.dart';
import 'package:flutter_app/loading/loading_icon_info.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:moviego_models/movie_detail_model.dart';
import 'package:moviego_repositories/movies_repository.dart';

class IconInfo extends StatelessWidget {
  final int id;

  const IconInfo({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: MoviesRepository().getMovieDetail(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: LoadingIconInfo(),
          );
        }
        final detail = snapshot.data as MovieDetailModel;
        final String dateRelise = DateFormat.y()
            .format(DateTime.parse(detail.releaseDate.toString()));
        final countries =
            detail.productionCountries.map((e) => e["iso_3166_1"]).join('');
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Year',
                  style: TextStyle(color: HexColor('#585858'), fontSize: 15),
                ),
                Text(
                  dateRelise,
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
                  countries,
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
                  'Length',
                  style: TextStyle(color: HexColor('#585858'), fontSize: 15),
                ),
                Text(
                  '${detail.runtime}',
                  style: TextStyle(
                      color: HexColor('#242757'),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        );
      });
}

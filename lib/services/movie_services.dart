import 'dart:ffi';
import 'package:tmdb_api/tmdb_api.dart';

List trendingmovies = [];
final String apikey = '8ec2243bbcaf6f68b4bfd5617cb9e641';
final String redaccesstoken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZWMyMjQzYmJjYWY2ZjY4YjRiZmQ1NjE3Y2I5ZTY0MSIsInN1YiI6IjYxMTU4M2YwMGYwZGE1MDAzMGMzNDRiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7JFIshtVNqDIv8QqlWo9nyqvrhVDU2vQ9f4lha_0ukQ';

loadingmovies() async {
  TMDB tmdbWithCustomLogs = TMDB(
    ApiKeys(apikey, redaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true, //must be true than only all other logs will be shown
      showErrorLogs: true,
    ),
  );
}

class MovieSevice {
  Future<List<MovieModel>> searcMovies(String query) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value([
      MovieModel(
          'I Am Legend',
          'Action',
          '2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://asset.kompas.com/crops/jBO-AFsfJmg8W24iWpKcgz62eL0=/0x71:1000x737/750x500/data/photo/2021/03/05/60417c7703c22.jpg',
          3, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'The Avengers',
          'Action',
          '2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://wallpaperaccess.com/full/240167.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Spider Man',
          'Action',
          '2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://dailyplanetdc.com/wp-content/uploads/2020/11/rfp5iiwah3a51.png',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Interstellar',
          'Action',
          '2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://i.pinimg.com/originals/d1/16/2a/d1162ac53c884190124802335126a4a5.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Game of Thrones',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://i.pinimg.com/originals/82/01/5c/82015cc18436c4514c02e1be5e9667cb.jpg',
          3, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Vikings',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/I/91qgbTbng+L._RI_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Gotham',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Power',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Narcos',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          3, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Breaking Bad',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
    ]);
  }

  Future<List<MovieModel>> getGenres() async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value([
      MovieModel(
          'ADVENTURE',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'KIDS',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'FICTION',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'ADVENTURE',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'FANTASY',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'COMEDY',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjM4MzExNDAyNl5BMl5BanBnXkFtZTgwOTAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
    ]);
  }

  Future<List<MovieModel>> getMyList(String query) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value([
      MovieModel(
          'Assassins Creed',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://staticctf.akamaized.net/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4ZyYphQO033pcqNuyhgRad/96c72be8c9369e883f456790d6fe1e8b/ent-filmtv-acmovie-product-about-boxshot.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Luke Cage',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BOTYzOTQyNDYxNl5BMl5BanBnXkFtZTgwNzA1NDU4OTE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'The Wolf of Wall Street',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Mayaboti',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Game of Thrones',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Vikings',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Gotham',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Power',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Narcos',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Breaking Bad',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
    ]);
  }

  Future<List<MovieModel>> getPopular(String query) async {
    await Future.delayed(Duration(seconds: 4));
    return Future.value([
      MovieModel(
          'Fast & Furious 9',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_FMjpg_UX1000_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Warcraft',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://deepfocusreview.com/wp-content/uploads/2016/12/warcraft.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'The Wolf of Wall Street',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Mayaboti',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Game of Thrones',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Vikings',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Gotham',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Power',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Narcos',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          4, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
      MovieModel(
          'Breaking Bad',
          'Action',
          ' 2012',
          'Belarus',
          '150',
          "Marvel's The Avengers, also known as The Avengers and Avengers Assemble, is a 2012 superhero film, based on the Marvel Comics superhero team of the same name. The film is a crossover/sequel to Iron Man, The Incredible Hulk, Iron Man 2, Thor, and Captain America: The First Avenger. It is the sixth film in the Marvel Cinematic Universe and the sixth and final film of Phase One. The film was released on April 25, 2012 internationally and on May 4, 2012 in the United States.",
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          5, [
        'https://c4.wallpaperflare.com/wallpaper/91/530/518/star-lord-spider-man-drax-the-destroyer-iron-man-wallpaper-preview.jpg',
        'https://cdn.vox-cdn.com/thumbor/3kFqt6CkY0de8j-DJKcLEHwK0bY=/1400x1050/filters:format(png)/cdn.vox-cdn.com/uploads/chorus_asset/file/9773181/Screen_Shot_2017_11_29_at_8.29.28_AM.png',
        'https://images.indianexpress.com/2019/04/thor-avengers-endgame-1200.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYVW1aNzlTTbF_eKNXA_oW0_j-YyUsfKRxhPMHkv_dZ-UB28DrWSoJEo8GdsIvEyyATc4&usqp=CAU',
        'https://c4.wallpaperflare.com/wallpaper/810/472/29/movies-screenshots-tony-stark-robert-downey-jr-marvel-comics-loki-marvel-tom-hiddleston-the-avengers-entertainment-movies-hd-art-wallpaper-preview.jpg'
      ]),
    ]);
  }
}

class MovieModel {
  final String title;
  final String genre;
  final String year;
  final String country;
  final String lenght;
  final String description;
  final String imageUrl;
  final num stars;
  final List screenshots;
  MovieModel(this.title, this.genre, this.year, this.country, this.lenght,
      this.description, this.imageUrl, this.stars, this.screenshots);
}

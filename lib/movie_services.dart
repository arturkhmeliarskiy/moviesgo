class MovieSevice {
  Future<List<MovieModel>> searcMovies(String query) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value([
      MovieModel(
          'I Am Legend',
          'https://asset.kompas.com/crops/jBO-AFsfJmg8W24iWpKcgz62eL0=/0x71:1000x737/750x500/data/photo/2021/03/05/60417c7703c22.jpg',
          3),
      MovieModel(
          'The Avengers', 'https://wallpaperaccess.com/full/240167.jpg', 4),
      MovieModel(
          'Spider Man',
          'https://dailyplanetdc.com/wp-content/uploads/2020/11/rfp5iiwah3a51.png',
          5),
      MovieModel(
          'Interstellar',
          'https://i.pinimg.com/originals/d1/16/2a/d1162ac53c884190124802335126a4a5.jpg',
          4),
      MovieModel(
          'Game of Thrones',
          'https://i.pinimg.com/originals/82/01/5c/82015cc18436c4514c02e1be5e9667cb.jpg',
          3),
      MovieModel(
          'Vikings',
          'https://images-na.ssl-images-amazon.com/images/I/91qgbTbng+L._RI_.jpg',
          5),
      MovieModel(
          'Gotham',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5),
      MovieModel(
          'Power',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'Narcos',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          3),
      MovieModel(
          'Breaking Bad',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          4),
    ]);
  }

  Future<List<MovieModel>> getGenres() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value([
      MovieModel(
          'ACTION',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0MTI2NjMzMzFeQTJeQWpwZ15BbWU2MDMwNDc3OA@@._V1_.jpg',
          3),
      MovieModel(
          'ADVENTURE',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          4),
      MovieModel(
          'KIDS',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4),
      MovieModel(
          'FICTION',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4),
      MovieModel(
          'ACTION',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          3),
      MovieModel(
          'ADVENTURE',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'FANTASY',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5),
      MovieModel(
          'COMEDY',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjM4MzExNDAyNl5BMl5BanBnXkFtZTgwOTAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg',
          5),
    ]);
  }

  Future<List<MovieModel>> getMyList(String query) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value([
      MovieModel(
          'Assassins Creed',
          'https://staticctf.akamaized.net/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/4ZyYphQO033pcqNuyhgRad/96c72be8c9369e883f456790d6fe1e8b/ent-filmtv-acmovie-product-about-boxshot.jpg',
          4),
      MovieModel(
          'Luke Cage',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BOTYzOTQyNDYxNl5BMl5BanBnXkFtZTgwNzA1NDU4OTE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg',
          4),
      MovieModel(
          'The Wolf of Wall Street',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          5),
      MovieModel(
          'Mayaboti',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          5),
      MovieModel(
          'Game of Thrones',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          4),
      MovieModel(
          'Vikings',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'Gotham',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5),
      MovieModel(
          'Power',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'Narcos',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          5),
      MovieModel(
          'Breaking Bad',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          5),
    ]);
  }

  Future<List<MovieModel>> getPopular(String query) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value([
      MovieModel(
          'Fast & Furious 9',
          'https://m.media-amazon.com/images/M/MV5BMjI0NmFkYzEtNzU2YS00NTg5LWIwYmMtNmQ1MTU0OGJjOTMxXkEyXkFqcGdeQXVyMjMxOTE0ODA@._V1_FMjpg_UX1000_.jpg',
          4),
      MovieModel(
          'Warcraft',
          'https://deepfocusreview.com/wp-content/uploads/2016/12/warcraft.jpg',
          5),
      MovieModel(
          'The Wolf of Wall Street',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4),
      MovieModel(
          'Mayaboti',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg',
          4),
      MovieModel(
          'Game of Thrones',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg',
          5),
      MovieModel(
          'Vikings',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'Gotham',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg',
          5),
      MovieModel(
          'Power',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg',
          4),
      MovieModel(
          'Narcos',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg',
          4),
      MovieModel(
          'Breaking Bad',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg',
          5),
    ]);
  }
}

class MovieModel {
  final String title;
  final String imageUrl;
  final num stars;
  MovieModel(this.title, this.imageUrl, this.stars);
}

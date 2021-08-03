class MovieSevice {
  Future<List<MovieModel>> searcMovies(String query) async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value([
      MovieModel('I Am Legend',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0MTI2NjMzMzFeQTJeQWpwZ15BbWU2MDMwNDc3OA@@._V1_.jpg'),
      MovieModel('The Avengers',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg'),
      MovieModel('The Wolf of Wall Street',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
      MovieModel('Interstellar',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg'),
      MovieModel('Game of Thrones',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg'),
      MovieModel('Vikings',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg'),
      MovieModel('Gotham',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg'),
      MovieModel('Power',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_SX1500_AL_.jpg'),
      MovieModel('Narcos',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg'),
      MovieModel('Breaking Bad',
          'https://images-na.ssl-images-amazon.com/images/M/MV5BMTM4NDcyNDMzMF5BMl5BanBnXkFtZTgwOTI0MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg'),
    ]);
  }

  Future<List<String>> getGenres(String query) async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value([
      'Action',
      'Adventure',
      'Kids',
      'Fiction',
      'Action',
      'Adventure',
      'Kids',
      'Fiction',
    ]);
  }
}

class MovieModel {
  final String title;
  final String ImageUrl;
  MovieModel(this.title, this.ImageUrl);
}

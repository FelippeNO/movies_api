import 'package:flutter_modular/flutter_modular.dart';

class CoreNavigator {
  static AuthModuleNavigator get auth => AuthModuleNavigator();
  static MovieModuleNavigator get movie => MovieModuleNavigator();
}

class AuthModuleNavigator {}

class MovieModuleNavigator {
  void goToHomeView() {
    Modular.to.pushNamed(('/movie/'));
  }

  void goToDetailedView({required int movieId}) {
    Modular.to.pushNamed('/movie/detailed', arguments: movieId);
  }
}

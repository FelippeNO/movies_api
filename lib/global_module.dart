import 'package:desafio_tokenlab/movie_module/movie_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_module/auth_module.dart';

class GlobalModule extends Module {
  @override
  List<Module> imports = [
    AuthModule(),
    MovieModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute('/movie', module: MovieModule()),
  ];
}

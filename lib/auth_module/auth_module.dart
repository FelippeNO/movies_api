import 'package:flutter_modular/flutter_modular.dart';

import '../presentation/views/login_view.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginView()),
  ];
}

import 'package:ember_account_book/Mine..dart';
import 'package:ember_account_book/Tab.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../Home.dart';

class AppModule extends Module {

  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [];
  // Provide all the routes for your module
  final List<ModularRoute>  routes = [
      // Simple route using the ChildRoute
      ChildRoute('/', child: (_, __) => Tab()),
      ChildRoute('/mine', child: (_, __) => MinePage())
      // ChildRoute('/', child: (_, __) => AnimatedButton())
  ];
}
import 'package:flutter_modular/flutter_modular.dart';

import 'get_folder_page.dart';

class GetFolderModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers =>
      [Router(Modular.initialRoute, child: (_, __) => GetFolderPage())];
}

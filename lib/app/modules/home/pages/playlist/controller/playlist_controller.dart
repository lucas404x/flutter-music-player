import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlayListController = _PlayListControllerBase with _$PlayListController;

abstract class _PlayListControllerBase with Store {
  void onPressed() {}
}

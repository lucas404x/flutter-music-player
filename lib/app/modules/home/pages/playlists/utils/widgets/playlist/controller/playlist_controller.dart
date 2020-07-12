import 'package:mobx/mobx.dart';
part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  void addNewSong() {}
}

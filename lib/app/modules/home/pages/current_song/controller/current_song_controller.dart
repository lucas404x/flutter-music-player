import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/models/song.dart';
import 'package:flutter_music_player/app/modules/home/pages/current_song/utils/widgets/play_button/play_button.dart';
import 'package:flutter_music_player/app/modules/home/stores/home_store.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:mobx/mobx.dart';

part 'current_song_controller.g.dart';

class CurrentSongController = _CurrentSongControllerBase
    with _$CurrentSongController;

abstract class _CurrentSongControllerBase with Store {
  HomeStore _homeStore = Modular.get<HomeStore>();

  Duration _songDuration;
  Duration get songDuration => _songDuration;

  Song _song;
  Song get song => _song;

  @observable
  Duration _currentDuration;
  @computed
  Duration get currentDuration => _currentDuration;

  Function get limitText => _homeStore.limitText;

  Widget _innerWidget = PlayButton();

  _CurrentSongControllerBase() {
    _song = _homeStore.song;
    if (_homeStore.song != null) {
      init();
    }
  }

  init() async {
    AudioPlayer.logEnabled = true;
    await playSong();
    await getDuration();
    getProgress();
    _homeStore.audioPlayer.onPlayerCompletion.listen(_restart);
  }

  playSong() async {
    await _homeStore.audioPlayer.play(_song.path, isLocal: true);
  }

  @action
  getProgress() {
    _homeStore.audioPlayer.onAudioPositionChanged
        .listen((Duration currentDuration) {
      _currentDuration = currentDuration;
    });
  }

  getDuration() async {
    _songDuration = await FlutterSoundHelper().duration(_song.path);
  }

  String currentProgressFormated(Duration duration) {
    String minutes = duration.inMinutes.toString();
    minutes = minutes.length > 1 ? minutes : '0' + minutes;
    String seconds = (duration.inSeconds % 60).toString();
    seconds = seconds.length > 1 ? seconds : '0' + seconds;
    return "$minutes:$seconds";
  }

  Widget innerWidget(double v) {
    return _innerWidget;
  }

  _restart(event) async {
    _homeStore.audioPlayer.dispose();
    _homeStore.audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _homeStore.getRandomSong();
    Modular.get<HomeController>().changeCurrentIndex(2, isRestart: true);
  }
}

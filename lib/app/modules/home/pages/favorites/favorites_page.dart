import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_music_player/app/modules/home/pages/favorites/controller/favorites_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/shuffle_button/shuffle_button.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/song_tile/song_tile_widget.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesController = FavoritesController();

  @override
  void dispose() {
    favoritesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(children: <Widget>[
          SizedBox(
            height: 135,
          ),
          Expanded(
            child: AnimatedList(
                controller: favoritesController.scrollController,
                key: favoritesController.songFavoriteKey,
                itemBuilder: (context, index, animation) {
                  return FadeTransition(
                    opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
                    child: SongTile(favoritesController.favorites[index]),
                  );
                },
                initialItemCount: favoritesController.favorites.length),
          )
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Observer(
                builder: (_) => AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: favoritesController.shuffleButtonOrNot,
                  child: ShuffleButton(
                    songs: favoritesController.favorites,
                    activate: favoritesController.showButton,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        )
      ],
    );
  }
}

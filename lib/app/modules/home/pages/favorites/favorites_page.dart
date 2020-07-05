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
  String filterText = '';

  @override
  void dispose() {
    filterText = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesController = FavoritesController(filterText);

    return Stack(
      children: <Widget>[
        Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              onChanged: (String text) {
                setState(() {
                  filterText = text.trim();
                });
              },
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: AnimatedList(
                controller: favoritesController.scrollController,
                key: favoritesController.songFavoriteKey,
                itemBuilder: (context, index, animation) {
                  return favoritesController
                          .showSong(favoritesController.favorites[index])
                      ? FadeTransition(
                          opacity: animation.drive(Tween(begin: 0.0, end: 1.0)),
                          child: SongTile(
                              song: favoritesController.favorites[index],
                              songs: favoritesController.favorites),
                        )
                      : null;
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

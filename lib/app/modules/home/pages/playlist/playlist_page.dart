import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/pages/playlist/controller/playlist_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/button/button.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    final playlistController = PlayListController();
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 0, 60),
                  child: Text(
                    'Playlist',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 48),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => Container(),
                  itemCount: 0,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Button(
                height: 52,
                width: 328,
                title: 'Create a new playlist',
                onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (_) => Container(
                    height: screenSize.height * 0.35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller:
                                playlistController.textEditingController,
                            decoration: InputDecoration(
                              hintText: 'Playlist name',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Button(
                          title: 'Create playlist',
                          height: 40,
                          width: 300,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}

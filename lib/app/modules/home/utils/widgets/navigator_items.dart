import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

List<CustomNavigationBarItem> navigatorItems() => [
      CustomNavigationBarItem(icon: Icons.list, selectedTitle: 'Songs'),
      CustomNavigationBarItem(
          icon: Icons.playlist_play, selectedTitle: 'Playlists'),
      CustomNavigationBarItem(icon: Icons.play_arrow, selectedTitle: 'Play'),
      CustomNavigationBarItem(icon: Icons.favorite, selectedTitle: 'Favorites'),
      CustomNavigationBarItem(icon: Icons.settings, selectedTitle: 'Settings')
    ];

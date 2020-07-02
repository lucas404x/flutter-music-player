import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_music_player/app/modules/home/controller/home_controller.dart';
import 'package:flutter_music_player/app/modules/home/utils/widgets/navigator_items.dart';

import 'utils/constants/order_by_enum.dart';
import 'utils/widgets/dropdown_items.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Modular.get<HomeController>();

    return Observer(
      builder: (_) => Scaffold(
          backgroundColor: Colors.white,
          appBar: homeController.showAppBar
              ? AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(4.5),
                    child: DropdownButton<OrderBy>(
                      isExpanded: true,
                      icon: Container(),
                      underline: Container(),
                      items: dropDownItems(),
                      onChanged: homeController.onChanged,
                      hint: Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                )
              : null,
          bottomNavigationBar: CustomNavigationBar(
            backgroundColor: Colors.white,
            selectedColor: Colors.orange,
            strokeColor: Colors.orange,
            elevation: 20.0,
            currentIndex: homeController.currentIndex,
            scaleCurve: Curves.easeInOutCirc,
            scaleFactor: 0.5,
            onTap: homeController.changeCurrentIndex,
            items: navigatorItems(),
          ),
          body: homeController.currentPage),
    );
  }
}

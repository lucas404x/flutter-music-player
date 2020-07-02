import 'package:flutter/material.dart';
import 'package:flutter_music_player/app/modules/home/utils/constants/order_by_enum.dart';

List<DropdownMenuItem<OrderBy>> dropDownItems() => [
      DropdownMenuItem<OrderBy>(
        child: Text('A-Z'),
        value: OrderBy.az,
      ),
      DropdownMenuItem<OrderBy>(
        child: Text('Z-A'),
        value: OrderBy.za,
      ),
      DropdownMenuItem<OrderBy>(
        child: Text('Earliest'),
        value: OrderBy.earliest,
      ),
      DropdownMenuItem<OrderBy>(
        child: Text('Latest'),
        value: OrderBy.latest,
      )
    ];

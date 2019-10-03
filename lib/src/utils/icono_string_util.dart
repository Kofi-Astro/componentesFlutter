 import 'package:flutter/material.dart';

  //maps of icons
 final _icons = <String, IconData>{

   'add_alert'          : Icons.add_alert,
   'accessibility'      : Icons.accessibility,
   'folder_open'        : Icons.folder_open,
   'animated_container' : Icons.play_circle_outline,
   'input'              : Icons.input,
   'slider'             : Icons.tune,
   'list'               : Icons.list, 
 };

  Icon getIcon(String iconName) {
    return Icon(_icons[iconName], color: Colors.blue);
  }

import 'package:componentes_curso/src/pages/alert_page.dart';
import 'package:componentes_curso/src/pages/animated_container_page.dart';
import 'package:componentes_curso/src/pages/avatar_page.dart';
import 'package:componentes_curso/src/pages/card_page.dart';
import 'package:componentes_curso/src/pages/home_page.dart';
import 'package:componentes_curso/src/pages/input_page.dart';
import 'package:componentes_curso/src/pages/listview_page.dart';
import 'package:componentes_curso/src/pages/slider_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> getApplicationRoutes() => <String, WidgetBuilder> {

  '/'         : (BuildContext context) => HomePage(),
  'alert'     : (BuildContext context) => AlertPage(),
  'avatar'    : (BuildContext context) => AvatarPage(),
  'card'      : (BuildContext context) => CardPage(),
  'animated'  : (BuildContext context) => AnimatedContainerPage(), 
  'inputs'    : (BuildContext context) => InputPage(),
  'sliders'   : (BuildContext context) => SliderPage(),
  'lists'     : (BuildContext context) => ListViewPage(),
};





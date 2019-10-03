import 'package:componentes_curso/src/providers/menu_provider.dart';
import 'package:componentes_curso/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(), 
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _loadlist(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _loadlist(List<dynamic> data, BuildContext context) {
     final List<Widget> opciones = [];

     data.forEach((opt) {
       final widgetTemp = ListTile(
         title: Text(opt['texto']),
         leading: getIcon(opt['icon']),
         trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        
         onTap: (){

           Navigator.pushNamed(context, opt['ruta']);

           /* 
           * Forma de navegar entre pantallas.
           * 
           final route = MaterialPageRoute(
             builder: (context) => AlertPage()
           );
           
           Navigator.push(context, route); */
         },
       );

       opciones.add(widgetTemp); 
     }); 

     return opciones;
  }
}
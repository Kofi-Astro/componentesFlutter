import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget {

  final items = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp'),
      ),
      body: ListView(
        children: _loadListWitOthersProperties()
      ),   
    );
  }


  //Metodo tradicional para cargar listas
  List<Widget> _loadList() {
    List<Widget> resultlist = List<Widget>();

    for (var opt in items) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      resultlist.add(tempWidget);
    }

    return resultlist;
  }

  //Metodo para cargar listas usando el map.
  List<Widget> _loadListWithMap() {

    return items.map((item) { 
      return ListTile( 
        title: Text(item + ' with map')
        );
        }).toList();
  }

  //metodo para cargar listas con map y mas propiedades.
  List<Widget> _loadListWitOthersProperties() {
    return items.map((item) {
        return ListTile(
          title: Text(item),
          subtitle: Text('es un subtitle'),
          leading: Icon(Icons.card_membership), //icono al principio
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        );
    }).toList();
  }


}
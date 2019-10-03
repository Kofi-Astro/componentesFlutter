import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  TextEditingController _controllerFecha = new TextEditingController();
  List<String> _listPoderes = ['Volar', 'Super Rayos', 'Super Aliento', 'Super Fuerza'];
  String _opcionSeleccionada = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearDropdown(),
            Divider(),
            _crearPersona()
          ],
        ),

      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Caracteres ${ _nombre.length }'),
        hintText: 'Ingrese nombre',
        labelText: 'Nombre',
        icon: Icon(Icons.person_outline),
        suffixIcon: Icon(Icons.accessibility),
        helperText: 'Es una ayuda'
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Ingrese correo',
        labelText: 'Correo',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Ingrese password',
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_open),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _controllerFecha,
      decoration: InputDecoration(
        hintText: 'Ingrese fecha',
        labelText: 'Ingrese fecha',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.perm_contact_calendar),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      } ,
    );
  }

  _selectDate(BuildContext context) async {

    DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      locale: const Locale('es', 'ES')
    );

    if (dateTime != null) {

      final format = new DateFormat('dd-MM-yyyy');
      _controllerFecha.text = format.format(dateTime);
    }
  }

  Widget _crearDropdown() {
    
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        Expanded(
          child: DropdownButton(
          value: _opcionSeleccionada,
          items: _getOptionsDropDown(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        ),
        )
      ],
    );
    
    
    
  }

  List<DropdownMenuItem<String>> _getOptionsDropDown() {
    List<DropdownMenuItem<String>>  list = new List();
    _listPoderes.forEach((poder) {
      list.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
        ));
    });

    return list;
  }

  Widget _crearPersona() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(('Nombre: $_nombre')),
        Text(('Email: $_email')),
        Text('Poder: $_opcionSeleccionada'),
      ],
    );
  }
}
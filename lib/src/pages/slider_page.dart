import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _sliderValor = 100.0;  
  bool _blockCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBoxListTile(),
            _crearSwitch(),
            _crearImagen(),
          ],
        ),
      )
    );
  }

  Widget _crearSlider() {

    return Slider(
      label: 'valor',
   // divisions: 20,
      activeColor: Colors.deepOrange,
      value: _sliderValor,
      min: 10,
      max: 400,
      //un if abreviado
      onChanged: (_blockCheck)? null : (opt) {
        setState(() {
          _sliderValor = opt;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Expanded(
      child: Image(
        image: NetworkImage("http://media.comicbook.com/uploads1/2015/04/the-new-52-futures-end-44-2015-page-4-600x922-130949.jpg"),
        width: _sliderValor,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _crearCheckBox() {

    return Checkbox(
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _crearCheckBoxListTile() {

    return CheckboxListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.deepOrange,
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear slider'),
      activeColor: Colors.deepOrange,
      value: _blockCheck,
      onChanged: (value) {
        setState(() {
          _blockCheck = value;
        });
      },
    );
  }
}
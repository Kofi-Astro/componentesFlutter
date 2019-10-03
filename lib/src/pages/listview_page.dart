import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {

  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {


  ScrollController _scrollController = new ScrollController();
  List<int> _listaNros = new List();
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _crear10();
    _scrollController.addListener(() {

      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
       // _crear10();
       _fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Page'),
      ),
      body: Stack(
          children: <Widget>[
            _crearList(),
            _crearLoading(),
          ],
        ),
    );
  }

  Widget _crearList()  {

    return RefreshIndicator(
      onRefresh: _obtainFirstPage, //Solo hago referencia al método. Lo llamo sin los parentecis.
      child: ListView.builder(
        controller: _scrollController, 
        itemCount: _listaNros.length,
        itemBuilder: (BuildContext context, int index ){

          final imagen = _listaNros[index];

          return FadeInImage(
            fit: BoxFit.fill,
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage('assets/loading.gif'),
          );
        }, 
      ),
    );
  }

  void _crear10() {

    for(int i = 0; i <10; i++) {
      _lastItem++;
      _listaNros.add(_lastItem);
    }

    setState(() {
      
    });
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final _duration = new Duration(seconds: 2);
    return new Timer(_duration, _requestHttp);
  }

  void _requestHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );
    _crear10();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Widget _crearLoading() {

    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
              ),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Future _obtainFirstPage() async {
    final _duration = new Duration(seconds: 2);

    new Timer(_duration, () {
      _listaNros.clear();
      _lastItem++; //aca podría resetearlo a 0.
      _crear10();
    });

    return Future.delayed(_duration);
  }
}
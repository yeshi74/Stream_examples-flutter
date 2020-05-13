import 'dart:async';
import 'package:bloc/streamMethod2.dart';
import 'package:flutter/material.dart';

class StreamMethod1 extends StatefulWidget {
  @override
  _StreamMethod1State createState() => _StreamMethod1State();
}

class _StreamMethod1State extends State<StreamMethod1> {

  final StreamController _streamController = StreamController();

  void addDataToStream() async {
    for(int i = 1; i<= 30; i++) {
    await Future.delayed(Duration(seconds: 1));
    _streamController.sink.add(i);
    }
  }

  @override
  void initState() {
    super.initState();
    addDataToStream();
  }

  @override
  void dispose() { 
    super.dispose();
    _streamController.close();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream Method 1'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
          child: StreamBuilder(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              if(snapshot.hasError)
              return Text('There is an error');
              else if(snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();
              return Text('${snapshot.data}',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            },
          ),
        ),
        RaisedButton(
          color: Colors.amberAccent,
          elevation: 8.0,
          child: Text(
            'Stream Method 2',
            style: TextStyle(
              fontSize: 20.0,
            ),
            ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => StreamMethod2()
            ));
          },
        ),
          ],
        )
         
      );
  }
}
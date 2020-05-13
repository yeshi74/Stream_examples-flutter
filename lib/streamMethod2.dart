import 'package:bloc/streamMethod3.dart';
import 'package:flutter/material.dart';

class StreamMethod2 extends StatefulWidget {
  @override
  _StreamMethod2State createState() => _StreamMethod2State();
}

class _StreamMethod2State extends State<StreamMethod2> {

  Stream<int> numberStream() async*{
    for(int i = 1; i<= 30; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream Method 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StreamBuilder(
            stream: numberStream(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
              } else {
                return Text('${snapshot.data}',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.deepOrange,
                  ),
                );
              }
            },
          ),
          RaisedButton(
            color: Colors.greenAccent,
            child: Text('Stream Method 3',
            style: TextStyle(
              fontSize: 20.0,
            ),),
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => StreamMethod3(),
              ),
              );
            },
          )
          ],)
        ),
      );
  }
}
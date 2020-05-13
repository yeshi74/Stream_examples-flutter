import 'package:flutter/material.dart';

class StreamMethod3 extends StatefulWidget {
  @override
  _StreamMethod3State createState() => _StreamMethod3State();
}

class _StreamMethod3State extends State<StreamMethod3> {

  Stream<int> specificData() async* {
    for(int i = 1; i<= 26; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Method 3')
      ),
      body: Center(
        child: StreamBuilder(
          stream: specificData().map((yeshi) => "Yeshi'\s age is: $yeshi"),
          builder: (context, snapshot) {
            return Text('${snapshot.data}',
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.pinkAccent,
            ),
            );
          },
        ),
      ),
    );
  }
}
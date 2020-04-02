import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {
  @override //override the build function in the stateless widget
  Widget build(BuildContext context) {  //Widget is the return type
    return Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
        centerTitle: true,
        backgroundColor: Colors.blue[100],
      ),
      body: Row(
        children: <Widget>[
          Expanded(
              child: Image.network('https://images.unsplash.com/photo-1584917592742-15addb5a4251?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=648&q=80'),
            flex: 3
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30.0),
              color: Colors.cyan,
              child: Text('1')
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.pinkAccent,
                child: Text('2')
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
                padding: EdgeInsets.all(30.0),
                color: Colors.amber,
                child: Text('3')
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('Click me'),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[100],
        child: Text('Yosko'),
      ),
    );
  }
}
//use containers to add padding and margin
//stateless widgets cannot have changing data
//appBar property has a widget AppBar similarly Scaffold is a widget from the home property
//always need to have properties inside widgets, cannot only nest widgets into widgets

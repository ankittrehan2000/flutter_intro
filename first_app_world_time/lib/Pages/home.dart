import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Variable to store data from other screen
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;    //arguments that we recieved from the other screen

    //do not want to overwrite the data from the other screen so check if the map is empty then do stuff
    String bgImage = data['isDayTime'] ? 'day.jpeg' : 'night.jpeg';

    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: SafeArea(
              child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0.0,0.0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDayTime': result['isDayTime'],
                      };
                    });
                  }, icon: Icon(
                      Icons.edit_location,
                    color: data['isDayTime'] ? Colors.black: Colors.white,
                  ), label: Text(
                      'Edit Location',
                      style: TextStyle(
                        color: data['isDayTime'] ? Colors.black: Colors.white,
                      )
                  )),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          color: data['isDayTime'] ? Colors.black: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0
                        )
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data['time'],
                    style: TextStyle(
                        color: data['isDayTime'] ? Colors.black: Colors.white,
                      fontSize: 66.0
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
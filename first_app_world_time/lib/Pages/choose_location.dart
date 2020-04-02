import 'package:firstappworldtime/services/world_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'https://images.unsplash.com/photo-1562884328-39da45501a9c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'https://images.unsplash.com/photo-1494419470281-65c2b001a42b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=931&q=80'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'https://images.unsplash.com/photo-1551009175-15bdf9dcb580?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'https://images.unsplash.com/photo-1551009175-15bdf9dcb580?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'https://images.unsplash.com/photo-1551009175-15bdf9dcb580?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'https://images.unsplash.com/photo-1562884328-39da45501a9c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'https://images.unsplash.com/photo-1551792705-7b35939eb1a8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'https://images.unsplash.com/photo-1551009175-15bdf9dcb580?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //now navigate to home screen but we need to pop it off since the home is already under the screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,   //determines how many items to render
        itemBuilder: (context, index){
          //return a template
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location), //index is just a variable that is default and uses to render texts
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(locations[index].flag),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

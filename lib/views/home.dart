import 'package:flutter/material.dart';
import 'package:petleo_project/constants/colors.dart';
import 'package:petleo_project/services/pet_data_service.dart';
import 'package:petleo_project/views/pulse_chart.dart';
import 'package:petleo_project/views/temperature_chart.dart';
import 'package:provider/provider.dart';

import '../locators.dart';
import 'weight_chart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    locator<PetDataService>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List? petProperties = Provider.of<PetDataService>(context).users;
    bool isLoading = Provider.of<PetDataService>(context).isLoading;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        actions: [
          IconButton(icon: Icon(Icons.album_rounded,color: accentColor,),onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PulseScreen();
              },
            ),
          );},),
          IconButton(icon: Icon(Icons.waves,color: complementaryColor,),onPressed: (){Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TemperatureScreen();
              },
            ),
          );},),
          IconButton(icon: Icon(Icons.ac_unit),onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WeightScreen();
              },
            ),
          );
        },),],

        title: Text('PetLEO'),
      ),
      body: (isLoading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: petProperties!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      petProperties[index]["type"]!,

                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    subtitle: Text(
                        petProperties[index]["value"].toString() +" "+ petProperties[index]["unit"]
,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: Text(                      DateTime.parse(petProperties[index]["timestamp"]).toString().split(" ")[0] + " " + DateTime.parse(petProperties[index]["timestamp"]).toString().split(" ")[1].substring(0,5),
                    ),
                  ),
                );
              }),
    );
  }
}

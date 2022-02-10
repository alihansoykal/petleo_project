import 'package:flutter/material.dart';
import 'package:petleo_project/constants/colors.dart';
import 'package:petleo_project/services/pet_data_service.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../locators.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  @override
  void initState() {
    super.initState();
    locator<PetDataService>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    List? users = Provider.of<PetDataService>(context).users;
    List<_PetData> data = [
      _PetData(DateTime.parse(users![8]["timestamp"]).toString().split(" ")[0],
          users[8]["value"]),
      _PetData(DateTime.parse(users[9]["timestamp"]).toString().split(" ")[0],
          users[9]["value"]),
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: Text("TEMPERATURE"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_PetData, String>>[
                  LineSeries<_PetData, String>(
                      width: 2,
                      dataSource: data,
                      xValueMapper: (_PetData sales, _) => sales.date,
                      yValueMapper: (_PetData sales, _) => sales.property,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
        ));
  }
}

class _PetData {
  _PetData(this.date, this.property);

  final String date;
  final int property;
}

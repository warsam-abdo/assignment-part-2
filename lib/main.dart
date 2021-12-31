import 'package:flutter/material.dart';
import 'container.dart';


class Device {

  late String name;
  late IconData icon;
  late List<bool> power;
  late String category ;


  Device(String name, IconData icon, String category ){
    this.name = name;
    this.icon = icon;
    this.power = [false];
    this.category = category;

  }

}
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Device> devices = [

    Device("CVV camera", Icons.add_a_photo,"Living Room"),
    Device("Television", Icons.tv,"Living Room"),
    Device("bedroom-Television", Icons.tv,"Bedroom"),
    Device("Computer", Icons.computer,"Bedroom"),
    Device("Xbox", Icons.sports_esports,"Bedroom"),
    Device("Air Condition 1", Icons.ac_unit,"Living Room"),
    Device("Air Condition 2", Icons.ac_unit,"Bedroom"),

  ];

  late List<Device> livingRoom = devices.where((device) => device.category == "Living Room" ).toList();
  late List<Device> bedRoom = devices.where((device) => device.category == "Bedroom" ).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
                title: Text('                                   IOT'),
                backgroundColor: Colors.lightGreen,
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "All Devices"),
                    Tab(text: "main Bedroom"),
                    Tab(text: "Living Room") ,
                  ],
                ),
              ),
              body: TabBarView(
                  children: [
                                        //first Tap//
                    Container(
                      color: Colors.grey[100] ,
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),

                      child: GridView.count(
                        childAspectRatio: (140 / 100),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        children: devices.map((device) {
                          return DeviceContainer(device);
                        }).toList(),
                      ),
                    ),

                                          // second Tap //
                    Container(
                      color: Colors.grey[100] ,
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),

                      child: GridView.count(
                        childAspectRatio: (140 / 100),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        children: bedRoom.map((device) {
                          return DeviceContainer(device);
                        }).toList(),
                      ),
                    ),

                                                    // thirdTap 3//
                    Container(
                      color: Colors.grey[100] ,
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),

                      child: GridView.count(
                        childAspectRatio: (140 / 100),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        children: livingRoom.map((device) {
                          return DeviceContainer(device);
                        }).toList(),
                      ),
                    ),
                  ]
              )
          ),
        )
    );
  }
}
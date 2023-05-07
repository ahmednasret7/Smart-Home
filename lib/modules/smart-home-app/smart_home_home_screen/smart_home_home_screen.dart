import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
class RunningDevices
{
  late final String name;
  late final String time;
  late final Icon icon;
  RunningDevices({
    required this.name,
    required this.time,
    required this.icon,
});
}

class Rooms
{
  late final String name;
  late final Icon icon;
  Rooms({
    required this.name,
    required this.icon,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
String name = "Ahmed";
var logoColor = Colors.black;
const logocolor2 = const Color(0xff6994FE);
const box_back_color = const Color(0xffE3EDF7);
List <RunningDevices> devices = [
  RunningDevices(
      name: 'Air Conditioner',
      time: DateFormat('hh').format(DateTime.now()),
      icon: const Icon(Icons.ac_unit_sharp),
  ),
  RunningDevices(
      name: 'TV',
      time: DateFormat('hh').format(DateTime.now()),
      icon: const Icon(Icons.tv_sharp),
  ),
  RunningDevices(
      name: 'Washing Machine',
      time: DateFormat('hh').format(DateTime.now()),
      icon: const Icon(Icons.local_laundry_service_sharp),
  ),
  RunningDevices(
      name: 'Heater',
      time: DateFormat('hh').format(DateTime.now()),
      icon: const Icon(Icons.water_sharp),
  ),
  RunningDevices(
      name: 'Dryer',
      time: DateFormat('hh').format(DateTime.now()),
      icon: const Icon(Icons.dry_cleaning_rounded),
  ),
];
List <Rooms> rooms = [
  Rooms(name: 'Living Room', icon: const Icon(Icons.chair_sharp)),
  Rooms(name: 'Bedroom', icon: const Icon(Icons.bed_sharp)),
  Rooms(name: 'Kitchen', icon: const Icon(Icons.kitchen_sharp)),
  Rooms(name: 'Bathroom', icon: const Icon(Icons.bathtub_sharp)),
  Rooms(name: 'Garage', icon: const Icon(Icons.garage_sharp)),
  Rooms(name: 'Garden', icon: const Icon(Icons.nature_people_sharp)),
];
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10 ,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                      'Hello, $name!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon: Icon(
                          Icons.settings,
                        size: 40,
                        color: logoColor,
                      ),
                  ),
                ],
              ),
            ),

            //Space between app bar and clock
            // SizedBox(
            //   height: 10,
            // ),

            //clock
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                    DateFormat('hh:mm').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    )
                ),
                Text(
                    DateFormat('a').format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    )
                ),
              ],
            ),

            //Space between clock and Schedules
            // SizedBox(
            //   height: 10,
            // ),


            //schedules
            Container(
              height: 100 ,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context , index) => buildSchedeuleItem(devices[index]),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context , index) =>
                    SizedBox(
                  width: 0,
                ),
                itemCount: devices.length,
              ),
            ),

            //Text before smart devices
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Running Devices',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),

                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text(
                          'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: logocolor2,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Poppins',
                        ),
                      ),
                  )
                ],
              ),
            ),

            //smart devices
            Container(
              height: 180 ,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context , index) => buildSmartDevicesItem(devices[index]),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context , index) =>
                    SizedBox(
                      width: 0,
                    ),
                itemCount: devices.length,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5 ,
                horizontal: 20,
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Rooms',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //rooms
            Container(
              height: 180 ,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context , index) => buildRoomsItem(rooms[index]),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context , index) =>
                    SizedBox(
                      width: 0,
                    ),
                itemCount: rooms.length,
              ),
            ),
  ]),

      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // currentIndex: currentIndex,
          // onTap: (value){
          //   setState(() {
          //     currentIndex = value ;
          //   });
          // },
          showSelectedLabels: false, // hide labels for selected item
          showUnselectedLabels: false, // hide labels for unselected items
          iconSize: 30,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp) ,
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_sharp) ,
              label: 'Data',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_sharp) ,
              label: 'Notifiacations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_sharp) ,
              label: 'Profile',
            ),
          ]
      ),
    );
  }



  Widget buildSchedeuleItem (RunningDevices devices) =>
   Padding(
     padding: const EdgeInsets.all(8.0),

     child: Container(
       decoration: BoxDecoration(
         color: box_back_color,
         borderRadius: BorderRadius.circular(36),
       ),
       width: 180,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              Icon(
                Icons.alarm_sharp,
                color: logocolor2,
                size: 40,
              ),
              // LiteRollingSwitch(
              //     value: true,
              //     textOn: 'On',
              //     textOff: 'Off',
              //     colorOn: logocolor2,
              //     colorOff: Colors.redAccent,
              //     iconOff: Icons.not_interested_sharp,
              //
              //     onTap: (){},
              //     textSize: 16,
              //     onDoubleTap: (){},
              //     onSwipe: (){},
              //     onChanged: (bool position){
              //       print('The Button is $position');
              //     }
              // )
             ],
           ),
         ],
       ),
     ),
   );

  Widget buildSmartDevicesItem (RunningDevices devices) =>
      Padding(
        padding: const EdgeInsets.all(8.0),

        child: Container(
          decoration: BoxDecoration(
            color: box_back_color,
            borderRadius: BorderRadius.circular(36),
          ),
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: IconButton(
                        onPressed: (){},
                        icon: devices.icon,
                      iconSize: 40,
                      color: logocolor2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 2,
                      end: 2,
                    ),
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.green[500],
                    ),
                  ),
                ],
              ),
              Text(
                  '${devices.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'On for the last ${devices.time} Hrs.',
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              // LiteRollingSwitch(
              //     width: 120,
              //     value: true,
              //     textOn: 'On',
              //     textOff: 'Off',
              //     colorOn: logocolor2,
              //     colorOff: Colors.redAccent,
              //     iconOff: Icons.not_interested_sharp,
              //     animationDuration: Duration(milliseconds: 100),
              //     onTap: (){},
              //     textSize: 16,
              //     onDoubleTap: (){},
              //     onSwipe: (){},
              //     onChanged: (bool position){
              //       print('The Button is $position');
              //     }
              // ),
            ],
          ),
        ),
      );

  Widget buildRoomsItem (Rooms rooms) =>
      Padding(
        padding: const EdgeInsets.all(10.0),

        child: Container(
          decoration: BoxDecoration(
            color: box_back_color,
            borderRadius: BorderRadius.circular(36),
          ),
          width: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Container(

          child: IconButton(
          onPressed: (){},
            icon: rooms.icon,
            iconSize: 70,
            color: logocolor2,
        ),
      ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '${rooms.name}',
                  style:TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                  ),
                ),
              ),


            ],
          ),
        ),
      );
}



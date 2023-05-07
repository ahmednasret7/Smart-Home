import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/modules/Archived_Tasks/Archived_Tasks_Screen.dart';
import 'package:hi_ddd_test1/modules/doneTasks/DoneTasks_Screen.dart';
import 'package:hi_ddd_test1/modules/newTasks/NewTasksScreen.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';
import 'package:hi_ddd_test1/shared/cubit/cubit.dart';
import 'package:hi_ddd_test1/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  Database? database ;
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData buttonIcon = Icons.add;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  List <Widget> screens = [
      NewTasksScreen(),
      DoneTasksScreen(),
    Archived_Tasks_Screen(),
  ];
  List <String> appBarTitle = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];
  @override
  void initState() {
    createDatabase();
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state){
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title: Text(appBarTitle[currentIndex]),
            ) ,
            floatingActionButton: FloatingActionButton(
              onPressed: ()  {
                // database != null ? insertDatabase() : print('Database is null');
                if (isBottomSheetShown)
                {
                  if (formKey.currentState!.validate()){
                    insertDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    ).then(
                            (value)
                        {
                          Navigator.pop(context);
                          isBottomSheetShown = false;
                          setState(() {
                            buttonIcon = Icons.edit;
                          });
                        }
                    );

                  }

                }else
                {
                  ScaffoldKey.currentState?.showBottomSheet(
                        (context) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defaultformField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return ('Title mustn\'t be empty');
                                }
                                return null;
                              },
                              label: 'New Task',
                              prefix: Icons.title_sharp,
                            ),
                            SizedBox(height: 10,),
                            defaultformField(
                              // isClickable: false,
                                controller: timeController,
                                type: TextInputType.datetime,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return ('Time mustn\'t be empty');
                                  }
                                  return null;
                                },
                                label: 'Task Time',
                                prefix: Icons.access_time_sharp,
                                onTap: (){
                                  print('Timer Tapped');
                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()).
                                  then((value) {
                                    timeController.text = value!.format(context).toString();
                                    print(value.format(context));
                                  });
                                }
                            ),
                            SizedBox(height: 10,),
                            defaultformField(
                                controller: dateController,
                                type: TextInputType.datetime,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return ('Date mustn\'t be empty');
                                  }
                                  return null;
                                },
                                label: 'Task Date',
                                // isClickable: false,
                                prefix: Icons.calendar_today,
                                onTap: (){
                                  print('Date Tapped');
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2024-01-01'),
                                  ).then(
                                          (value)
                                      {
                                        print(DateFormat.yMMMd().format(value!));
                                        dateController.text = DateFormat.yMMMd().format(value);
                                      }
                                  );
                                }
                            )
                          ],
                        ),

                      ),
                    ),
                    elevation: 20,
                  );
                  isBottomSheetShown = true;
                  setState(() {
                    buttonIcon = Icons.add;
                  });
                }

              },
              child: Icon(
                buttonIcon,

              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap: (value){
                  setState(() {
                    currentIndex = value ;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu) ,
                    label: 'Tasks',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline_sharp) ,
                    label: 'Done',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.send_and_archive_sharp) ,
                    label: 'Archived',
                  ),
                ]
            ),
            body: screens[currentIndex],
          );
        },
      ),
    );

  }
  Future<String> getName()  async {
    return 'Ahmed Mustafa';
  }

  void createDatabase() async
  {
    database = await openDatabase(
     'todo.db',
     version: 1,
     onCreate: (database , version)
     {
        print('Database Created');
        database.execute(
            'CREATE TABLE Tasks (ID INTEGER PRIMARY KEY , Title TEXT , Date TEXT , Time TEXT , Status TEXT)'
        ).then((value)
        {
          print('Table Created');
        }).catchError((error){
          print('Error when creating table ${error.toString()}');
        });
     },
     onOpen:(database){
       print('Database Opened');
     } ,
   );

  }

  Future insertDatabase (
  {
    required String title,
    required String time,
    required String date,

}
) async
  {
    return await database!.transaction((txn)
    async {
     txn.rawInsert('INSERT INTO Tasks (Title,Date,Time,Status) VALUES("$title", "$date" , "$time" , "New" )').
     then((value) {
       print('$value inserted successfully');
     }).
     catchError((error){
       print('Error when inserting new record ${error.toString()}');
     });
    });
  }
}

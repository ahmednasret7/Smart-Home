import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/models/user/user_model.dart';

// class Userscreen  extends StatelessWidget {
  // List<UserModel> users = [
    // UserModel(
    //     id: 1,
    //     Name: "Ahmed",
    //     Phone: "01129995098"),
    // UserModel(
    //     id: 2,
    //     Name: "Omar",
    //     Phone: "01129995097"),
    // UserModel(
    //     id: 3,
    //     Name: "Ahmed",
    //     Phone: "01125559068"),
    // UserModel(
    //     id: 4,
    //     Name: "Hana",
    //     Phone: "01129995098"),
    // UserModel(
    //     id: 5,
    //     Name: "Mezo",
    //     Phone: "01129875098"),
    // UserModel(
    //     id: 1,
    //     Name: "Ahmed",
    //     Phone: "01129995098"),
    // UserModel(
    //     id: 2,
    //     Name: "Omar",
    //     Phone: "01129995097"),
    // UserModel(
    //     id: 3,
    //     Name: "Ahmed",
    //     Phone: "01125559068"),
    // UserModel(
    //     id: 4,
    //     Name: "Hana",
    //     Phone: "01129995098"),
    // UserModel(
    //     id: 5,
    //     Name: "Mezo",
    //     Phone: "01129875098"),
  // ];
  // @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.person) ,
//         title: Text(
//             'Users'
//         ),
//         actions: [
//
//         ],
//
//       ),
//       body: ListView.separated(
//           itemBuilder: (context,index) => buildUserItem(users[index]),
//           separatorBuilder: (context,index) =>
//               Padding(
//             padding: const EdgeInsetsDirectional.only(
//               start: 20,
//             ),
//             child: Container(
//               width: double.infinity,
//               color: Colors.grey[300],
//               height: 2,
//             ),
//           ),
//           itemCount: users.length,
//       ),
//     );
//   }
//   //1.build item
//   //2.build list
//   //3.add item to list
//
//   Widget buildUserItem (UserModel user) =>
//       Padding(
//     padding: const EdgeInsets.all(10.0),
//     child: Row(
//       children: [
//         CircleAvatar(
//           radius: 35,
//           child: Text(
//             '${user.id}',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 30,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 20,
//         ),
//         Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '${user.Name}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//               ),
//             ),
//             Text(
//               '${user.Phone}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//
//       ],
//     ),
//   ) ;
// }

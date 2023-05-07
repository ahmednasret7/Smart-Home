import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
  return Scaffold
    (
  appBar: AppBar(

  backgroundColor: Colors.amber,
  leading: Icon(
    Icons.menu_rounded,
  ),
  title: Text(
      "Ahmed's 1st App"
  ) ,
   centerTitle: true,
   actions: [
     IconButton(
       onPressed: (){
         print("This is the search icon");
       },
       icon: Icon(
         Icons.search_rounded,
       ),
     ) ,
     IconButton(
       onPressed: (){
         print('Hello Bitch & this is the plus||add icon');
       },
       icon: Icon(
       Icons.add_circle_outline,
     ),) ,
     IconButton(
       onPressed: (){
       print("Test");
     },
         icon: Icon(
           Icons.telegram_sharp,
         ),) ,
     IconButton(icon: Icon(Icons.facebook_sharp), onPressed: (){
       print("Test 2");
     },) ,
   ],

) ,
  body:  Column(
  children: [
    Container(
      width: 250.0,
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(30),
            )
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image(
              image: NetworkImage(
               "https://www.footyrenders.com/render/federico-valverde-53-343x540.png"
              )
              , height: 250,
              width: 250,
              ),
              Container(
                color: Colors.orange.withOpacity(.5),
                width: double.infinity,
                padding: EdgeInsetsDirectional.only(
                    start: 10,
                    end: 10,
                ),
                child: Text(
                  textAlign: TextAlign.center ,
                  "Valverde",
                  style: TextStyle(
                    fontSize: 60,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    )],
)
)


// body: SingleChildScrollView(
//  scrollDirection: Axis.horizontal,
//   child:   Row(
//
//     children: [
//
//     Icon(
//
//     Icons.telegram_sharp,
//
//     size: 100,
//
//     ) ,
//
//     Icon(
//
//     Icons.snapchat_sharp,
//
//     size: 100,
//
//     ) ,
//
//     Icon(
//
//     Icons.album_sharp,
//
//     size: 100,
//
//     ) ,
//
//     Icon(
//
//     Icons.facebook_sharp,
//
//     size: 100,
//
//       ) ,
//
//       Icon(
//
//       Icons.telegram_sharp,
//
//       size: 100,
//
//     ) ,
//
//     Icon(
//
//     Icons.snapchat_sharp,
//
//       size: 100,
//
//       ) ,
//
//       Icon(
//
//       Icons.album_sharp,
//
//     size: 100,)
//
//     ],
//
//     ),
;



//   SingleChildScrollView(
//   child:   Column(
//       children: [
//       Icon(
//         Icons.facebook_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.telegram_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.snapchat_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.album_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.facebook_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.telegram_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.snapchat_sharp,
//         size: 100,
//       ) ,
//       Icon(
//         Icons.album_sharp,
//         size: 100,
//       ) ,
//
//     ],
//   ),
// ),
  /*body: Column(
    children: [

      Expanded(
        child: Container(
          color: Colors.indigo,

            child:
            Text(
                "1st line",
              style: TextStyle(
                fontSize: 50,
            ),

          )
        ),
      ),
      Expanded(
        child: Container(
            color: Colors.deepOrange,

            child: Text(
                "2nd line",
              style: TextStyle(
                fontSize: 50,
              ),
            )),
      ),
      Expanded(
        child: Container(
            color: Colors.limeAccent,

            child: Text(
                "3rd line",
                style: TextStyle(
                  fontSize: 50,
                ))),
      ),
      Expanded(
        flex: 1,
        child: Container(
            color: Colors.purple,

            child: Text(
                "4tt line",
                style: TextStyle(
                  fontSize: 50,
                )
            )),
      ),
    ],
  )*/
   //  body: Container(
   //    color: Colors.pink,
   //    child: Row(
   //      mainAxisSize: MainAxisSize.max,
   //      mainAxisAlignment: MainAxisAlignment.start,
   //      crossAxisAlignment: CrossAxisAlignment.center,
   //      children: [
   //        Container(
   //            color: Colors.yellowAccent,
   //            child: Text(
   //                'Hi',
   //              style: TextStyle(
   //                fontSize: 25,
   //                fontStyle: FontStyle.italic,
   //              ),
   //            )
   //        ) ,
   //        // Expanded(
   //        //   child: Container(
   //        //     color: Colors.lightGreen,
   //        //       child: Text(
   //        //           'Hey',
   //        //         style: TextStyle(
   //        //           fontSize: 25,
   //        //           fontStyle: FontStyle.italic,
   //        //         ),
   //        //       )
   //        //   ),
   //        // ) ,
   //        // Expanded(
   //        //   child: Container(
   //        //     color: Colors.orange,
   //        //       child: Text(
   //        //           'Hello',
   //        //         style: TextStyle(
   //        //           fontSize: 25,
   //        //           fontStyle: FontStyle.italic,
   //        //         ),
   //        //       )
   //        //   ),
   //        // ) ,
   // ],
   //    ),
   //  )




  }


}
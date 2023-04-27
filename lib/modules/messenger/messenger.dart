import 'package:flutter/material.dart';

class messengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title:
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://sortitoutsi.b-cdn.net/uploads/megapacks/cutoutfaces/originals/2023.00/78074594.png?width=100&height=100'),

            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(
                  Icons.camera_alt_sharp,
                  size: 20,
                  color: Colors.white,
                ),
              )),
          IconButton(onPressed: (){},
              icon: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.deepPurpleAccent,
                child: Icon(
                  Icons.edit_sharp,
                  size: 20,
                  color: Colors.white,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.deepPurpleAccent[100],
                ),
                padding: EdgeInsets.all(1),
                child: Row(
                  children: [
                    IconButton(onPressed: (){},
                        icon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100 ,
                child: ListView.separated(
                  shrinkWrap: true,
                itemBuilder: (context , index) => buildStoryItem(),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context , index) => SizedBox(
                  width: 10,
                ),
                itemCount: 6,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                 physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context,index) => buildChatItem(),
                  separatorBuilder: (context,index) =>  SizedBox(
                    height: 15,
                  ),
                  itemCount: 10,
              ),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildChatItem () => Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Karim_Benzema_wearing_Real_Madrid_home_kit_2021-2022.jpg/330px-Karim_Benzema_wearing_Real_Madrid_home_kit_2021-2022.jpg'),

            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2,
                end: 2,
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green[500],
              ),
            ),

          ],
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'Karim Mostafa Benzema Karim Mostafa Benzema',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'See u in the world Cup',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text (
                      '12:06 AM',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  Widget buildStoryItem () => Container(
    width: 80,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Federico_Valverde_2021_%28cropped%29.jpg/330px-Federico_Valverde_2021_%28cropped%29.jpg'),

            ),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 2,
                end: 2,
              ),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green[500],
              ),
            ),

          ],
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'Federico Santiago Valverde Dipetta',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );

}

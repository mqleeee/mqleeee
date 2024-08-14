import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color first = Color(0xFF0E0E0E);
    Color second = Color(0xFF102B2D);
    Color third = Color(0xFF06A0B5);
    Color menu = Color(0xFF436369);

    List<Map<String, String>> items1 = [
      {'imagePath': 'assets/images/food1.png', 'text': 'Coffee & jazz'},
      {'imagePath': 'assets/images/hinh2.png', 'text': 'RELEASED '},
    ];

    List<Map<String, String>> items2 = [
      {'imagePath': 'assets/images/hinh6.png', 'text': 'Anything Goes'},
      {'imagePath': 'assets/images/hinh3.png', 'text': 'Anime OSTs'},
    ];

    List<Map<String, String>> items3 = [
      {'imagePath': 'assets/images/hinh5.png', 'text': "Harry's House"},
      {'imagePath': 'assets/images/hinh4.png', 'text': 'Lo-Fi Beats'},
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [third, second, first],
          stops: [0.0, 0.0, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor:
            Colors.transparent, // Để nền của Scaffold là trong suốt
        appBar: AppBar(
          leading: Padding(
            padding:
                EdgeInsets.only(left: 10.0), // Xích qua phải một chút nếu cần
            child: Container(
              padding: EdgeInsets.all(2.0), // Độ dày của viền
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue, // Màu của viền
                  width: 2.0, // Độ dày của viền
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/girl1.png'),
                radius: 20.0, // Kích thước của CircleAvatar
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Căn trái
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'chandrama',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bar_chart_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
          backgroundColor: Colors.transparent, // Làm cho AppBar trong suốt
          elevation: 0, // Xóa đổ bóng của AppBar
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Continue Listening',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  buildRow(menu, items1),
                  SizedBox(height: 10),
                  buildRow(menu, items2),
                  SizedBox(height: 10),
                  buildRow(menu, items3),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Your Top Mixes',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        buildMixes(Color(0xFFFF7777), 'assets/images/mixes1.png', 'Pop Mix'),
                        buildMixes(Color(0xFFFFFA77), 'assets/images/mixes2.png', 'Chill Mix'),
                        buildMixes(Color(0xFF77FF95), 'assets/images/mixes3.png', 'Kpop'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Widget buildMixes(Color RectangleColor, String imagePath, String text){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Stack(
      children: <Widget>[
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),fit: BoxFit.cover)),
        ),
        Positioned(
          top: 18,
          left: 30,
          child: Text(text,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 15, letterSpacing: 0.04),),
        ),
        Positioned(
          top:5,
          left: -25,
          child: CircleAvatar(
            minRadius: 20,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 30,
          right: -50,
          child: CircleAvatar(
            minRadius: 45,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container (
            height: 10,
            color: RectangleColor,
          ),
        )
      ],
    ),
  );
}
Widget buildItem(Color menu, String imagePath, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      height: 60,
      width: 175,
      child: Row(
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover)),
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          color: menu.withOpacity(0.2)),
    ),
  );
}

Widget buildRow(Color menu, List<Map<String, String>> items) {
  return Row(
    children: items.map((item) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: buildItem(menu, item['imagePath']!, item['text']!),
      );
    }).toList(),
  );
}

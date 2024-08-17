import 'package:flutter/material.dart';
import 'package:project_musium/pages/Stats.dart'; // Đường dẫn chính xác

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF06A0B5), Color(0xFF102B2D), Color(0xFF0E0E0E)],
          stops: [0.0, 0.0, 0.4],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildHeader(context),
                SizedBox(height: 20),
                buildTitle('Continue Listening'),
                SizedBox(height: 20),
                buildRow(Color(0xFF436369), [
                  {'imagePath': 'assets/images/food1.png', 'text': 'Coffee & jazz'},
                  {'imagePath': 'assets/images/hinh2.png', 'text': 'RELEASED '},
                ]),
                SizedBox(height: 10),
                buildRow(Color(0xFF436369), [
                  {'imagePath': 'assets/images/hinh6.png', 'text': 'Anything Goes'},
                  {'imagePath': 'assets/images/hinh3.png', 'text': 'Anime OSTs'},
                ]),
                SizedBox(height: 10),
                buildRow(Color(0xFF436369), [
                  {'imagePath': 'assets/images/hinh5.png', 'text': "Harry's House"},
                  {'imagePath': 'assets/images/hinh4.png', 'text': 'Lo-Fi Beats'},
                ]),
                SizedBox(height: 20),
                buildTitle('Your Top Mixes'),
                SizedBox(height: 10),
                buildTopMixes(),
                SizedBox(height: 15),
                buildTitle('Based on your recent listening'),
                SizedBox(height: 10),
                buildRecentListening(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/girl1.png'),
          radius: 20.0,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
            Text('chandrama',
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.bar_chart_outlined, size: 30, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Stats()));
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.settings_outlined, size: 30, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Widget buildTopMixes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildMixes(Color(0xFFFF7777), 'assets/images/mixes1.png', 'Pop Mix'),
          buildMixes(Color(0xFFFFFA77), 'assets/images/mixes2.png', 'Chill Mix'),
          buildMixes(Color(0xFF77FF95), 'assets/images/mixes3.png', 'Kpop'),
        ],
      ),
    );
  }

  Widget buildRecentListening() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          buildBased('assets/images/based1.png'),
          buildBased('assets/images/based2.png'),
        ],
      ),
    );
  }
}

Widget buildMixes(Color rectangleColor, String imagePath, String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Stack(
      children: <Widget>[
        Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.cover)),
        ),
        Positioned(
          top: 18,
          left: 30,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                letterSpacing: 0.04),
          ),
        ),
        Positioned(
          top: 5,
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
          child: Container(
            height: 10,
            color: rectangleColor,
          ),
        )
      ],
    ),
  );
}

Widget buildBased(String imagePath) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
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

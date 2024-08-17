import 'package:flutter/material.dart';
import 'package:project_musium/pages/Explore.dart';
import 'package:project_musium/pages/Library.dart';
import 'package:flutter/material.dart';
import 'package:project_musium/pages/Explore.dart';
import 'package:project_musium/pages/Library.dart';
import 'package:project_musium/pages/Stats.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Danh sách các trang
  final List<Widget> _pages = [
    HomeContent(), // Nội dung của trang HomePage
    Explore(), // Trang Explore
    Library(), // Trang Library
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật index khi tab được chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:
          _pages[_selectedIndex], // Hiển thị trang tương ứng với tab được chọn
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_outlined),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF06A0B5), // Màu của mục được chọn
        unselectedItemColor: Colors.grey, // Màu của các mục chưa được chọn
        onTap: _onItemTapped, // Gọi hàm khi mục được chọn
        backgroundColor: Colors.transparent, // Màu nền của bottom bar
        elevation: 0,
      ),
    );
  }
}

// Widget HomeContent chứa nội dung chính của trang HomePage
class HomeContent extends StatelessWidget {
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
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Nội dung chính của HomePage (profile, các danh sách)
                  buildHomeContent(context,menu, items1, items2, items3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHomeContent(BuildContext context,Color menu, List<Map<String, String>> items1,
      List<Map<String, String>> items2, List<Map<String, String>> items3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildHeader(context),
        SizedBox(height: 20),
        buildTitle('Continue Listening'),
        SizedBox(height: 20),
        buildRow(menu, items1),
        SizedBox(height: 10),
        buildRow(menu, items2),
        SizedBox(height: 10),
        buildRow(menu, items3),
        SizedBox(height: 20),
        buildTitle('Your Top Mixes'),
        SizedBox(height: 10),
        buildTopMixes(),
        SizedBox(height: 15),
        buildTitle('Based on your recent listening'),
        SizedBox(height: 10),
        buildRecentListening(),
      ],
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
          icon:
              Icon(Icons.notifications_outlined, size: 30, color: Colors.white),
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
          buildMixes(
              Color(0xFFFFFA77), 'assets/images/mixes2.png', 'Chill Mix'),
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

Widget buildMixes(Color RectangleColor, String imagePath, String text) {
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
            color: RectangleColor,
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

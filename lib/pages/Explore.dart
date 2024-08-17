import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    Color first = Color(0xFF0E0E0E);
    Color second = Color(0xFF102B2D);
    Color third = Color(0xFF06A0B5);

    List<Map<String, dynamic>> items1 = [
      {
        'imagePath': 'assets/images/explore1.png',
        'text': 'Kpop',
        'color': Colors.lightGreen
      },
      {
        'imagePath': 'assets/images/explore2.jpg',
        'text': 'Indie',
        'color': Colors.purple
      },
    ];
    List<Map<String, dynamic>> items2 = [
      {
        'imagePath': 'assets/images/explore3.png',
        'text': 'R&B',
        'color': Color(0xFF4A558F)
      },
      {
        'imagePath': 'assets/images/explore4.png',
        'text': 'Pop',
        'color': Color(0xFFBD6220)
      },
    ];

    List<Map<String, dynamic>> items3 = [
      {
        'imagePath': 'assets/images/explore5.png',
        'text': 'Made for you',
        'color': Color(0xFF1E82AC)
      },
      {
        'imagePath': 'assets/images/hinh2.png',
        'text': 'RELEASED',
        'color': Color(0xFF76259C)
      },
    ];
    List<Map<String, dynamic>> items4 = [
      {
        'imagePath': 'assets/images/explore6.png',
        'text': 'Music Charts',
        'color': Color(0xFF25319C)
      },
      {
        'imagePath': 'assets/images/explore7.png',
        'text': 'Podcasts',
        'color': Color(0xFF9C2542)
      },
    ];
    List<Map<String, dynamic>> items5 = [
      {
        'imagePath': 'assets/images/explore8.png',
        'text': 'Bollywood',
        'color': Color(0xFF9C7425)
      },
      {
        'imagePath': 'assets/images/explore2.jpg',
        'text': 'Pop Fusion',
        'color': Color(0xFF479775)
      },
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
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/images/logo1.png'),
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        'Sreach',
                        style: TextStyle(
                            color: third,
                            fontSize: 27,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(
                        vertical: 10.0), // Thêm khoảng cách trên/dưới
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Song, Artists, Podcasts & More',
                        hintStyle: TextStyle(
                            color: Colors.grey), // Màu của văn bản gợi ý
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey, // Màu của biểu tượng tìm kiếm
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none, // Loại bỏ đường viền
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15), // Thêm khoảng cách nội dung
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Your Top Genres',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      buildRow(items1),
                      SizedBox(height: 10),
                      buildRow(items2)
                    ],
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Browse All',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      buildRow(items3),
                      SizedBox(height: 10),
                      buildRow(items4),
                      SizedBox(height: 10),
                      buildRow(items5)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildItem(Color menu, String imagePath, String text, Color color) {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 110,
        width: 165,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 15,
                left: 12,
                child: Container(
                  width: 90,
                  height: 50,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                )),
            Positioned(
              bottom: -10,
              right: -10,
              child: Center(
                  child: Transform.rotate(
                angle: 30 * 3.1415927 / 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(imagePath,
                        height: 90, width: 90, fit: BoxFit.cover)),
              )),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color, // Sử dụng màu sắc từ items
        ),
      ));
}

Widget buildRow(List<Map<String, dynamic>> items) {
  return Row(
    children: items.map((item) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: buildItem(
            item['color']!, item['imagePath']!, item['text']!, item['color']!),
      );
    }).toList(),
  );
}

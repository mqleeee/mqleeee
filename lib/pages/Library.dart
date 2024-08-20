import 'package:flutter/material.dart';
import 'package:project_musium/pages/Artists.dart';
import 'package:project_musium/pages/Folders.dart'; // Thay thế bằng các import cần thiết
import 'package:project_musium/pages/Playlists.dart';
import 'package:project_musium/pages/Albums.dart';
import 'package:project_musium/pages/Podcast_shows.dart';
class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  int selectedIndex = -1; // Sử dụng -1 để chỉ không chọn nút nào

  // Các widget cho các trang khác
  final List<Widget> pages = [
    // Placeholder cho các trang khác
    Folders(),
    Playlists(),
    Artists(),
    Albums(),
    Podcasts_Shows()
  ];

  void _onTextButtonPressed(int index) {
    setState(() {
      // Kiểm tra nếu nút được chọn đã được chọn trước đó
      if (selectedIndex == index) {
        // Nếu đã chọn, thì quay lại trạng thái chưa chọn
        selectedIndex = -1;
      } else {
        // Ngược lại, cập nhật chỉ số được chọn
        selectedIndex = index;
      }
    });
  }

  Widget buildTextButton(int index, String label) {
    bool isSelected = selectedIndex == index;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isSelected
            ? LinearGradient(
          colors: [
            Color(0xFF15686B),
            Color(0xFF06A0B5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )
            : null, // Không có gradient khi không được chọn
        color: isSelected ? null : Color(0xFF121111), // Màu nền khi không được chọn
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: TextButton(
        onPressed: () => _onTextButtonPressed(index),
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.transparent, // Đặt màu nền thành trong suốt để hiển thị gradient từ Container
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Colors.white,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
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
                  SizedBox(width: 10),
                  Text(
                    'Your Library',
                    style: TextStyle(
                      color: Color(0xFF06A0B5),
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search, size: 30, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildTextButton(0, 'Folders'),
                    SizedBox(width: 20),
                    buildTextButton(1, 'Playlists'),
                    SizedBox(width: 20),
                    buildTextButton(2, 'Artists'),
                    SizedBox(width: 20),
                    buildTextButton(3, 'Albums'),
                    SizedBox(width: 20),
                    buildTextButton(4, 'Podcasts & Shows'),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Hiển thị nội dung chính của Library hoặc trang được chọn
              Expanded(
                child: selectedIndex == -1
                    ? SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      // Nút hình tròn đầu tiên
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFF39C0D4),
                            radius: 25, // Đường kính của CircleAvatar
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add, color: Colors.black),
                              iconSize: 30,
                            ),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa nút hình tròn và văn bản
                          Text(
                            'Add New Playlist',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Khoảng cách giữa hai nhóm

                      // Nút hình tròn thứ hai
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFF39C0D4),
                            radius: 25, // Đường kính của CircleAvatar
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border, color: Colors.black),
                              iconSize: 20,
                            ),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa nút hình tròn và văn bản
                          Text(
                            'Your Like Songs',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_downward_outlined,
                            color: Colors.blueGrey,
                          ),
                          Icon(
                            Icons.arrow_upward_outlined,
                            color: Colors.blueGrey,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Recently played',
                            style: TextStyle(
                                color: Color(0xFF39C0D4),
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      // Hiển thị các bài hát hoặc album
                      // Đây là phần nội dung chính của trang Library
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/images/library1.png'), // Đường dẫn tới hình ảnh
                            radius: 30, // Đường kính của CircleAvatar
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa CircleAvatar và Text
                          Text(
                            'Conan Gray',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70, // Chiều rộng của hình vuông
                            height: 70, // Chiều cao của hình vuông
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0), // Bo tròn các góc của hình vuông
                              image: DecorationImage(
                                image: AssetImage('assets/images/library2.png'), // Đường dẫn tới hình ảnh
                                fit: BoxFit.cover, // Căn chỉnh hình ảnh để bao phủ toàn bộ Container
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '3:00am vibes',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '18 songs',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70, // Chiều rộng của hình vuông
                            height: 70, // Chiều cao của hình vuông
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0), // Bo tròn các góc của hình vuông
                              image: DecorationImage(
                                image: AssetImage('assets/images/library3.png'), // Đường dẫn tới hình ảnh
                                fit: BoxFit.cover, // Căn chỉnh hình ảnh để bao phủ toàn bộ Container
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Wiped Out!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'The Neighbourhood',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 70, // Chiều rộng của hình vuông
                            height: 70, // Chiều cao của hình vuông
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0), // Bo tròn các góc của hình vuông
                              image: DecorationImage(
                                image: AssetImage('assets/images/library4.png'), // Đường dẫn tới hình ảnh
                                fit: BoxFit.cover, // Căn chỉnh hình ảnh để bao phủ toàn bộ Container
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Extra Dynamic',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Update Aug 10 * ur mom ashley',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : pages[selectedIndex], // Hiển thị trang đã chọn
              ),
            ],
          ),
        ),
      ),
    );
  }
}

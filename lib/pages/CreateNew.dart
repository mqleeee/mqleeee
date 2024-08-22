import 'package:flutter/material.dart';

class CreateNewPlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Center(
              child: Text(
                'New Playlist',
                style: TextStyle(
                  fontSize: 26, // Phóng to chữ
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20), // Thêm khoảng cách giữa tiêu đề và TextField
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Give your playlist a title',
                hintStyle: TextStyle(color: Colors.white54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan),
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Privacy',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                child: DropdownButtonFormField<String>(
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.cyan),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor:
                    Colors.transparent, // Màu trong suốt cho khung chọn
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius:
                      BorderRadius.circular(20.0), // Thu nhỏ border
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                      borderRadius:
                      BorderRadius.circular(20.0), // Thu nhỏ border
                    ),
                  ),
                  value: 'Public',
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Public',
                      child: Row(
                        children: [
                          Icon(Icons.public,
                              color: Colors
                                  .white70), // Đổi màu biểu tượng thành trắng xám
                          SizedBox(width: 8),
                          Text(
                            'Public',
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ],
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Private',
                      child: Row(
                        children: [
                          Icon(Icons.lock,
                              color: Colors
                                  .white70), // Đổi màu biểu tượng thành trắng xám
                          SizedBox(width: 8),
                          Text(
                            'Private',
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ],
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    // Handle privacy change
                  },
                ),
              ),
            ),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Colors.white.withOpacity(0.3), // Màu bóng mở
                    elevation: 10, // Độ cao của bóng
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20), // Cách khoảng giữa các nút
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    shadowColor: Colors.cyan.withOpacity(0.6), // Màu bóng mở
                    elevation: 10, // Độ cao của bóng
                    padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  ),
                  onPressed: () {
                    // Handle creating new playlist
                  },
                  child: Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:project_musium/pages/Add_to_playlist.dart';
import 'package:project_musium/pages/Sleep_timer.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double imageWidth = screenSize.width * 0.6; // Chiều rộng hình ảnh chiếm 60% chiều rộng màn hình
    final double imageHeight = screenSize.height * 0.35; // Chiều cao hình ảnh chiếm 30% chiều cao màn hình

    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenSize.width * 0.05), // Padding tương ứng 5% chiều rộng màn hình
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Color(0xFF00C2CB)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02), // Khoảng cách giữa các widget tương ứng 2% chiều cao màn hình
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/playlistsc1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02), // Khoảng cách giữa các widget tương ứng 2% chiều cao màn hình
              Text(
                'grainy days',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.07, // Kích thước chữ tương ứng 7% chiều rộng màn hình
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'moody.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenSize.width * 0.05, // Kích thước chữ tương ứng 5% chiều rộng màn hình
                ),
              ),
              SizedBox(height: screenSize.height * 0.05), // Khoảng cách giữa các widget tương ứng 5% chiều cao màn hình
              Expanded(
                child: ListView(
                  children: [
                    menuItem(Icons.music_note_outlined, 'Add to playlist', context),
                    menuItem(Icons.queue_music, 'Add to queue', context),
                    menuItem(Icons.remove_circle_outline, 'Remove from playlist', context),
                    menuItem(Icons.label_outline, 'Modify tags', context),
                    menuItem(Icons.person_outline, 'View Artist', context),
                    menuItem(Icons.album_outlined, 'View Album', context),
                    menuItem(Icons.info_outline, 'Show Credits', context),
                    menuItem(Icons.download_outlined, 'Download', context),
                    menuItem(Icons.share_outlined, 'Share', context),
                    menuItem(Icons.qr_code, 'Generate QR Code', context),
                    menuItem(Icons.timer_outlined, 'Sleep Timer', context),
                    menuItem(Icons.visibility_off_outlined, 'Hide song', context),
                    menuItem(Icons.radio, 'Go to Song Radio', context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
      ),
      onTap: () {
          if(title == 'Sleep Timer'){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SleepTimerScreen()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddToPlaylistScreen()));
          }
        },
    );
  }
}

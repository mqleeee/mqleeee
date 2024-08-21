import 'package:flutter/material.dart';
import 'package:project_musium/pages/Add_to_playlist.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121111),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite_border, color: Color(0xFF00C2CB)),
                    onPressed: (){},
                  ),
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 240,
                height: 230,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/playlistsc1.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              SizedBox(height: 20),
              Text(
                'grainy days',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'moody.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    menuItem(Icons.playlist_add, 'Add to playlist',context),
                    menuItem(Icons.queue_music, 'Add to queue',context),
                    menuItem(Icons.remove_circle_outline, 'Remove from playlist',context),
                    menuItem(Icons.label_outline, 'Modify tags',context),
                    menuItem(Icons.person_outline, 'View Artist',context),
                    menuItem(Icons.album_outlined, 'View Album',context),
                    menuItem(Icons.info_outline, 'Show Credits',context),
                    menuItem(Icons.download_outlined, 'Download',context),
                    menuItem(Icons.share_outlined, 'Share',context),
                    menuItem(Icons.qr_code, 'Generate QR Code',context),
                    menuItem(Icons.timer_outlined, 'Sleep Timer', context),
                    menuItem(Icons.visibility_off_outlined, 'Hide song',context),
                    menuItem(Icons.radio, 'Go to Song Radio',context),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget menuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddToPlaylistScreen()));
      },
    );
  }
}
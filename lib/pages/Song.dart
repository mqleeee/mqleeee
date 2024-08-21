import 'package:flutter/material.dart';
import 'package:project_musium/pages/Menu.dart';
import 'package:project_musium/pages/Play_list1.dart';

class SongScreen extends StatelessWidget {
  final Color button = Color(0xFF8A9A9D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF121111),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PLAYING FROM PLAYLIST:',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white54,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Lofi Loft',
                                  style: TextStyle(
                                      color: Color(0xFFA6F3FF),
                                      fontSize:
                                          15), // Tùy chỉnh kích thước chữ nếu cần
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlaylistScreen()));
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuScreen()));
                          },
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  // Artwork
                  Container(
                    margin: EdgeInsets.all(30),
                    height: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/playlistsc1.png'),
                            fit: BoxFit.cover)),
                  ),
                  // Song Title and Artist
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'grainy days',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'moody.',
                          style: TextStyle(
                            fontSize: 18,
                            color: button,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Progress Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: 0.5,
                                onChanged: (value) {},
                                activeColor: Colors.white,
                                inactiveColor: Colors.white24,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('0:00', style: TextStyle(color: Colors.white)),
                            Text('2:43', style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Playback Controls
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shuffle),
                          onPressed: () {},
                          color: Colors.white54,
                          iconSize: 15,
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_previous),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.cyan,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.play_arrow_outlined),
                            onPressed: () {},
                            iconSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                        IconButton(
                          icon: Icon(Icons.equalizer),
                          onPressed: () {},
                          color: Colors.white54,
                          iconSize: 15,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 15,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 55),
                      child: IconButton(
                        alignment: Alignment.centerRight,
                        icon: Icon(Icons.download),
                        onPressed: () {},
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      'LYRICS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  // Lyrics
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF25BCC3),
                      borderRadius: BorderRadius.circular(23.0),
                    ),
                    child: Text(
                      "You never look at the sky \n"
                      "Cause you think it's too high\n "
                      "You never look at the stars \n"
                      "Cause you think they're too far \n"
                      "But they're showing the lights to the way back home \n"
                      "When you don't know where to go \n",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

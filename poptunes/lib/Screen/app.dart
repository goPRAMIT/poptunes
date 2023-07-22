import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:poptunes/Models/Music.dart';
import 'package:poptunes/Screen/home.dart';
import 'package:poptunes/Screen/library.dart';
import 'package:poptunes/Screen/search.dart';
import 'package:audioplayers/audioplayers.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int currentTabIndex = 0;
  bool isPlaying = false;

  late AnimationController _controller;

  Music? music;
  Widget miniPlayer(Music? music, {bool stop = false}) {
    this.music = music;

    if (music == null) {
      return SizedBox();
    }
    if (stop) {
      isPlaying = false;
      _audioPlayer.stop();
    }
    setState(() {});
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blueGrey,
      width: deviceSize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(music.image, fit: BoxFit.cover),
          Text(
            music.name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          GestureDetector(
              onTap: () async {
                isPlaying = !isPlaying;
                if (isPlaying) {
                  await _audioPlayer.play(UrlSource(music.audioURL));
                  _controller.forward();
                } else {
                  await _audioPlayer.pause();
                  _controller.reverse();
                }
                setState(() {});
              },
              child: AnimatedIcon(
                color: Colors.white,
                icon: AnimatedIcons.play_pause,
                progress: _controller,
                size: 40,
              )

              // icon: isPlaying
              //     ? Icon(Icons.pause, color: Colors.white)
              //     : Icon(Icons.play_arrow, color: Colors.white)),
              )
        ],
      ),
    );
  }

  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
    Tabs = [Home(miniPlayer), Search(), Library()];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Tabs[currentTabIndex],
//       backgroundColor: const Color.fromARGB(255, 77, 75, 75),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           miniPlayer(music),
//           BottomNavigationBar(
//             currentIndex: currentTabIndex,
//             onTap: (currentIndex) {
//               currentTabIndex = currentIndex;
//               setState(() {});
//             },
//             selectedLabelStyle: TextStyle(color: Colors.white),
//             selectedItemColor: Colors.white,
//             backgroundColor: Color.fromARGB(98, 56, 66, 78),
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.home,
//                     color: Colors.white,
//                   ),
//                   label: 'Home'),
//               BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.search,
//                     color: Colors.white,
//                   ),
//                   label: 'Search'),
//               BottomNavigationBarItem(
//                   icon: Icon(
//                     Icons.library_music,
//                     color: Colors.white,
//                   ),
//                   label: 'Library')
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Tabs[currentTabIndex],
//       bottomNavigationBar: Container(
//         color: Color.fromARGB(255, 0, 0, 0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
//                 child: miniPlayer(music),
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
//                 child: GNav(
//                     backgroundColor: Colors.transparent,
//                     color: Colors.white,
//                     activeColor: Colors.white,
//                     tabBackgroundColor: Color.fromARGB(143, 55, 71, 79),
//                     padding: EdgeInsets.all(12),
//                     gap: 8,
//                     onTabChange: (currentIndex) {
//                       currentTabIndex = currentIndex;
//                       setState(() {});
//                     },
//                     tabs: const [
//                       GButton(icon: Icons.home, text: 'Home'),
//                       GButton(icon: Icons.search, text: 'Search'),
//                       GButton(icon: Icons.library_music, text: 'Library'),
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tabs[currentTabIndex],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                child: miniPlayer(music),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 8.0),
                child: GNav(
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                    activeColor: Colors.white,
                    tabBackgroundColor: Color.fromARGB(143, 55, 71, 79),
                    padding: EdgeInsets.all(12),
                    gap: 8,
                    onTabChange: (currentIndex) {
                      currentTabIndex = currentIndex;
                      setState(() {});
                    },
                    tabs: const [
                      GButton(icon: Icons.home, text: 'Home'),
                      GButton(icon: Icons.search, text: 'Search'),
                      GButton(icon: Icons.library_music, text: 'Library'),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

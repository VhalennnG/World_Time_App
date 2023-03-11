import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    // random image
    final Random randomImage = Random();

    //
    List<String> _imageList = [
      '${data['dayTime']}/image1.jpg',
      '${data['dayTime']}/image2.jpg',
      '${data['dayTime']}/image3.jpg',
      '${data['dayTime']}/image4.jpg',
      '${data['dayTime']}/image5.jpg',
      '${data['dayTime']}/image6.jpg',
      '${data['dayTime']}/image7.jpg',
      '${data['dayTime']}/image8.jpg',
      '${data['dayTime']}/image9.jpg',
      '${data['dayTime']}/image10.jpg',
    ];

    int _imageIndex = randomImage.nextInt(_imageList.length);

    // String bgImage = data['dayTime'];
    String bgImage = _imageList[_imageIndex];

    return Scaffold(
      // backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'dayTime': result['dayTime'],
                      };
                    });
                  },
                  icon: Container(
                    width: 50, // lebar Container
                    height: 50, // tinggi Container
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.edit_location_alt, // ikon yang ingin ditampilkan
                      color: Colors.white, // warna ikon
                      size: 30, // ukuran ikon
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent, // warna glow
                          blurRadius: 30.0, // besar radius
                          spreadRadius: 10.0, // besar spread
                        ),
                      ],
                    ),
                  ),
                  label: Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        'Edit location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1
                            ..color = Colors.cyanAccent,
                        ),
                      ),
                      Text(
                        'Edit location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(-1, -1),
                              color: Colors.cyan,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(1, -1),
                              color: Colors.cyan,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(1, 1),
                              color: Colors.cyan,
                              blurRadius: 2,
                            ),
                            Shadow(
                              offset: Offset(-1, 1),
                              color: Colors.cyan,
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(-1, -1),
                        color: Colors.cyan,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: Offset(1, -1),
                        color: Colors.cyan,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: Offset(1, 1),
                        color: Colors.cyan,
                        blurRadius: 2,
                      ),
                      Shadow(
                        offset: Offset(-1, 1),
                        color: Colors.cyan,
                        blurRadius: 2,
                      ),
                    ],
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(),
    const SecondaryPage(),
    const ThirdPage(),
  ];

  final List<String> _appBarTitles = ["Control", "camera", "Statistics"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.share),
            onPressed: () {
              Share.share('check out my website https://google.com',
                  subject: 'Look what I made!');
            }),
        appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text(_appBarTitles[_currentIndex],
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.notifications),
                  color: Colors.black),
            ]),
        body: _pages[_currentIndex],
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('user_1'),
                accountEmail: Text('user_1@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.control_point),
              label: "CONTROL",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_rounded),
              label: "Camera",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_rounded),
              label: "Statistics",
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            color: Colors.grey,
            height: 130,
            width: double.infinity,
            child: Column(
              children: [
                Container(height: 70),
                const Text(
                  "here the video streams from camera",
                )
              ],
            )),
        Joystick(
          listener: (details) {
            // Handle joystick movement here
            double x = details.x;
            double y = details.y;
            // Use x and y values to control your object's movement
          },
          mode: JoystickMode.all,
          period: const Duration(milliseconds: 100),
        ),
        const MyButton(),
      ],
    );
  }
}

class SecondaryPage extends StatelessWidget {
  const SecondaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey,
          height: 130,
          width: 50,
          child: Column(
            children: [
              Container(height: 70),
              const Text(
                "first image",
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          height: 130,
          width: 50,
          child: Column(
            children: [
              Container(height: 70),
              const Text(
                "second image",
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            // Your button action here
            print('Start taking images using rasperipi camera');
          },
          style: ElevatedButton.styleFrom(
            // Customize button appearance as needed
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.blue,
            elevation: 5, // Adjust elevation
          ),
          child: const Text('start taking images using rasperipi camera'),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () {
            // Your button action here
            print(
                'sending images to data base to convert images to pdf extention');
          },
          style: ElevatedButton.styleFrom(
            // Customize button appearance as needed
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.blue,
            elevation: 5, // Adjust elevation
          ),
          child: const Text('convert  images to PDF'),
        )
      ],
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Text("the value of mq4 = "),
            Container(
              color: Colors.grey,
              height: 30,
              width: 50,
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text("the value of mq4 = "),
            Container(
              color: Colors.grey,
              height: 30,
              width: 50,
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text("the value of mq4 = "),
            Container(
              color: Colors.grey,
              height: 30,
              width: 50,
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text("the coordinates of gps module= "),
            Container(
              color: Colors.grey,
              height: 30,
              width: 50,
            )
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Your button action here
            print('start sendig value to data base');
          },
          style: ElevatedButton.styleFrom(
            // Customize button appearance as needed
            textStyle: const TextStyle(fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.blue,
            elevation: 5, // Adjust elevation
          ),
          child: const Text('get the previous statistics as excel sheet'),
        )
      ],
    );
  }
}

class MyButton extends StatefulWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isOn = true; // Flag to track button state

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setState(() => _isOn = !_isOn), // Toggle state on press
      style: ElevatedButton.styleFrom(
        backgroundColor: _isOn ? Colors.green : Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(_isOn ? 'Turn on' : 'Turn off'),
    );
  }
}

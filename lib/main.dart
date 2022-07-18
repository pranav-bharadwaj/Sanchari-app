import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sanchari/Models/user_model.dart';
import 'package:sanchari/Providers/darkTheme_provider.dart';
import 'package:sanchari/Providers/qrCodeProvider.dart';
import 'package:sanchari/UI/Auth/Login.dart';
import 'package:sanchari/UI/Home/bookMark.dart';
import 'package:sanchari/UI/profile.dart';
import 'package:sanchari/constants.dart';
import 'package:sanchari/UI/Home/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sanchari/UI/Home/home.dart';
import 'package:sanchari/UI/Home/notifications.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DarkTheme()),
    ChangeNotifierProvider(create: (_) => QrcodeProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final bool isLightMode
    // Theme.of(context).brightness == Brightness.light ? true : false;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sanchari',
        theme:
            context.watch<DarkTheme>().isLightMode ? kLightTheme : kDarkTheme,
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: Column(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/sanchari.jpeg'),
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sanchari",
                  style: TextStyle(
                      fontSize: 25, letterSpacing: 2, color: Colors.white),
                )
              ],
            ),
            splashIconSize: 140,
            nextScreen: FirebaseAuth.instance.currentUser != null
                ? MyHomePage()
                : Login(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: const Color(0xffE3002C)));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  final String title = "Sanchari";

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final navigationtionKey = GlobalKey<CurvedNavigationBarState>();

  final screens = [
    Home(),
    Search(),
    Bookmark(),
    Notifications(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  User? user = FirebaseAuth.instance.currentUser;
  

  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user?.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      print("fetching");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: kAccentColor,
        elevation: _selectedIndex == 0 ? 0 : 6,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => user != null ? Profile() : Login()),
                );
              },
              icon: const Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(
            Icons.home,
            color: context.watch<DarkTheme>().isLightMode && _selectedIndex != 0
                ? kAccentColor
                : Colors.white,
          ),
          Icon(
            Icons.search,
            color: context.watch<DarkTheme>().isLightMode && _selectedIndex != 1
                ? kAccentColor
                : Colors.white,
          ),
          Icon(
            Icons.bookmark,
            color: context.watch<DarkTheme>().isLightMode && _selectedIndex != 2
                ? kAccentColor
                : Colors.white,
          ),
          Icon(
            Icons.notifications,
            color: context.watch<DarkTheme>().isLightMode && _selectedIndex != 3
                ? kAccentColor
                : Colors.white,
          ),
        ],
        height: 60,
        color: context.watch<DarkTheme>().isLightMode
            ? kLightPrimaryColor
            : kDarkPrimaryColor,
        buttonBackgroundColor: kAccentColor,
        backgroundColor: context.watch<DarkTheme>().isLightMode
            ? kLightSecondaryColor
            : kDarkSecondaryColor,
        animationDuration: Duration(milliseconds: 500),
        index: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
// Old Bottom app bar

BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
    
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xffE3002C),
        onTap: _onItemTapped,
      ),
*/

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainsmarter/firebase_options.dart';

import 'View/HomePage.dart';
import 'View/ProfilePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyStartPage(),
    );
  }
}

class MyStartPage extends StatefulWidget {
  const MyStartPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyStartPage> createState() => _MyStartPageState();
}

class _MyStartPageState extends State<MyStartPage> {
  var currentIndex = 0;

  final _pages = [
    const MyHomePage(),
    const MyProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: _pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    IconData(0xf07a, fontFamily: 'MaterialIcons'),
                ),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.person_rounded,
                ),
                label: "Profile"
            )
          ], // Required if you're managing state
          onTap: (index) {
            setState(() => currentIndex = index);
          },
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


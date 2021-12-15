import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_krista2/models/beer.dart';
import 'package:project_krista2/pages/home.dart';
import 'package:provider/provider.dart';
import 'models/cart.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BeerDataProvider>(
            create: (context) => BeerDataProvider()),
        ChangeNotifierProvider<CartDataProvider>(
            create: (context) => CartDataProvider()),
      ],
      child: MaterialApp(
        title: 'Beer collection',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            backgroundColor: Colors.white,
            textTheme: GoogleFonts.marmeladTextTheme(
              Theme.of(context).textTheme,
            )),
        home: const HomePage(),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oru/firebase_options.dart';
import 'package:oru/providers/productsProvider.dart';
import 'package:oru/screens/homeScreen.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => ProductsProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Oru Phones",
            theme: ThemeData(
              backgroundColor: white,
            ),
            home: HomeScreen(),
          );
        });
  }
}

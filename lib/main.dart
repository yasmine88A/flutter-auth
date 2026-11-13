
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Screens/home.page.dart';
import 'Screens/login.page.dart';
import 'Screens/register.page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fihdfjxjshawdvmntrxj.supabase.co',
    publishableKey: 'sb_publishable_DgHY3RLOYon5I6jXhkYmzg_vlv_dpcL',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => Registerpage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:music_player_app/model/playlist_provider.dart';
//import 'package:music_player_app/theme/dark_mode.dart';
//import 'package:music_player_app/theme/light_mode.dart';
import 'package:music_player_app/theme/themes_provider.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
void main(){
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      ChangeNotifierProvider(create: (context)=> PlaylistProvider()),
    ] ,
    child: const MyApp(),   
    ),

   );
  
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       home: HomePage(),
       theme: Provider.of<Themeprovider>(context).themeData,
    );
  }
}
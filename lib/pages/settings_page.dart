import'package:flutter/material.dart';
import 'package:music_player_app/theme/themes_provider.dart';
import 'package:provider/provider.dart';
class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title :Text ("S E T T I N G S"),
        
      ),
      body:
      Container(
        decoration: BoxDecoration(
          color:Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(25),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                const Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold),
                             ),

                Switch(
                  value:
                   Provider.of<Themeprovider>(context,listen: false).isDarkMode,
                   onChanged: ( value) =>
                   Provider.of<Themeprovider>(context,listen: false)
                        .toggleTheme(),

                )
        ]),
      ) ,
    );

    
  }
}
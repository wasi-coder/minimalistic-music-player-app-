import 'package:flutter/material.dart';
import 'package:music_player_app/components/my_drawer.dart';
import 'package:music_player_app/model/playlist_provider.dart';
import 'package:music_player_app/model/song.dart';
import 'package:music_player_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   late PlaylistProvider playlistProvider ;


 void initState(){
  super.initState();

  playlistProvider=Provider.of<PlaylistProvider>(context,listen: false);
  
 }

 void goToSong(int songIndex){

    //update current song index
    //var playListProvider;
    playlistProvider.currentSongIndex =songIndex;



    //navigate to song page
    Navigator.push( context, 
       MaterialPageRoute(
        builder: (context)=>SongPage(),
      ),);

 }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("P L A Y L I S T")),
      drawer: MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child){
              //get the playlist 
              final List<Song> playlist =value.playlist;
              


              //return listview Ui
              return ListView.builder(
               itemCount: playlist.length,
               itemBuilder:(context, index) {
                //get individual song
                  final Song song = playlist[index];
                  

                //return list tile ui
                
                return  ListTile(
                  title: Text (song.songName),
                  subtitle: Text(song.artistName),
                  leading: const Icon(Icons.music_note_outlined),
                  onTap: ()=> goToSong(index),
                );

               },
            );
            

        },
        ),
      );
  }
}

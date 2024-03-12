import 'package:flutter/material.dart';
import 'package:music_player_app/components/neu_box.dart';
import 'package:music_player_app/model/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {

        //get playlist
        final playlist =value.playlist;


        // get current song index
        final currentSong = playlist [value.currentSongIndex?? 0];

        //return scaffold ui

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          
          body: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 25.0, bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      IconButton(
                          onPressed: () =>Navigator.pop(context),
                           icon: const Icon(Icons.arrow_back)),

                      //title
                      Text("P L A Y L I S T"),

                      //menu button
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                    ],
                  ),

                  //album artwork

                  NeuBox(
                      child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          currentSong.albumImagepath,
                          height: 250,
                          width: 250,
                        ),
                      ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            
                            children: [
                              Text(currentSong.songName,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(currentSong.artistName),
                            ],
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: 25),

                  //somg duration progress
                  Column(
                    children: [
                    const   Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("0:00"),
                            Icon(Icons.shuffle),
                            Icon(Icons.repeat),
                            Text("0.00"),
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 0
                          ),

                        ),
                        child: Slider(
                          min: 0,
                          max: value.totalDuration.inSeconds.toDouble(),
                          value: value.currentDuration.inSeconds.toDouble(),
                          activeColor: const Color.fromARGB(255, 0, 212, 205),
                          onChanged: (double double) {
                        


                          },
                          onChangeEnd:(double double){
                            value.seek(Duration(seconds: double.toInt()));

                          } ,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),

                  //playback controls

                  Row(
                    children: [
                      Expanded(
                         child: GestureDetector(
                          onTap: value.playPreviousSong ,
                          child: NeuBox(
                            child: Icon(Icons.skip_previous),
                           ),
                        ),
                      ),
                      SizedBox(width: 20),

                      Expanded(
                        flex: 2,
                         child: GestureDetector(
                          onTap: value.pauseOrResume  ,
                          child: NeuBox(
                          child: Icon(
                              value.isPlaying ?
                               Icons.pause :
                               Icons.play_arrow),
                           ),
                        ),
                      ),
                      SizedBox(width: 20),

                      Expanded(
                         child: GestureDetector(
                          onTap: value.playNextSong ,
                          child:const NeuBox(
                            child: Icon(Icons.skip_next),
                           ),
                        ),
                      ),

                      
                     ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}

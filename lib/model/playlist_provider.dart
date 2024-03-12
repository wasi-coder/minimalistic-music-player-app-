import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
     Song(
         songName:"ONIKET PRANTOR",
        artistName: "Artcell",
        albumImagepath: "assets/cover_pics/Oniket-prantor.jpg",
        audiopath: "assets/songs/Toh Phir Aao Remix Awarapan 320 Kbps [vocals].mp3",
        ),
        
        //song 2

        Song(
         songName:"HUSN",
        artistName: "Anuv Jain",
        albumImagepath: "assets/cover_pics/cover_art.png",
        audiopath:"assets/songs/Toh Phir Aao Remix Awarapan 320 Kbps [vocals].mp3" ,
        ),
  ];

  int? _currentSongIndex;

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  PlaylistProvider() {
    listenToDuration();
  }

  bool get isPlaying => _isPlaying;
  bool _isPlaying = false;

  // Play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audiopath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // Pause
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Resume
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Seek to the location of the current song
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  // Play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // Play previous song
  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
      
      // Handle seeking to the beginning of the current song
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // Listen to duration
  void listenToDuration() {
    // Total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Completed
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Getters
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Setters
  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;

    if(newIndex != null){
      play();

    }
    notifyListeners();
  }
}

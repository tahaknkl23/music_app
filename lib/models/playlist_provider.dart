import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlayListProvider extends ChangeNotifier {
//plaslist of songs //şarkıların listesi
  final List<Song> _playlist = [
    //song 1
    Song(SongName: "Yine De Sens", artistName: "Ayça Özefe", albumArtImagePath: "assets/images/yinedesen.png", audioPath: "audio/yinedesen.mp3"),

    //song 2
    Song(
      SongName: "Gökyüzüm",
      artistName: "Pera",
      albumArtImagePath: "assets/images/pera.png",
      audioPath: "audio/pera.mp3",
    ),

    //song 3
    Song(
      SongName: "Bu Yüzden",
      artistName: "Güncel Gürsel Artiktay",
      albumArtImagePath: "assets/images/buyuzden.png",
      audioPath: "audio/buyuzden.mp3",
    ),
  ];
  //current song playing index //çalan şarkının indeksi
  int? _currentSongIndex;

  /*
    A U D I O   P L A Y E R   C O D E
   */

//audio player  //ses çalar
  final AudioPlayer _audioPlayer = AudioPlayer();

//duration  //sesin
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

//constructor //yapıcı

  PlayListProvider() {
    listenDuration();
  }

//initiality not playing //başlangıçta çalmıyor
  bool _isPlaying = false;

//play the song //şarkıyı çal
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); //stop current song //mevcut şarkıyı durdur
    await _audioPlayer.play(AssetSource(path)); //play the new  song //yeni şarkıyı çal
    _isPlaying = true; //update the UI //UI'yi güncelle
    notifyListeners();
  }

//pause current song //mevcut şarkıyı duraklat
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

// resume playing //şarkıyı devam ettir
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

//pause or resume //duraklat veya devam et
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

//seek to a specific position in the current song //mevcut şarkıda belirli bir konuma git
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    notifyListeners();
  }

//play next song //bir sonraki şarkıyı çal
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        //go to the next song if it's not the last song //son şarkı değilse bir sonraki şarkıya git
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        //if it's the last song,loop back to the first song //son şarkıysa, ilk şarkıya dön
        _currentSongIndex = 0;
      }
    }
  }

//play previous song //önceki şarkıyı çal
  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
      //if the current song has played for more than 2 seconds, go back to the beginning //mevcut şarkı 2 saniyeden fazla çalmışsa, başa dön
    } else {
      if (_currentSongIndex! > 0) {
        //go to the previous song if it's not the first song //ilk şarkı değilse bir önceki şarkıya git
        _currentSongIndex = _currentSongIndex! - 1;
      }
    }
  }

//list to duration //süreyi dinle
  void listenDuration() {
    //listen for total duration //toplam süreyi dinle
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration //mevcut süreyi dinle
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song completion //şarkı tamamlanmasını dinle
    _audioPlayer.onPlayerComplete.listen((event) {
      //play the next song //bir sonraki şarkıyı çal
      playNextSong();
    });
  }

//dispose  audio player //ses çaları at

  /* 
  G E T T E R S 
  */

  //getter for playlist //playlist için getter metodu
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

/* 
S E T T E R   M E T H O D S

*/

  //setter for current song index //mevcut şarkı indeksi için setter metodu
  set currentSongIndex(int? newIndex) {
    //update the current song index //mevcut şarkı indeksini güncelle
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      //play the song //şarkıyı çal
      play();
    }

    //update the UI //UI'yi güncelle
    notifyListeners();
  }
}

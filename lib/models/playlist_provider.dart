import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlayListProvider extends ChangeNotifier {
//plaslist of songs //şarkıların listesi
  final List<Song> _playlist = [
    //song 1
    Song(
        SongName: "Yine De Sens",
        artistName: "Ayça Özefe",
        albumArtImagePath: "assets/images/yinedesen.png",
        audioPath: "assets/audios/yinedesen.mp3"),

    //song 2
    Song(
      SongName: "Gökyüzüm",
      artistName: "Pera",
      albumArtImagePath: "assets/images/pera.png",
      audioPath: "assets/audios/pera.mp3",
    ),

    //song 3
    Song(
      SongName: "Bu Yüzden",
      artistName: "Güncel Gürsel Artiktay",
      albumArtImagePath: "assets/images/buyuzden.png",
      audioPath: "assets/audios/buyuzden.mp3",
    ),
  ];
  //current song playing index //çalan şarkının indeksi
  int? _currentSongIndex;

  //getter for playlist //playlist için getter metodu
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //setter for current song index //mevcut şarkı indeksi için setter metodu
  set currentSongIndex(int? newIndex) {
    //update the current song index //mevcut şarkı indeksini güncelle
    _currentSongIndex = newIndex;
    //update the UI //UI'yi güncelle
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:music_app/components/my_drawer.dart';
import 'package:music_app/components/text_constant.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // get the playlist from the provider //sağlayıcıdan çalma listesini al
  late final dynamic playListProvider;

  @override
  void initState() {
    super.initState();

    //get the playlist from the provider //sağlayıcıdan çalma listesini al

    playListProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  //go to the song  //şarkıya git
  void gotoSong(int songIndex) {
    //update the current song index //mevcut şarkı dizinini güncelle
    playListProvider.currentSongIndex = songIndex;
    //navigate to the song page //şarkı sayfasına git
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: customText(text: "Playlist", isBold: false),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlayListProvider>(builder: (context, value, child) {
        //get the playlist from the provider //sağlayıcıdan çalma listesini al
        final List<Song> playlist = value.playlist;

        return ListView.builder(
          itemCount: playlist.length,
          itemBuilder: (context, index) {
            //get individual song //bireysel şarkıyı al
            final Song song = playlist[index];

            //return ListTile tile UI //ListTile tile UI döndür
            return ListTile(
                title: Text(song.SongName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => gotoSong(index));
          },
        );
      }),
    );
  }
}

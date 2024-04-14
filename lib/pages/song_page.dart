import 'package:flutter/material.dart';
import 'package:music_app/components/neu_box.dart';
import 'package:music_app/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(builder: (context, value, child) {
      //get playlist//çalma listesini al
      final playlist = value.playlist;

      //get the current song  //mevcut şarkıyı al
      final currentSong = playlist[value.currentSongIndex ?? 0];

      //return the song page UI //şarkı sayfası UI'sını döndür
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),

                    //title
                    const Text("P L A Y L I S T"),

                    //menu button
                    IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  ],
                ),
                const SizedBox(height: 25),
                //album artwork// albüm sanatı
                NeuBox(
                    child: Column(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        currentSong.albumArtImagePath,
                        // height: 300,
                        // width: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    //song and artist name //şarkı ve sanatçı adı
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //song and artist name //şarkı ve sanatçı adı
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentSong.SongName, style: const TextStyle(fontSize: 24)),
                            Text(currentSong.artistName, style: const TextStyle(fontSize: 18, color: Colors.grey)),
                          ],
                        ),

                        //heart icon //kalp ikonu
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                )),
                const SizedBox(height: 25),
                //song duration progress //şarkı süresi ilerlemesi
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          //start and end time //başlangıç ve bitiş zamanı
                          Text("0:00"),
                          //shuffle icon //karıştırma ikonu
                          Icon(Icons.shuffle),

                          //repeat icon //tekrar ikonu
                          Icon(Icons.repeat),

                          //end time //bitiş zamanı
                          Text("3:45"),
                        ],
                      ),
                    ),
                    //song duration progress bar //şarkı süresi ilerleme çubuğu
                    SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0),
                        ),
                        child: Slider(min: 0, max: 100, value: 0, activeColor: Colors.green, onChanged: (value) {}))
                  ],
                ),
                const SizedBox(height: 25),

                //playback controls //çalma kontrolleri
                Row(
                  children: [
                    //skip previous //önceki şarkıya atla
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(width: 25),
                    //play pause button //oynat duraklat düğmesi

                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: const NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),

                    //skip forward //sonraki şarkıya atla
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

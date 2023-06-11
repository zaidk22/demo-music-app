import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  List<AudioPlayer> audioPlayers = [];
  List<bool> isPlaying = [false, false, false];

  @override
  void onInit() {
    super.onInit();
    initializeAudioPlayers();
  }

  void initializeAudioPlayers() {
    audioPlayers = [
      AudioPlayer(),
      AudioPlayer(),
      AudioPlayer(),
    ];
  }

  void playAudio(int index) async {
    if (index >= 0 && index < audioPlayers.length) {
      AudioPlayer audioPlayer = audioPlayers[index];
      if (!isPlaying[index]) {
        await audioPlayer.play(AssetSource('songs/${index + 1}.mp3'),);
        isPlaying[index] = true;
        update();
      } else {
        await audioPlayer.pause();
        isPlaying[index] = false;
        update();
      }
    }
  }

  void disposeAudioPlayers() {
    audioPlayers.forEach((audioPlayer) => audioPlayer.release());
  }

  @override
  void onClose() {
    disposeAudioPlayers();
    super.onClose();
  }
}

import 'package:flame_audio/flame_audio.dart';
import '../services/settings_provider.dart';

Future<void> loadAudio() async {
  await FlameAudio.audioCache.loadAll([
    'click.mp3',
    'back.mp3',
    'code_enter.mp3',
    'code_del.mp3',
    'start.mp3',
  ]);
  await FlameAudio.bgm.audioCache.loadAll(['menu.mp3']);
}

void initializeAndPlayAudio() {
  FlameAudio.bgm.initialize();
  if (!FlameAudio.bgm.isPlaying)
    FlameAudio.bgm.play(
      "menu.mp3",
      volume: SettingsProvider.musicVolume,
    );
}
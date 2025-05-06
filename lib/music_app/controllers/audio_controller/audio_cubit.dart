import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:meta/meta.dart';
import '../../core/constants/ringtones.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit() : super(AudioInitial()){
    _player = AudioPlayer();
    _currentTrackIndex = 0;
    _progress = 0;
    _position = 0;
    _isLooping = false;
    _isShuffle = false;
    _currentAudioDuration = Duration.zero;
  }


  late AudioPlayer _player;
  AudioPlayer get player => _player;
  late ConcatenatingAudioSource _audioSource;
  Future<void> initPlaylist() async {
    try {
      _audioSource = ConcatenatingAudioSource(
        children: tracks.map((track) => AudioSource.asset(
          track.sound,
          tag: MediaItem(
            id: '1',
            album: '',
            title: track.name,
          ),
        )).toList(),
      );
      await _player.setAudioSource(_audioSource);
      emit(SetAudioPathState());
    } catch (e) {
      print("Error loading playlist: $e");
    }
  }

  Future<void> onPlayAudio(int index) async {
    await _player.seek(Duration.zero, index: index);
    await play();
    emit(OnPlayAudioState());
  }

  Future<void> play() async{
    await _player.play();
    emit(PlayState());
  }

  Future<void> pause() async{
    await _player.pause();
    emit(PauseState());
  }

  late bool _isLooping;
  bool get isLooping => _isLooping;
  Future<void> loop() async{
    _isLooping = !_isLooping;
    await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
    emit(LoopState());
  }

  late bool _isShuffle;
  bool get isShuffle => _isShuffle;
  Future<void> shuffle() async{
    _isShuffle = !_isShuffle;
    await _player.setShuffleModeEnabled(_isShuffle);
    emit(ShuffleState());
  }


  Future<void> seek({required int value}) async{
    await _player.seek(Duration(milliseconds: value * 1000));
    emit(SeekState());
  }

  Future<void> playNext() async {
    if (_player.hasNext) {
      await _player.seekToNext();
      await play();
    }else{
      await onPlayAudio(0);
    }
    emit(PlayNextState());
  }

  Future<void> playPrevious() async {
    if (_player.hasPrevious) {
      await _player.seekToPrevious();
      await play();
    }else{
      await onPlayAudio(tracks.length - 1);
    }
    emit(PlayPreviousState());
  }

  void disposeAudioPlayer(){
    _player.dispose();
  }

  late int _position;
  int get position => _position;

  late int _progress;
  int get progress => _progress;

  late int _currentTrackIndex;
  int get currentTrackIndex => _currentTrackIndex;

  late Duration _currentAudioDuration;
  Duration get currentAudioDuration => _currentAudioDuration;

  void onPlayListener() async{
    _player.currentIndexStream.listen((index){
      _currentTrackIndex = index ?? 0;
      emit(OnPlayListenerState());
    });

    _player.durationStream.listen((event){
      _currentAudioDuration = event ?? Duration.zero;
      emit(OnPlayListenerState());
    });

    _player.positionStream.listen((event){
      _position = event.inMilliseconds;
      emit(OnPlayListenerState());
    });
  }


}

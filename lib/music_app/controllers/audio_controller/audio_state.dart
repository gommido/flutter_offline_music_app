part of 'audio_cubit.dart';

@immutable
abstract class AudioState {}

class AudioInitial extends AudioState {}

class SetCurrentTrackState extends AudioState {}

class SetAudioPathState extends AudioState {}


class OnPlayAudioState extends AudioState {}

class PlayState extends AudioState {}

class PauseState extends AudioState {}

class LoopState extends AudioState {}

class ShuffleState extends AudioState {}

class SeekState extends AudioState {}

class PlayNextState extends AudioState {}

class PlayPreviousState extends AudioState {}

class StopState extends AudioState {}

class OnPlayListenerState extends AudioState {}

class OnPlayerStateStreamState extends AudioState {}

class GetAudioDurationsSuccessState extends AudioState {}

class GetCurrentAudioDurationState extends AudioState {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_music_app/music_app/core/components/bloc_consumer_widget.dart';
import 'package:flutter_offline_music_app/music_app/core/components/custom_widgets/custom_gesture_detector.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/ringtone_title_widget.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/waves_gif_widget.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/custom_widgets/custom_builder.dart';
import '../../../../core/components/custom_widgets/custom_container.dart';
import '../../../../core/components/custom_widgets/custom_row.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../models/track_model.dart';
import 'animation_audio_progress_widget.dart';


class TrackWidget extends StatelessWidget {
  const TrackWidget({super.key, required this.track, required this.index,});
  final TrackModel track;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomGestureDetector(
          onTap: () {
            if(context.read<AudioCubit>().currentTrackIndex != index){
              context.read<AudioCubit>().pause();
              context.read<AudioCubit>().onPlayAudio(index);
            }else{
              if(context.read<AudioCubit>().player.playing){
                context.read<AudioCubit>().pause();
              }else{
                context.read<AudioCubit>().play();
              }
            }

          },
          child: Stack(
            children: [
              AnimationAudioProgressWidget(index: index,),
              CustomContainer(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: size.width,
                height: size.height / 10,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorManager.white.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: CustomBuilder(
                  builder: (context) {
                    return CustomRow(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RingtoneTitleWidget(name: track.name),
                        WavesGifWidget(index: index,),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

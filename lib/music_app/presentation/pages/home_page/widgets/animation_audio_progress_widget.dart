import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/custom_widgets/custom_builder.dart';
import '../../../../core/resources/color_manager.dart';

class AnimationAudioProgressWidget extends StatelessWidget {
  const AnimationAudioProgressWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomBuilder(
      builder: (context) {
        final audioCubit = context.read<AudioCubit>();
        final isCurrentTrack = context.read<AudioCubit>().currentTrackIndex == index;
        final progress = audioCubit.position;
        final total = audioCubit.currentAudioDuration.inMilliseconds;
        final percent = (total > 0) ? (progress / total).clamp(0.0, 1.0) : 0.0;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: isCurrentTrack ? size.width * percent : 0,
          height: size.height / 10,
          decoration: BoxDecoration(
            color: ColorManager.teal.withOpacity(0.3),
            borderRadius: BorderRadius.circular(5.0),
          ),
        );
      },
    );
  }
}

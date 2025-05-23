import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/bloc_consumer_widget.dart';
import '../../../../core/resources/color_manager.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Slider(
          activeColor: ColorManager.white,
          inactiveColor: ColorManager.white.withOpacity(0.1),
          thumbColor: ColorManager.white,
          value: (context.read<AudioCubit>().position ~/ 1000).toDouble(),
          min: 0,
          max: context.read<AudioCubit>().currentAudioDuration.inSeconds.toDouble(),
          onChanged: (value){
            context.read<AudioCubit>().seek(value: value.toInt());
          },
        );
      },
    );
  }
}

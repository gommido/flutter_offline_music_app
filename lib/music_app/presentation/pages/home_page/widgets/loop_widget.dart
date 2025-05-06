import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/bloc_consumer_widget.dart';
import '../../../../core/components/custom_widgets/custom_expanded.dart';
import '../../../../core/components/custom_widgets/custom_icon.dart';
import '../../../../core/components/custom_widgets/custom_icon_button.dart';
import '../../../../core/resources/color_manager.dart';

class LoopWidget extends StatelessWidget {
  const LoopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomExpanded(
          child: CustomIconButton(
            onPressed: () {
              if(context.read<AudioCubit>().isShuffle){
                context.read<AudioCubit>().shuffle();
              }
              context.read<AudioCubit>().loop();
            },
            icon: CustomIcon(
              icon: Icons.loop,
              color: context.read<AudioCubit>().isLooping ? Colors.yellow : ColorManager.white,
              size: 20,
            ),
          ),
        );
      },
    );
  }
}

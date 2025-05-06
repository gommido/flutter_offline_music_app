
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/bloc_consumer_widget.dart';
import '../../../../core/components/custom_widgets/custom_expanded.dart';
import '../../../../core/components/custom_widgets/custom_icon.dart';
import '../../../../core/components/custom_widgets/custom_icon_button.dart';

class PlayPauseWidget extends StatelessWidget {
  const PlayPauseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
  builder: (context, state) {
    return CustomExpanded(
      child: CustomIconButton(
        onPressed: (){
          if(context.read<AudioCubit>().player.playing){
            context.read<AudioCubit>().pause();
          }else{
            context.read<AudioCubit>().play();
          }
        },
        icon: CustomIcon(
          icon: context.read<AudioCubit>().player.playing ?
          Icons.pause_circle : Icons.play_circle_fill,
        ),
      ),
    );
  },
);
  }
}

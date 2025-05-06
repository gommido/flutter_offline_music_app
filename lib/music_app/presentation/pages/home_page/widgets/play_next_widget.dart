import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/custom_widgets/custom_expanded.dart';
import '../../../../core/components/custom_widgets/custom_icon.dart';
import '../../../../core/components/custom_widgets/custom_icon_button.dart';

class PlayNextWidget extends StatelessWidget {
  const PlayNextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomExpanded(
      child: CustomIconButton(
        onPressed: (){
          if(context.read<AudioCubit>().isLooping){
            context.read<AudioCubit>().loop();
          }
          context.read<AudioCubit>().playNext();
        },
        icon: CustomIcon(
          icon: Icons.skip_next,
        ),
      ),
    );

  }
}

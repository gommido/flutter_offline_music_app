
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/play_next_widget.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/play_pause_widget.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/play_previous_widget.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/shuffle_widget.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/bloc_consumer_widget.dart';
import '../../../../core/components/custom_widgets/custom_column.dart';
import '../../../../core/components/custom_widgets/custom_container.dart';
import '../../../../core/components/custom_widgets/custom_row.dart';
import '../../../../core/components/custom_widgets/custom_text.dart';
import '../../../../core/constants/ringtones.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import 'loop_widget.dart';

class AudioControlWidget extends StatelessWidget {
  const AudioControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomContainer(
          width: size.width,
          height: size.height / 5,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/audio_control_bg.webp'),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
          ),
          child: CustomColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                data: tracks[context.read<AudioCubit>().currentTrackIndex].name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: FontManager.s08,
                ),
              ),
              CustomRow(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ShuffleWidget(),
                  PlayPreviousWidget(),
                  PlayPauseWidget(),
                  PlayNextWidget(),
                  LoopWidget(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/audio_controller/audio_cubit.dart';
import '../../../../core/components/bloc_consumer_widget.dart';
import '../../../../core/components/custom_widgets/custom_builder.dart';
import '../../../../core/components/custom_widgets/custom_container.dart';
import '../../../../core/components/custom_widgets/custom_sized_box.dart';

class WavesGifWidget extends StatelessWidget {
  const WavesGifWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumerWidget<AudioCubit, AudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomBuilder(
          builder: (context) {
            if (context.read<AudioCubit>().currentTrackIndex == index) {
              return CustomContainer(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                width: size.width / 20,
                height: size.height / 20,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/waves.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            return CustomSizedBox();
          },
        );
      },
    );
  }
}

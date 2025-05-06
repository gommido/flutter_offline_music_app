import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_music_app/music_app/core/constants/app_strings.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/track_widget.dart';

import '../../../controllers/audio_controller/audio_cubit.dart';
import '../../../core/components/custom_widgets/custom_container.dart';
import '../../../core/components/custom_widgets/custom_sized_box.dart';
import '../../../core/components/custom_widgets/custom_text.dart';
import '../../../core/constants/ringtones.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AudioCubit _audioCubit;

  @override
  void initState() {
    super.initState();
    _audioCubit =  BlocProvider.of<AudioCubit>(context, listen:  false);
    _audioCubit.initPlaylist();
    _audioCubit.onPlayListener();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          data: AppStrings.appName,
          style: Theme.of(context).textTheme.bodyLarge!,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomContainer(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
          ),
          child: ListView.separated(
            itemCount: tracks.length, separatorBuilder: (context, index)=> CustomSizedBox(height: size.height / 100,),
            itemBuilder: (context, index){
              final track = tracks[index];
              return TrackWidget(track: track, index: index);
            },
          ),
        ),
      ),
    );

  }
}

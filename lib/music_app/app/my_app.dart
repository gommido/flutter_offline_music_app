import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline_music_app/music_app/controllers/audio_controller/audio_cubit.dart';
import '../core/constants/app_strings.dart';
import '../presentation/pages/home_page/home_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context)=> AudioCubit()
              ..initPlaylist()
              ..onPlayListener(),
          ),
        ],
        child: const MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          home:  HomePage(),
        ),
    );
  }
}

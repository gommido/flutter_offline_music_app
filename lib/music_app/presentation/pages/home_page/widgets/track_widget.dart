
import 'package:flutter/material.dart';
import 'package:flutter_offline_music_app/music_app/presentation/pages/home_page/widgets/ringtone_title_widget.dart';
import '../../../../core/components/custom_widgets/custom_container.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../models/track_model.dart';


class TrackWidget extends StatelessWidget {
  const TrackWidget({super.key, required this.track, required this.index,});
  final TrackModel track;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomContainer(
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
      child: RingtoneTitleWidget(name: track.name),
    );
  }
}

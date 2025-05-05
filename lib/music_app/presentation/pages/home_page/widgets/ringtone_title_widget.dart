
import 'package:flutter/material.dart';
import '../../../../core/components/custom_widgets/custom_container.dart';
import '../../../../core/components/custom_widgets/custom_text.dart';

class RingtoneTitleWidget extends StatelessWidget {
  const RingtoneTitleWidget({super.key, required this.name,});
  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      decoration: const BoxDecoration(
          color: Colors.transparent
      ),
      child: CustomText(
        data:  name,
        style: Theme.of(context).textTheme.bodySmall!,
      ),
    );
  }
}

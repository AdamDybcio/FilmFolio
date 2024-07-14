import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/styles/styles.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, required this.rate});

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(5, (index) {
        int fullStars = rate ~/ 2;
        bool hasHalfStar = rate % 2 >= 1;
        if (index < fullStars) {
          return FaIcon(
            FontAwesomeIcons.solidStar,
            color: Colors.yellow,
            size: 15,
            shadows: Styles(context: context).iconShadows,
          );
        } else if (hasHalfStar && index == fullStars) {
          return FaIcon(
            FontAwesomeIcons.starHalfStroke,
            color: Colors.yellow,
            size: 15,
            shadows: Styles(context: context).iconShadows,
          );
        } else {
          return FaIcon(
            FontAwesomeIcons.star,
            color: Colors.grey,
            size: 15,
            shadows: Styles(context: context, isStarIcon: true).iconShadows,
          );
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';

class AdultWidget extends StatelessWidget {
  const AdultWidget({
    super.key,
    this.width = 45,
    this.height = 45,
    this.hasShadow = false,
  });

  final double width;
  final double height;
  final bool hasShadow;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
          boxShadow: hasShadow ? Styles(context: context).containerShadows : null,
        ),
        child: FittedBox(
          fit: BoxFit.cover,
          child: Icon(
            Icons.eighteen_up_rating_rounded,
            color: Colors.white,
            size: 30,
            shadows: Styles(context: context).iconShadows,
          ),
        ),
      ),
    );
  }
}

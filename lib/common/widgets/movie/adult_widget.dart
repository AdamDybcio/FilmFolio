import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';

class AdultWidget extends StatelessWidget {
  const AdultWidget({
    super.key,
    this.width = 45,
    this.height = 45,
    this.hasShadow = false,
    this.alignment = Alignment.topLeft,
    this.padding,
  });

  final double width;
  final double height;
  final bool hasShadow;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding != null ? padding! : EdgeInsets.zero,
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
      ),
    );
  }
}

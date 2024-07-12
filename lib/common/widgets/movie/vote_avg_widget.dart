import 'package:flutter/material.dart';
import 'package:movie_bloc_app/common/styles/styles.dart';

class VoteAvgWidget extends StatelessWidget {
  const VoteAvgWidget({
    super.key,
    this.width = 45,
    this.height = 45,
    this.hasShadow = false,
    this.alignment = Alignment.topRight,
    this.padding,
    required this.voteAvg,
  });

  final double width;
  final double height;
  final bool hasShadow;
  final Alignment alignment;
  final EdgeInsetsGeometry? padding;
  final double voteAvg;

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
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
            boxShadow: hasShadow ? Styles(context: context).containerShadows : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: width,
                  height: height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Opacity(
                      opacity: 0.6,
                      child: Icon(
                        Icons.star,
                        color: Colors.orangeAccent,
                        shadows: Styles(context: context).iconShadows,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width,
                  height: height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      voteAvg == 10 ? voteAvg.toStringAsFixed(0) : voteAvg.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            shadows: Styles(context: context).textShadows,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

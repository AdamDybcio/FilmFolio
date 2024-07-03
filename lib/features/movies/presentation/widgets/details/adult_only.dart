import 'package:flutter/material.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';

class AdultOnly extends StatelessWidget {
  const AdultOnly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final color = dark ? Colors.black : Colors.white;
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.error,
            borderRadius: BorderRadius.circular(75),
            border: Border.all(
              color: Colors.red,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.red,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '18+',
                  style: TextStyle(
                    color: color,
                    shadows: [
                      Shadow(
                        color: color,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AdultOnly extends StatelessWidget {
  const AdultOnly({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.tertiary,
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: const FittedBox(
            fit: BoxFit.contain,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('18+'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

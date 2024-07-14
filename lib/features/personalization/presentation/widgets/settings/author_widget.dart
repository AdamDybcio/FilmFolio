import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.05,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Center(
                child: Text(
                  'Version 1.0.0 | © 2024 | All Rights Reserved | Adam Dybcio',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.25),
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

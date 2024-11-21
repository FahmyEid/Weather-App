import 'package:flutter/material.dart';

class NoweatherBody extends StatelessWidget {
  const NoweatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "there is no weather 😔 start",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            )
          ),
        ),
         Text(
          "Searching now 🔍",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          )
        ),
      ],
    );
  }
}

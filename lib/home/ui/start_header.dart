import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PhoneInputHeader extends StatelessWidget {
  const PhoneInputHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 50,
        ),
        SizedBox(
          width: 160,
          height: 160,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(1000)),
            child: Lottie.asset('images/cloudy-02.json'),
          ),
        ),
        const Divider(
          height: 20,
        ),
        Text(
          style: TextStyle(color: Colors.white, fontSize: 18),
          'Please enter a phone number:',
        ),
      ],
    );
  }
}

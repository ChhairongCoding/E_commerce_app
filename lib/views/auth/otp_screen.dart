import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PinTheme defaultTheme = PinTheme(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue,width: 1),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 88,
      width: 77,
      textStyle: const TextStyle(
        fontFamily: 'Sora',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        child: Column(
          spacing: 30,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter OTP",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(fontSize: 16, fontFamily: 'Sora'),
                children: [
                  TextSpan(
                    text:
                        'We’ve sent an SMS with an activation code to your phone ',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                  TextSpan(
                    text: '+855 972 725 271',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
            ),

            Pinput(
              defaultPinTheme: defaultTheme,
              focusedPinTheme: defaultTheme.copyBorderWith(
                border: Border.all(color: Colors.blue, width: 3),
              ),
              errorPinTheme: defaultTheme.copyBorderWith(
                border: Border.all(color: Colors.red, width: 3),
              ),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive code?",
                  style: TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Colors.blue,
                      fontFamily: 'Sora',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

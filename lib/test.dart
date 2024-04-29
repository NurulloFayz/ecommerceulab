/*
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class TestSms extends StatefulWidget {
  const TestSms({super.key});

  @override
  State<TestSms> createState() => _TestSmsState();
}

class _TestSmsState extends State<TestSms> {
  List<String> reciever = ['998948850677'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                sendSMS(message: 'This is test message', recipients: reciever);
              },
                child: Text('send sms')),

          ],
        ),
      ),
    );
  }
  void sendSms() async {
    List<String> reciever = ['998948850677'];
    await sendSMS(message: 'Hi there', recipients: reciever);

  }

}
*/

import 'package:ecommerce_ulab/pages/pages.dart';
import 'package:flutter/material.dart';

class OrderDonePage extends StatefulWidget {
  const OrderDonePage({super.key});

  @override
  State<OrderDonePage> createState() => _OrderDonePageState();
}

class _OrderDonePageState extends State<OrderDonePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 50,
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 50,
                ),
              ),
              Text(
                'Успешно',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * .04,
                ),
              ),
              Text(
                'Ваш заказ успешно был сделан',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * .02,
                ),
              ),
              Text(
                'Спасибо за выбор',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * .02,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * .07),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyPages(),
                    ),
                          (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Вернуться в главную',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * .024,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

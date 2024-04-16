import 'package:ecommerce_ulab/pages/order_done_page.dart';
import 'package:ecommerce_ulab/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderProductPage extends StatefulWidget {
  const OrderProductPage({super.key});

  @override
  State<OrderProductPage> createState() => _OrderProductPageState();
}

class _OrderProductPageState extends State<OrderProductPage> {
  final List<String> cities = [
    'Tashkent',
    'Samarkand',
    'Bukhara',
    'Nukus',
    'Andijan',
    'Namangan',
    'Fergana',
    'Kokand',
    'Jizzakh',
    'Khiva',
    'Gulistan',
    'Karshi',
    'Navoiy',
    'Termez',
    'Zarafshon',
  ];
  String? selectedCity;

  String selectedValue = 'Option1';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Оформление заказа'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: 30,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .04, vertical: screenWidth * .01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Город получения',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .026,
                ),
              ),
              SizedBox(height: screenHeight * .03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                width: screenWidth * .9,
                decoration: BoxDecoration(
                  color: greyShade1,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: greyShade1),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCity,
                  hint: Text('Город*'),
                  onChanged: (String? newValue) {
                    setState(() {
                      // Update the selected city
                      selectedCity = newValue;
                    });
                  },
                  items: cities.map<DropdownMenuItem<String>>((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: screenHeight * .03),
              Text(
                'Способ получения',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .026,
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Пункт выдачи UCommerce',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * .02,
                                    fontWeight: FontWeight.bold),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Можно забрать Завтра,',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: ' бесплатно ',
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          value: 'option1',
                          groupValue: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          title: Text('Доставка за 1 день'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          title: Text('Срок хранения заказа - 5 дней'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          title: Text('Можно проверить и примерить товар'),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                          title: Text('Возврат товара быстро и без проблем'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2),
                    child: RadioListTile<String>(
                      // title: const Text('Option 2'),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Курьером до двери',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenHeight * .02,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Доставим Завтра,',
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' бесплатно ',
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      value: 'option2',
                      groupValue: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          // Update the selected value
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .03),
              Text(
                'Адрес доставки',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .026,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                  ),
                  Text(
                    'Пункт выдачи UCommerce',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * .02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'г.Ташкент,Мирзо Улугбекский район ,улица Мирзо Улугбек,87 дом ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenHeight * .02,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '10:00-20:00, без выходных',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: screenHeight * .02,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: greyShade2,
                  minimumSize: Size(screenWidth, screenHeight * .05),
                ),
                onPressed: () {},
                child: Text(
                  'Изменить',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * .03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .03),
              Text(
                'Получатель заказа',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .026,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .05,
                    vertical: screenHeight * .01),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: greyShade2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Фамилия *',
                      style: TextStyle(color: grey),
                    ),
                    Text('Shokambarova'),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .05,
                    vertical: screenHeight * .01),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: greyShade2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Имя*',
                      style: TextStyle(color: grey),
                    ),
                    Text('Aziza'),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .05,
                    vertical: screenHeight * .01),
                width: screenWidth,
                decoration: BoxDecoration(
                  color: greyShade2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Номер телефона*',
                      style: TextStyle(color: grey),
                    ),
                    Text('+998 90 123 45 32'),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Text(
                'Мы пришлем уведомление о статусе заказа на указанный вами телефон',
                style: TextStyle(color: grey),
              ),
              SizedBox(
                height: screenHeight * .01,
              ),
              Text(
                'Способ оплаты',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: screenHeight * .026,
                ),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2),
                    child: Column(
                      children: [
                        RadioListTile<String>(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Картой онлайн',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * .02,
                                    fontWeight: FontWeight.bold),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'UZCARD, Humo, Visa, MasterCard',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          value: 'option1',
                          groupValue: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade2),
                    child: RadioListTile<String>(
                      // title: const Text('Option 2'),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Наличными или картой при получении',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenHeight * .018,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  'Оплата в пункте выдачи или курьеру при получении заказа',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      value: 'option2',
                      groupValue: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          // Update the selected value
                          selectedValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .03),
              Text(
                'Ваш заказ:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: screenHeight * .03,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1 товар:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1 919 00 сум',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого:*',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1 919 00 сум',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * .02,
                    vertical: screenHeight * .02),
                decoration: BoxDecoration(
                  color: greyShade2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  'Размещеная заказ,вы соглащаетесь на обработку персональных данных в соответсвии с Условиями, а так  же соглашаетесь с правилами  акции',
                ),
              ),
              SizedBox(height: screenHeight * .1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого:*',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1 919 00 сум',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * .02,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(screenWidth, screenHeight * .07),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderDonePage()));
                },
                child: Text(
                  'Оформить заказ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * .024,
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

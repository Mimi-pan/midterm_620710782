import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controllerlength = TextEditingController();
  var controllergirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          const SizedBox(height: 50.0),
          Text(
            'PIG WEIGHT',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32.0,
                color: Colors.pinkAccent),
          ),
          Text(
            'CALCULATOR',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.pinkAccent),
          ),
          SizedBox(height: 35.0),
          Image.asset('assets/images/pig.png', height: 180.0),
          SizedBox(height: 30.0),
          Row(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('LENGTH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.blueGrey)),
                        Text('(cm)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.blueGrey)),
                        TextField(
                          controller: controllerlength,
                          decoration: InputDecoration(hintText: 'Enter length'),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('GIRTH',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.blueGrey)),
                        Text('(cm)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.blueGrey)),
                        TextField(
                          controller: controllergirth,
                          decoration: InputDecoration(hintText: 'Enter girth'),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(child: ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent, minimumSize: Size(200, 70)),onPressed: (){
            var lengthText = controllerlength.text;
            var girthText = controllergirth.text;
            double? length = double.tryParse(lengthText);
            double? girth = double.tryParse(girthText);
            if(length == null || girth == null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("ERROR"),
                    content: const Text("Invalid input"),
                    actions: [
                      // ปุ่ม OK ใน dialog
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          // ปิด dialog
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
            else {
              double weight = (girth/100) * (girth/100) * (length/100) * 69.3;
              double price = 112.50 * weight;
              double minWeight = 0.97 * weight;
              double maxWeight = 1.03 * weight;
              double minPrice = 0.97*price;
              double maxPrice = 1.03*price;
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title:  Row(
                      children: [
                        Image.asset('assets/images/ic_pig.png',height: 20,),
                        Text('RESULT'),
                      ],
                    ),
                    content: Text('Weight: ${minWeight.round()} - ${maxWeight.round()} kg\nPrice: ${minPrice.round()} - ${maxPrice.round()} Baht'),
                    actions: [
                      // ปุ่ม OK ใน dialog
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          // ปิด dialog
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
              child: Text("Calculate",style: TextStyle(fontSize: 30),)))],
            ),
          )
        ]),
      ),
    );
  }
}

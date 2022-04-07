import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  late double h, w;
  double result = 0.0;
  bool isMale = true;

  String classification(double r) {
    if (r >= 18.5 && r <= 24.9) {
      return "You are Normal";
    } else if (r >= 25 && r <= 29.9) {
      return "You are Overweight";
    } else if (r >= 30 && r <= 34.9) {
      return "You are Obese";
    } else if (r >= 35 && r <= 39.9) {
      return "You are Severely Obese";
    } else if (r > 40) {
      return 'You are Morbid obese';
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 30, 100, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 30, 100, 100),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 140,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: !isMale ? Colors.blue : Colors.transparent,
                          width: 3,
                        ),
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset('assets/female.png',width:80,height: 115,)
                          ],
                        ),
                      ),

                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      height: 140,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isMale ? Colors.blue : Colors.transparent,
                          width: 3,
                        ),
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset('assets/male.png',width:80,height: 115,)
                          ],
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Your Height in Cm",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 140),
                      child: TextField(
                        onChanged: (h) {},
                        controller: height,
                        //initialValue: "0.0",
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style:
                            const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Your Weight in Kg",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 147),
                      child: TextField(
                        //initialValue: "0.0",
                        controller: weight,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style:
                            const TextStyle(fontSize: 45, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Your BMI',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                (result.toStringAsFixed(1)),
                style: const TextStyle(fontSize: 60, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                classification(result),
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  h = double.parse(height.text) / 100;
                  w = double.parse(weight.text);
                  setState(() {
                    result = w / (h * h);
                  });

                  //print(result);
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                minWidth: 300,
                height: 50,
                color: Colors.deepPurpleAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

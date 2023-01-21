// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/new_home/src/theme/extention.dart';
import 'package:telehealthcare/new_home/src/theme/light_color.dart';
import 'package:telehealthcare/new_home/src/theme/text_styles.dart';
import 'package:telehealthcare/new_home/src/theme/theme.dart';
import 'package:telehealthcare/user_data.dart';

// make a pop up meassage
class PredictPage extends StatefulWidget {
  const PredictPage({super.key});

  @override
  _PredictPageState createState() => _PredictPageState();
}
//await api.predict([40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]);

class _PredictPageState extends State<PredictPage> {
  final Api api = Api();

  String _result = "";
  int Age = 0;
  int Sex = 0;
  int ChestpainType = 0;
  int RestingBP = 0;
  int Cholesterol = 0;
  int FastingBS = 0;
  int RestingECG = 0;
  int MaxHR = 0;
  int ExerciseAngina = 0;
  int Oldpeak = 0;
  int ST_Slope = 1;
  void _getPrediction() async {
    try {
      var response = await api.predict([
        Age,
        Sex,
        ChestpainType,
        RestingBP,
        Cholesterol,
        FastingBS,
        RestingECG,
        MaxHR,
        ExerciseAngina,
        Oldpeak,
        ST_Slope
      ]);
      Age = 0;
      Sex = 0;
      ChestpainType = 0;
      RestingBP = 0;
      Cholesterol = 0;
      FastingBS = 0;
      RestingECG = 0;
      MaxHR = 0;
      ExerciseAngina = 0;
      Oldpeak = 0;
      ST_Slope = 1;
      setState(() {
        _result = response.toString();
      });
    } on Exception catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
    if (_result == 'false') {
      _result = 'Your herat is great';
      {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Prediction Result"),
              content: Text(_result),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    if (_result == 'true') {
      _result = 'Call 911 but not for me ';
      {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Prediction Result"),
              content: Text(_result),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text("Call 911"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    if (Age == 0) {
      if (_result == 'false') {
        _result = 'Please enter The data';
        {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Prediction Result"),
                content: Text(_result),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Predict"),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Gender";
                  }
                  try {
                    Age = int.parse(val);
                  } catch (e) {
                    return "Enter a valid number";
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    Age = int.parse(val);
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Gender";
                    }
                    try {
                      Sex = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      Sex = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'ChestpainType',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter ChestpainType";
                    }
                    try {
                      ChestpainType = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      ChestpainType = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'RestingBP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter RestingBP";
                    }
                    try {
                      RestingBP = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      RestingBP = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Cholesterol',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Cholesterol";
                    }
                    try {
                      Cholesterol = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      Cholesterol = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'FastingBS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter FastingBS";
                    }
                    try {
                      FastingBS = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      FastingBS = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'RestingECG',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter RestingECG";
                    }
                    try {
                      RestingECG = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      RestingECG = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'MaxHR',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter MaxHR";
                    }
                    try {
                      MaxHR = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      MaxHR = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'ExerciseAngina',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter ExerciseAngina";
                    }
                    try {
                      ExerciseAngina = int.parse(val);
                    } catch (e) {
                      return "Enter a valid number";
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      ExerciseAngina = int.parse(val);
                    });
                  }),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getPrediction,
                child: const Text("Get Prediction"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    fixedSize: const Size.fromWidth(200.0),
                    maximumSize: const Size.fromHeight(50.0),
                    backgroundColor: Colors.blue),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TestThisClass extends StatefulWidget {
  const TestThisClass({super.key});

  @override
  TestClass createState() => TestClass();
}

class TestClass extends State<TestThisClass> {
  final GetModelReading _getModelReading = GetModelReading();
  Map<String, dynamic> variable = <String, dynamic>{};
  String _result = "";
  final Api api = Api();

  late int age;
  late int sex;
  late int chestPainType;
  late int restingBP;
  late int cholesterol;
  late int fastingBS;
  late int restingECG;
  late int maxHR;
  late int exerciseAngina;
  late int oldPeak;
  late int stSlope;

  void _recivePreds() async {
    try {
      var response = await api.predict([
        age,
        sex,
        chestPainType,
        restingBP,
        cholesterol,
        fastingBS,
        restingECG,
        maxHR,
        exerciseAngina,
        oldPeak,
        stSlope
      ]);

      setState(() {
        _result = response.toString();
        print(_result);
      });
    } on Exception catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
    if (_result == 'false') {
      _result = 'Your herat is great';
      {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text("Prediction Result"),
        //       content: Text(_result),
        //       actions: <Widget>[
        //         ElevatedButton(
        //           child: const Text("OK"),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
      }
    }
    if (_result == 'true') {
      _result = 'Call 911 but not for me ';
      {
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text("Prediction Result"),
        //       content: Text(_result),
        //       actions: <Widget>[
        //         ElevatedButton(
        //           child: const Text("Call 911"),
        //           onPressed: () {
        //             Navigator.of(context).pop();
        //           },
        //         ),
        //       ],
        //     );
        //   },
        // );
      }
    }
    if (age == 0) {
      if (_result == 'false') {
        _result = 'Please enter The data';
        {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text("Prediction Result"),
          //       content: Text(_result),
          //       actions: <Widget>[
          //         ElevatedButton(
          //           child: const Text("OK"),
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //         ),
          //       ],
          //     );
          //   },
          // );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _getModelReading.getModelData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final modelData = snapshot.data;
          // modelData!.forEach((key, value) {
          //   variable[key] = value;
          //   print(modelData['age']);
          // });
          age = modelData!['age'];
          sex = modelData['sex'];
          chestPainType = modelData['ChestpainType'];
          restingBP = modelData['RestingBP'];
          cholesterol = modelData['Cholesterol'];
          fastingBS = modelData['FastingBS'];
          restingECG = modelData['RestingECG'];
          maxHR = modelData['MaxHR'];
          exerciseAngina = modelData['ExerciseAngina'];
          oldPeak = modelData['Oldpeak'];
          stSlope = modelData['ST_Slope'];
          return Container(
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 310,
                  width: 190,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: _categoryCard("$_result", "",
                            color: LightColor.green,
                            lightColor: LightColor.lightGreen),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _recivePreds();
                        },
                        child: Text('Press To check'),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}

Widget _categoryCard(String title, String subtitle,
    {Color? color, Color? lightColor}) {
  TextStyle titleStyle = TextStyles.title.bold.white;
  TextStyle subtitleStyle = TextStyles.body.bold.white;

  return AspectRatio(
    aspectRatio: 6 / 8,
    child: Container(
      height: 250,
      width: 250,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: const Offset(4, 4),
            blurRadius: 10,
            color: Colors.red[200]!.withOpacity(.8),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -20,
                left: -20,
                child: CircleAvatar(
                  backgroundColor: Colors.red[200],
                  radius: 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                    child: Text(title, style: titleStyle).hP8,
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: Text(
                      subtitle,
                      style: subtitleStyle,
                    ).hP8,
                  ),
                ],
              ).p16
            ],
          ),
        ),
      ).ripple(() {},
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    ),
  );
}

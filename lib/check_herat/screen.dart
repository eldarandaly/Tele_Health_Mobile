// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:telehealthcare/API/screen.dart';
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
  final GetReading getReads = GetReading(serachEmail: WhatUser.email);
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
      getReads;
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
              // const Text(
              //   "Age",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
              SizedBox(
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
              // const Text(
              //   "Gender",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "ChestpainType",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "RestingBP",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "Cholesterol",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "FastingBS",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "RestingECG",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "MaxHR",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // const Text(
              //   "ExerciseAngina",
              //   style: TextStyle(
              //       color: Colors.blueAccent,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       fontSize: 20),
              // ),
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
              // Text(
              //   _result,
              //   style: const TextStyle(fontSize: 24),
              // ),
              // const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

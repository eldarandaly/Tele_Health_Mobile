import 'package:flutter/material.dart';
import 'package:telehealthcare/API/api_calls.dart';
import 'package:telehealthcare/drawer/custom_drawer.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/extention.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/light_color.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/text_styles.dart';
import 'package:telehealthcare/bottom_bar_nav/src/theme/theme.dart';
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
  int Age = -1;
  int Sex = -1;
  int ChestpainType = -1;
  int RestingBP = -1;
  int Cholesterol = -1;
  int FastingBS = -1;
  int RestingECG = -1;
  int MaxHR = -1;
  int ExerciseAngina = -1;
  int Oldpeak = -1;
  int ST_Slope = -1;
  void _getPrediction() async {
    try {
      if (Age == -1 ||
          Sex == -1 ||
          ChestpainType == -1 ||
          RestingBP == -1 ||
          Cholesterol == -1 ||
          FastingBS == -1 ||
          RestingECG == -1 ||
          MaxHR == -1 ||
          ExerciseAngina == -1 ||
          Oldpeak == -1 ||
          ST_Slope == -1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text('Please Enter The Data'),
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
      } else {
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

        setState(() {
          _result = response.toString();
        });
      }
    } on Exception catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
    if (_result == 'false') {
      _result = 'Safe';
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
      _result = 'We will Call Your Doctor Now \n Your are near a Heart Attact ';
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
    // if (Age == 0) {
    //   if (_result == 'false') {
    //     _result = 'Please enter The data';
    //     {
    //       showDialog(
    //         context: context,
    //         builder: (BuildContext context) {
    //           return AlertDialog(
    //             title: const Text("Prediction Result"),
    //             content: Text(_result),
    //             actions: <Widget>[
    //               ElevatedButton(
    //                 child: const Text("OK"),
    //                 onPressed: () {
    //                   Navigator.of(context).pop();
    //                 },
    //               ),
    //             ],
    //           );
    //         },
    //       );
    //     }
    //   }
    // }
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
          child: SingleChildScrollView(
            child: Column(
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
                      return "Enter Age";
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
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Old Peak',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter Old Peak";
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
                        Oldpeak = int.parse(val);
                      });
                    }),
                const SizedBox(height: 20),
                TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'St slope',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter St Slope";
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
                        ST_Slope = int.parse(val);
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
  String rand_result = "";
  String arrhy_result = "";
  String ptd_result = "";

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
        // ptd_result = response['ptd_result'].toString();
        // arrhy_result = response['arrhy_result'].toString();
        // rand_result = response['rand_result'].toString();
        // print(ptd_result);
      });
    } on Exception catch (e) {
      setState(() {
        _result = e.toString();
      });
    }
    if (ptd_result == 'false') {
      ptd_result = 'Your Heart is Great';
    } else if (ptd_result == 'true') {
      _result = 'Please Call Your Doctor';
    }
    if (rand_result == 'false') {
      rand_result = 'Your Heart is Great';
    } else if (rand_result == 'true') {
      rand_result = 'Please Call Your Doctor';
    }
    if (arrhy_result != 'Normal') {
      arrhy_result = 'Call Your Doctor';
    } else {
      arrhy_result = 'Normal';
    }
    if (age == 0) {
      if (_result == 'false') {
        _result = 'Please enter The data';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_result == "") {
      CircularProgressIndicator(
        backgroundColor: Colors.black,
      );
    }
    ;
    return FutureBuilder<List<dynamic>>(
      future: _getModelReading.getThreeModelsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final modelData = snapshot.data;
          // modelData!.forEach((key, value) {
          //   variable[key] = value;
          //   print(modelData['age']);
          // });
          arrhy_result = modelData![0]['arrhy_result'].toString();
          ptd_result = modelData[0]['ptd_result'].toString();
          rand_result = modelData[0]['rand_result'].toString();
          if (ptd_result == 'false') {
            ptd_result = 'Your Heart is Great';
          } else if (ptd_result == 'true') {
            _result = 'Please Call Your Doctor';
          }
          if (rand_result == 'false') {
            rand_result = 'Your Heart is Great';
          } else if (rand_result == 'true') {
            rand_result = 'Please Call Your Doctor';
          }
          if (arrhy_result != 'Normal') {
            arrhy_result = 'Call Your Doctor';
          } else {
            arrhy_result = 'Normal';
          }
          return Container(
            // color: Color.fromRGBO(18, 18, 18, 0.95),
            child: Padding(
              padding: const EdgeInsets.all(48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    // height: 310,
                    // width: 200,
                    child: Column(
                      children: [
                        Text(
                          "What is your states of heart?                               ",
                          style: TextStyles.title,
                        ),
                        viewResult('Heart Attack Probability PTB', ptd_result),
                        viewResult('Heart Arrhythmia', arrhy_result),
                        viewResult('Heart Attack Probability', rand_result),
                        ElevatedButton(
                          onPressed: () {
                            _recivePreds();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: Text(
                            'Check',
                            style: TextStyles.titleM.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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

  Container viewResult(String title, String res) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            // icon: Icon(viewIcon),
            hintStyle: TextStyle(
              color: Colors.black,
              fontFamily: "Muli",
              fontSize: 15,
            ),

            labelStyle: TextStyle(
              color: Colors.black,
              fontFamily: "Muli",
              fontSize: 22,
            ),
            labelText: title,
            enabled: false,
            hintText: res,
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
              // borderRadius: BorderRadius.all(Radius.circular(10)),
            ),

            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
        ),
      ),
    );
  }
}

Widget _categoryCard(
  String title,
  String subtitle, {
  Color? color,
  Color? lightColor,
}) {
  TextStyle titleStyle = TextStyles.title.bold.white;
  TextStyle subtitleStyle = TextStyles.body.bold.white;
  // TestClass t = TestClass();
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
            blurRadius: 50,
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
                  child: Icon(
                    Icons.favorite,
                    size: 50,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red[200],
                  radius: 60,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(
                    height: 70,
                    width: 500,
                  ),
                  Flexible(
                    child: Text(title, style: titleStyle).hP8,
                  ),
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

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:telehealthcare/regestier/seach_in_forget_pass.dart';
import 'package:telehealthcare/user_data.dart';

class FirebaseAPI {
  String serachEmail;
  FirebaseAPI({Key? key, required this.serachEmail});
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Map<String, dynamic>?> getData() async {
    final docRef = _db.collection("users data").doc(serachEmail.toString());
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        // MyAPI.postData();
        // WhatUser.gender = data['gender'];
        // WhatUser.email = data['email'];
        // WhatUser.username = data['username'];
        // WhatUser.confirmpassword = data['confirmpassword'];
        // WhatUser.dateofbirth = data['dateofbirth'];
        // WhatUser.phonenumber = data['phonenumber'];
        // WhatUser.cholestrollevel = data['cholestrollevel'];
        // WhatUser.bloodsugar = data['bloodsugar'];
        // WhatUser.bloodpressaure = data['bloodpressaure'];
        // print(WhatUser.gender);
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return null;
  }
}

class Api {
  Dio dio = Dio();
  List<List<List<double>>> EcgReadings4 = [
    [
      [1.0496570329905088],
      [1.205661793877987],
      [1.3284155400250253],
      [1.51992138431959],
      [1.6990518509475998],
      [1.7686789757988222],
      [1.8529315469832455],
      [1.992560808130131],
      [2.404323374126408],
      [2.218942716757714],
      [2.342571489608448],
      [2.470325388348033],
      [2.5869539475692007],
      [2.6967072969756156],
      [2.7874600665303504],
      [2.8288363292336802],
      [2.869712576677755],
      [2.881587939085055],
      [2.944714865565966],
      [2.972965727713859],
      [2.9697156285287027],
      [2.9599653309732354],
      [2.986966154972991],
      [2.9655905026398512],
      [2.9904662617877746],
      [3.018717123935667],
      [2.930214423047578],
      [2.860212286751915],
      [2.799335428937651],
      [3.1953475142674033],
      [2.508451551866207],
      [2.649330851161229],
      [2.6513309121982482],
      [2.6080795922727136],
      [2.573953550828578],
      [2.5199519028290656],
      [2.515076754051332],
      [2.464825220496231],
      [2.371322367015595],
      [2.3215708487197486],
      [2.298820154423658],
      [2.249818659016694],
      [2.2401933652760397],
      [2.1901918393505664],
      [2.1686911832026126],
      [2.1246898403881955],
      [2.111314432203131],
      [2.1373152256843775],
      [2.0345620899075287],
      [1.9559346903897215],
      [1.8748072145756403],
      [2.5693284096804714],
      [1.7213025299844356],
      [1.7634288155766473],
      [1.7780542619098483],
      [1.733052888576922],
      [1.7119272438734092],
      [1.6809262977996156],
      [1.6451752067629017],
      [1.58879848628193],
      [1.5101710867641225],
      [1.4775450910977508],
      [1.4595445417645803],
      [1.4404189580980864],
      [1.4100430310983612],
      [1.4162932218390454],
      [1.3916674703207497],
      [1.3799171117282631],
      [1.3996677144688254],
      [1.416043214209418],
      [1.3180402233954893],
      [1.3280405285805843],
      [1.4602945646534624],
      [1.3390408642841882],
      [1.2566633503219704],
      [1.306664876247444],
      [1.3030397656178472],
      [1.3417909482100894],
      [1.3164151738029115],
      [1.3690417798394727],
      [1.3575414288766137],
      [1.3465410931730095],
      [1.3120400402844326],
      [1.3207903073213905],
      [1.33841584521012],
      [1.356166386913663],
      [1.368541764580218],
      [1.3739169286172064],
      [1.403792840357677],
      [1.4289186071352276],
      [1.494545609912412],
      [1.3979176610614337],
      [1.4356688131351665],
      [1.5979237647633289],
      [1.4179182714316232],
      [1.4327937253944516],
      [1.4446690878017519],
      [1.4785451216162602],
      [1.4844203009125034],
      [1.5331717886898404],
      [1.5170462965788751],
      [1.583298318430128],
      [1.4847953123569444],
      [1.5047959227271341],
      [1.4922955412457657],
      [1.5366718955046237],
      [1.5342968230231637],
      [1.5506723227637564],
      [1.5645477462080752],
      [1.5656727805413984],
      [1.588048463393048],
      [1.651050386059145],
      [1.609424115726188],
      [1.5724229865413375],
      [1.5211714224677266],
      [2.298070131534776],
      [1.4792951445051423],
      [1.5695478988006226],
      [1.5834233222449416],
      [1.6096741233558154],
      [1.5975487533188881],
      [1.627299661244545],
      [1.6287997070223093],
      [1.6131742301705987],
      [1.5480472426526688],
      [1.5746730552079835],
      [1.57454805139317],
      [1.570172917874691],
      [1.5895485091708121],
      [1.5831733146153144],
      [1.6085490890224923],
      [1.5734230170598467],
      [1.6187994018372145],
      [1.6640507827997681],
      [1.6152992950224312],
      [1.5720479750968963],
      [1.5292966704306161],
      [2.298820154423658],
      [1.460419568468276],
      [1.5744230475783563],
      [1.5824232917264323],
      [1.6224245124668113],
      [1.6086740928373058],
      [1.6543004852443006],
      [1.62917471846675],
      [1.6485503097628713],
      [1.5744230475783563],
      [1.6110491653187657],
      [1.6035489364299447],
      [1.6352999053926207],
      [1.636674947355571],
      [1.6380499893185219],
      [1.655800531022065],
      [1.6370499588000123],
      [1.6611756950590533],
      [1.7229275795770134],
      [1.6599256569109164],
      [1.6259246192815942],
      [1.5605476241340372],
      [1.5049209265419476],
      [1.609049104281747],
      [1.645050202948088],
      [1.6267996459852903],
      [1.6670508743552965],
      [1.6415500961333047],
      [1.6896765648365732],
      [1.662925748466445],
      [1.618924405652028],
      [1.5975487533188881],
      [1.6064240241706595],
      [1.6192994170964692],
      [1.6246745811334575],
      [1.6269246498001038],
      [1.6332998443556017],
      [1.6372999664296397],
      [1.6281746879482406],
      [1.6829263588366346],
      [1.7364279915768914],
      [1.6698009582811977],
      [1.6424251228370008],
      [1.5911735587633902],
      [2.290194891201514],
      [1.584423352763451],
      [1.6540504776146734],
      [1.6636757713553272],
      [1.691426618243965],
      [1.6600506607257304]
    ]
  ];
  Future<dynamic> predict(List data) async {
    final response = await dio.post(
        // 'https://senior-api-73pplnaibq-uc.a.run.app/predict/',
        'https://new-3-models-73pplnaibq-uc.a.run.app/predict/',
        data: {"data_ptb_arrhy": EcgReadings4, "data_attack": data});

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      print(response.data);
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
  }
}

class GetReading {
  // String serachEmail;
  // GetReading({Key? key, required this.serachEmail});
  // final CollectionReference collectionReference = Firestore.instance.collection('your_collection_name');
  List<Map<String, dynamic>> h_R = [
    {'time': 0, 'rate': 70},
    {'time': 1, 'rate': 80},
    {'rate': 85, 'time': 2},
    {'time': 3, 'rate': 95},
    {'rate': 94, 'time': 4},
  ];
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getData() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();
    WhatUser.username = snapshot['username'];
    WhatUser.isAdoctor = snapshot['isADoctor'];
    WhatUser.gradine_name = snapshot['gradine_Name'];
    WhatUser.gradine_num = snapshot['gradine_Number'];
    if (snapshot.exists == false) {
      return h_R.cast<Map<String, dynamic>>();
    }
    List<dynamic> data = snapshot['Heart_Rate_Readings'];

    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data.cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> getAllCharts(String personEmail) async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(personEmail).get();
    // WhatUser.username = snapshot['username'];
    // WhatUser.isAdoctor = snapshot['isADoctor'];
    // WhatUser.gradine_name = snapshot['gradine_Name'];
    // WhatUser.gradine_num = snapshot['gradine_Number'];
    if (snapshot.exists == false) {
      return h_R.cast<Map<String, dynamic>>();
    }
    final List<dynamic> data = snapshot['Heart_Rate_Readings'];

    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data.cast<Map<String, dynamic>>();
  }

  Future<List<Map<String, dynamic>>> getEcgReading() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();
    if (snapshot.exists == false) {
      return h_R.cast<Map<String, dynamic>>();
    }
    List<dynamic> data = snapshot['Ecg_Readings'];

    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data.cast<Map<String, dynamic>>();
  }
}

class GetModelReading {
  Map<String, dynamic> modelData = {
    'chestpainType': 0,
    'cholesterol': 0,
    'exerciseAngina': 0,
    'fastingBS': 0,
    'maxHR': 0,
    'oldpeak': 0,
    'restingBP': 0,
    'restingECG': 0,
    'stSlope': 0,
    'age': 0,
    'sex': 0
  };

  // String serachEmail;
  // GetReading({Key? key, required this.serachEmail});
  // final CollectionReference collectionReference = Firestore.instance.collection('your_collection_name');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<Map<String, dynamic>> getModelData() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();
    Map<String, dynamic> dummyData = <String, dynamic>{'model_data': modelData};
    final data = snapshot['model_data'];
    if (data == null) {
      return dummyData;
    }
    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data;
  }

  Future<List> getThreeModelsData() async {
    final DocumentSnapshot snapshot =
        await _db.collection("users data").doc(WhatUser.email).get();
    // Map<String, dynamic> dummyData = <String, dynamic>{'model_data': modelData};
    List<dynamic> data = snapshot['Models_Predict'];
    // if (data == null) {
    //   return dummyData;
    // }
    // final x = data as List<Map<String, dynamic>>;
    // print(x);
    return data;
  }
}
// class MyAPI {
//   final dio = Dio();

//   static const baseUrl = "https://senior-api-73pplnaibq-uc.a.run.app/predict/";
//   final body = {
//     "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]
//   };

//   Future<http.Response> postData(body) async {
//     final response = await http.post(
//       Uri.parse(baseUrl),
//       body: body,
//     );
//     print(response.body);
//     return response;
//   }
// }

// class dioApi {
//   final dio = Dio();
//   final body = { "data": [40, 0, 1, 140, 289, 0, 0, 172, 1, 0, 1]};
//   static const baseUrl = "https://senior-api-73pplnaibq-uc.a.run.app/predict/";

//   final responsew = await dio.post(baseUrl,data: body);

// }


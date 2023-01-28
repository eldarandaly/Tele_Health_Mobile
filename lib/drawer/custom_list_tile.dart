import 'package:flutter/material.dart';
import 'package:telehealthcare/drawer_screens/make_appoiment.dart';
import 'package:telehealthcare/signin.dart';
import 'package:telehealthcare/user_data.dart';

class CustomListTile extends StatelessWidget {
  final bool isCollapsed;
  final Icon icon;
  final String title;
  final IconData? doHaveMoreOptions;
  final int infoCount;
  final dynamic x;

  const CustomListTile({
    Key? key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.doHaveMoreOptions,
    required this.infoCount,
    this.x,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (WhatUser.isAdoctor == true) {
      return InkWell(
        onTap: () {
          x;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isCollapsed ? 300 : 80,
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        icon: icon,
                        color: Colors.white,
                        onPressed: () {
                          print('pressed');
                          print(x);
                          if (x == null) {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: const Text("Coming soon"),
                            //       content: Text(''),
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
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => x),
                            );
                          }
                        },
                      ),
                      if (infoCount > 0)
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (isCollapsed) const SizedBox(width: 10),
              if (isCollapsed)
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      if (infoCount > 0)
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple[200],
                            ),
                            child: Center(
                              child: Text(
                                infoCount.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (isCollapsed) const Spacer(),
              if (isCollapsed)
                Expanded(
                  flex: 1,
                  child: doHaveMoreOptions != null
                      ? IconButton(
                          icon: Icon(
                            doHaveMoreOptions,
                            color: Colors.white,
                            size: 12,
                          ),
                          onPressed: () {},
                        )
                      : const Center(),
                ),
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          x;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: isCollapsed ? 300 : 80,
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        icon: icon,
                        color: Colors.white,
                        onPressed: () {
                          print('pressed');
                          print(x);
                          if (x == null) {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: const Text("Coming soon"),
                            //       content: Text(''),
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
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => x),
                            );
                          }
                        },
                      ),
                      if (infoCount > 0)
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (isCollapsed) const SizedBox(width: 10),
              if (isCollapsed)
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      if (infoCount > 0)
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.purple[200],
                            ),
                            child: Center(
                              child: Text(
                                infoCount.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (isCollapsed) const Spacer(),
              if (isCollapsed)
                Expanded(
                  flex: 1,
                  child: doHaveMoreOptions != null
                      ? IconButton(
                          icon: Icon(
                            doHaveMoreOptions,
                            color: Colors.white,
                            size: 12,
                          ),
                          onPressed: () {},
                        )
                      : const Center(),
                ),
            ],
          ),
        ),
      );
    }
  }
}

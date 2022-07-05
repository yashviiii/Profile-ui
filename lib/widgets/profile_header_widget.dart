import 'package:flutter/material.dart';


import '../data/data.dart';

Widget profileHeaderWidget(BuildContext context) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      boxShadow:[
        BoxShadow(
          color: Colors.blueGrey,
          offset: const Offset(
            5.0,
            5.0,
          ),
          blurRadius: 10.0,
          spreadRadius: 2.0,
        ), //BoxShadow
        BoxShadow(
          color: Colors.white,
          offset: const Offset(0.0, 0.0),
          blurRadius: 0.0,
          spreadRadius: 0.0,
        ), //BoxShadow
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(53),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-5, -5),
                      color: Colors.white
                  ),
                  BoxShadow(
                      blurRadius:5.0,
                      offset: Offset(5, 5),
                      color: Colors.grey
                  )
                ]
            ),
            child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Color(0xff74EDED),
                  backgroundImage:
                  NetworkImage("https://placeimg.com/640/480/people"),
                ),
          ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(-5, -5),
                            color: Colors.white
                        ),
                        BoxShadow(
                          blurRadius:5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey
                        )
                      ]
                    ),
                    child:
                  Center(
                    child: Text(
                    "John Doe",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      letterSpacing: 0.4,
                    ),
                  ),
                  ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 35,
                      width: 215,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10.0,
                                offset: Offset(-5, -5),
                                color: Colors.white
                            ),
                            BoxShadow(
                                blurRadius:5.0,
                                offset: Offset(5, 5),
                                color: Colors.grey
                            )
                          ]
                      ),
                      child:
                      Center(
                          child: Text(
                            "john.doe@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              letterSpacing: 0.4,
                           ),
                        ),
                      ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       height: 35.0,
                  //       child: RaisedButton(
                  //         onPressed: () {},
                  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  //         padding: EdgeInsets.all(0.0),
                  //         child: Ink(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(colors:  [Colors.indigo, Colors.blueAccent],
                  //                 begin: Alignment.centerLeft,
                  //                 end: Alignment.centerRight,
                  //               ),
                  //             borderRadius: BorderRadius.circular(5)
                  //           ),
                  //           child: Container(
                  //             constraints: BoxConstraints(maxWidth: 90.0, minHeight: 50.0),
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               "Connect",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   color: Colors.white
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),

                      // ElevatedButton(onPressed: (){},
                      //     style: ElevatedButton.styleFrom(
                      //
                      //     ),
                      //     child:Ink(
                      //       decoration: BoxDecoration(
                      //         gradient: LinearGradient(colors: [Colors.indigo,Colors.blueAccent],
                      //           begin: Alignment.topLeft,
                      //         ),
                      //         borderRadius: BorderRadius.circular(2)
                      //       ),
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Text("Connect"),
                      //       ),
                      //     ),
                      //
                      // ),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     Container(
                  //       height: 35.0,
                  //       child: RaisedButton(
                  //         onPressed: () {},
                  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  //         padding: EdgeInsets.all(0.0),
                  //         child: Ink(
                  //           decoration: BoxDecoration(
                  //               gradient: LinearGradient(colors: [Colors.indigo, Colors.blueAccent],
                  //                 begin: Alignment.centerLeft,
                  //                 end: Alignment.centerRight,
                  //               ),
                  //               borderRadius: BorderRadius.circular(5)
                  //           ),
                  //           child: Container(
                  //             constraints: BoxConstraints(maxWidth: 90.0, minHeight: 50.0),
                  //             alignment: Alignment.center,
                  //             child: Text(
                  //               "Message",
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                   color: Colors.white
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              )
              // Row(
              //   children: [
              //     Column(
              //       children: [
              //         Text(
              //           "23",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Posts",
              //           style: TextStyle(
              //             fontSize: 15,
              //             letterSpacing: 0.4,
              //           ),
              //         )
              //       ],
              //     ),
              //     SizedBox(
              //       width: 60,
              //     ),
              //     Column(
              //       children: [
              //         Text(
              //           "15M",
              //           style: TextStyle(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w700,
              //           ),
              //         ),
              //         Text(
              //           "Contests",
              //           style: TextStyle(
              //             letterSpacing: 0.4,
              //             fontSize: 15,
              //           ),
              //         )
              //       ],
              //     ),
              //     SizedBox(
              //       width: 30,
              //     ),
              //   ],
              // ),
          ]),
          // SizedBox(
          //   height: 8,
          // ),
          // Text(
          //     "John Doe",
          //     style: TextStyle(
          //       fontWeight: FontWeight.w600,
          //       fontSize: 16,
          //       letterSpacing: 0.4,
          //     ),
          //   ),
          // SizedBox(
          //   height: 4,
          // ),
          //  Text(
          //     "email",
          //     style: TextStyle(
          //       letterSpacing: 0.4,
          //     ),
          //   ),

          SizedBox(
            height: 17,
          ),
          actions(context),
          // Container(
          //   height: 85,
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     scrollDirection: Axis.horizontal,
          //     itemCount: highlightItems.length,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           Column(
          //             children: [
          //               CircleAvatar(
          //                 radius: 30,
          //                 backgroundColor: Colors.grey,
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(2.0),
          //                   child: CircleAvatar(
          //                     backgroundImage:
          //                         AssetImage(highlightItems[index].thumbnail),
          //                     radius: 28,
          //                   ),
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 4),
          //                 child: Text(
          //                   highlightItems[index].title,
          //                   style: TextStyle(fontSize: 13),
          //                 ),
          //               )
          //             ],
          //           ),
          //           SizedBox(
          //             width: 10,
          //           )
          //         ],
          //       );
          //     },
          //   ),
          // )
        ]),
    )
  );
}

Widget actions(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Expanded(
      //   child: OutlinedButton(
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 50),
      //       child: Text("Edit Profile", style: TextStyle(color: Colors.white)),
      //     ),
      //     style: OutlinedButton.styleFrom(
      //         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //         minimumSize: Size(0, 30),
      //         side: BorderSide(
      //           color: Colors.grey,
      //         )),
      //     onPressed: () {},
      //   ),
      // ),
    Container(
    height: 37.0,
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
            blurRadius: 10.0,
            offset: Offset(-3, -2),
            color: Colors.grey
        ),
        BoxShadow(
            blurRadius:8.0,
            offset: Offset(2, 5),
            color: Colors.grey
        )
      ],
    ),
    child: RaisedButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.lightBlue, Colors.white],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),

            borderRadius: BorderRadius.circular(5)
        ),
        child: Container(
          constraints: BoxConstraints(maxWidth: 350.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "Edit Profile",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black54
            ),
          ),
        ),
      ),
    ),
  ),
  ],
  );
}

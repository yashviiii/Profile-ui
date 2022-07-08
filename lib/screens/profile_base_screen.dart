import 'package:flutter/material.dart';
import 'package:profile_ui/screens/reels_screen.dart';
import 'package:profile_ui/widgets/appbar.dart';
import '../widgets/profile_header_widget.dart';
import 'gallery_screen.dart';
import 'igtv_screen.dart';

class ProfileBaseScreen extends StatefulWidget {
  @override
  _ProfileBaseScreenState createState() => _ProfileBaseScreenState();
}

class _ProfileBaseScreenState extends State<ProfileBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
              ),
            ),
          ),
          child: appbar(context)
          // AppBar(
          //    leading:
          //    Builder(builder: (BuildContext context) {
          //     return IconButton(
          //         onPressed: (){},
          //         icon:
          //     Image.asset(
          //       'assets/images/logo.png',
          //       height: 40,
          //       width: 50,
          //     ),
          //     );
          //   }
          //   ),
          //   backgroundColor: Colors.white,
          //   title: Center(
          //     child: Text(
          //       "Socio-Club",
          //       style:
          //           TextStyle(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w900,
          //               fontStyle: FontStyle.italic,
          //           ),
          //     ),
          //   ),
          //   actions: [
          //     // IconButton(
          //     //   icon: Icon(
          //     //     Icons.add_box_outlined,
          //     //     color: Colors.black,
          //     //   ),
          //     //   onPressed: () => print("Add"),
          //     // ),
          //     IconButton(
          //       icon: Icon(
          //         Icons.settings,
          //         color: Colors.black,
          //       ),
          //       onPressed: () => print("Add"),
          //     )
          //   ],
          // ),
        ),
      ),
      body:
      DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Material(
                color: Colors.white,
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  splashBorderRadius: BorderRadius.circular(20),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Image.asset(
                        "assets/images/mask.png",
                        height: 50,
                        width: 30,
                      )
                    ),
                    Tab(
                      icon: Image.asset(
                        "assets/images/trophy.png",
                        height: 50,
                        width: 30,
                      )
                      ),
                    // Tab(
                    //   icon: Image.asset(
                    //     'assets/icons/reels.png',
                    //     height: 25,
                    //     width: 25,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Gallery(),
                    Igtv(key: ValueKey(1),),
                    // Reels(key: ValueKey(2),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

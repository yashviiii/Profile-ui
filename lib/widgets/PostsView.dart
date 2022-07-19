import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fly_animation/fly_animation.dart';
import 'package:like_button/like_button.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

final _animationEndWidgetKey = GlobalKey();

class PostsView extends StatefulWidget {
  final String url;
  final int likes;
  final int shares;
  const PostsView({Key? key, required this.url, required this.likes, required this.shares}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool istapped = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this);
    _controller.addStatusListener((status) async{
      if(status==AnimationStatus.completed){
        Share.share(widget.url);
        istapped=false;
        _controller.reset();
        setState(() {

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    // BoxShadow(
                    //     blurRadius: 10.0,
                    //     offset: Offset(-2,-2),
                    //     color: Colors.white
                    // ),
                    BoxShadow(
                        blurRadius: 10.0,
                        offset: Offset(3,3),
                        color: Colors.grey
                    ),
                  ]
              ),
              child: ClipRRect(
                child: Image.network(widget.url,),
                borderRadius: BorderRadius.circular(20),
              )
          ),
          Positioned(
            bottom: 0,
            right: 10,
            child: Container(
            height: 350,
            child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_ixwftprr.json',controller: _controller,onLoaded: (composition) {
            _controller
            ..duration = composition.duration;
            },)),
          ),
          Positioned(
              bottom: 70,
              right: 10,
              child: Column(
                  children: [
                    LikeButton(
                      size: 40,
                    ),
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     highlightColor: Colors.black38,
                    //       child: istapped ? Icon(Icons.favorite_border_rounded, size: 30,) :  Icon(Icons.favorite, size: 30,color: Colors.red,),
                    //     onTap: (){
                    //         if(istapped)
                    //           istapped=false;
                    //         else
                    //           istapped=true;
                    //         setState((){
                    //         });
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 5,),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        widget.likes.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        hoverColor: Colors.black45,
                        highlightColor: Colors.black45,
                        child:
                        istapped? Container(height: 35,):
                        Container(height: 35,child:Image.asset('assets/images/send1.png',))  ,// FlyAnimationWidget(
                        //   animationEndKey: _animationEndWidgetKey,
                        //   topPosition: 3.0,
                        //   countOfAnimationWidgets: 1,
                        //   childWidget: ChildWidget(),
                        //   animationWidget: Icon(
                        //     Icons.star,
                        //     size: 40,
                        //   ),
                        //   animationWidgetWidth: 30,
                        //   animationWidgetHeight: 30,
                        //   animationDurationInMillis: 700,
                        //   hideAnimationWidgetOnComplete: true,
                        // ),
                        onTap: () => _onShare()
                          //   final box = context.findRenderObject() as RenderBox?;
                          //
                      ),
                    ),
                    SizedBox(height: 5,),
                    Material(
                      color: Colors.transparent,
                      child: Text(
                        widget.shares.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ])
          ),
        ],
      ),
    );
  }
  void _onShare(){
    setState(() {
      istapped=true;
    });
    _controller.forward();
  // A builder is used to retrieve the context immediately
  // surrounding the ElevatedButton.
  //
  // The context's `findRenderObject` returns the first
  // RenderObject in its descendent tree when it's not
  // a RenderObjectWidget. The ElevatedButton's RenderObject
  // has its position and size after it's built.
  }
}
// class ChildWidget extends StatefulWidget {
//   @override
//   _ChildWidgetState createState() => _ChildWidgetState();
// }
//
// class _ChildWidgetState extends State<ChildWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(16),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Container(
//                 key: _animationEndWidgetKey,
//                 child: Icon(
//                   Icons.star,
//                   size: 40,
//                 ),
//               ),
//               SizedBox(
//                 width: 8,
//               ),
//               Text(
//                 'Total stars:',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 200),
//           Visibility(
//             visible: 1 == 0 ? false : true,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 'You won stars',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
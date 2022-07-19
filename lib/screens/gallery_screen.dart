import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:profile_ui/widgets/appbar.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets/PostsView.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  late OverlayEntry _popupDialog;
  List<String> imageUrls = [
    'https://placeimg.com/640/680/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/680/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/680/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/680/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/680/people',
    'https://placeimg.com/640/480/tech',
    'https://placeimg.com/640/680/nature',
    'https://placeimg.com/640/480/people',
    'https://placeimg.com/640/680/tech',
    'https://placeimg.com/640/480/animals',
    'https://placeimg.com/640/480/arch',
    'https://placeimg.com/640/480/nature',
    'https://placeimg.com/640/480/people',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PostsView(url: imageUrls[index],likes: 23,shares: 23,)));
                  },
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _createGridTileWidget(String url) => Builder(
        builder: (context) => GestureDetector(
          onLongPress: () {
            _popupDialog = _createPopupDialog(url);
            Overlay.of(context)?.insert(_popupDialog);
          },
          onLongPressEnd: (details) => _popupDialog?.remove(),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Image.network(url, fit: BoxFit.cover),
          ),
        ),
      );

  OverlayEntry _createPopupDialog(String url) {
    return OverlayEntry(
      builder: (context) => AnimatedDialog(
        key: ValueKey(1),
        child: _createPopupContent(url),
      ),
    );
  }

  Widget _createPhotoTitle() => Container(
      width: double.infinity,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://placeimg.com/640/480/people'),
        ),
        title: Text(
          'john.doe',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ));

  Widget _createActionBar() => Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.black,
            ),
            Icon(
              Icons.send,
              color: Colors.black,
            ),
          ],
        ),
      );

  Widget _createPopupContent(String url) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _createPhotoTitle(),
              Image.network(url, fit: BoxFit.fitWidth),
              _createActionBar(),
            ],
          ),
        ),
      );
}

Widget _postsView(String url) {
  return FadeInImage.memoryNetwork(
    placeholder: kTransparentImage,
    image: url,
    fit: BoxFit.cover,
  );
}

class AnimatedDialog extends StatefulWidget {
  const AnimatedDialog({required Key key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => AnimatedDialogState();
}

class AnimatedDialogState extends State<AnimatedDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo);
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.6).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withOpacity(opacityAnimation.value),
      child: Center(
        child: FadeTransition(
          opacity: scaleAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

// class PostsView extends StatelessWidget {
//   final String url;
//
//   const PostsView({Key? key, required this.url}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: Stack(
//               children: [
//                 Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: 10.0,
//                             offset: Offset(3, 3),
//                             color: Colors.blueGrey
//                         ),
//                       ]
//                     ),
//                     child: ClipRRect(
//                         child: Image.network(url,),
//                       borderRadius: BorderRadius.circular(20),
//                     )
//                 ),
//           Positioned(
//             bottom: 40,
//             right: 10,
//             child: Column(
//             children: const [
//                Icon(Icons.thumb_up_alt_outlined),
//               SizedBox(height: 5,),
//               Material(
//                 color: Colors.transparent,
//                 child: Text(
//                     '23',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Icon(Icons.ios_share_rounded),
//               SizedBox(height: 5,),
//               Material(
//                 color: Colors.transparent,
//                 child: Text(
//                   '23',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//           ])
//           ),
//               ],
//             ),
//           ),
//           SizedBox(height: 100,),
//           Container(
//             child: Center(
//               child: Material(
//                 color: Colors.transparent,
//                 child: Text(
//                   'I’ll take my next treat right meow',
//                   style: TextStyle(
//                       color: Colors.white
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
      // child: Container(
      //         height: 500,
      //         width: 393,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(20)
      //         ),
      //         child: Column(
      //           children: [
      //             SizedBox(height: 20,),
      //             Container(
      //               width: 350,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         blurRadius: 10.0,
      //                         offset: Offset(8, 8),
      //                         color: Colors.grey
      //                     ),
      //                   ]
      //                 ),
      //                 child: ClipRRect(
      //                     child: Image.network(url,width: 350,),
      //                   borderRadius: BorderRadius.circular(20),
      //                 )
      //             ),
      //             SizedBox(height: 10,),
      //             Row(
      //               children: [
      //                 SizedBox(width: 35,),
      //                 Icon(Icons.thumb_up_alt_outlined),
      //                 SizedBox(width: 10,),
      //                 Material(
      //                   color: Colors.transparent,
      //                   child: Text(
      //                     '23',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 12,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(width: 30,),
      //                 Icon(Icons.share),
      //                 SizedBox(width: 10,),
      //                 Material(
      //                   color: Colors.transparent,
      //                   child: Text(
      //                     '23',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 12,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height: 15,),
      //             Material(
      //               color: Colors.transparent,
      //               child: Container(
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(10),
      //                   boxShadow: [
      //                     BoxShadow(
      //                         blurRadius: 10.0,
      //                         offset: Offset(1, 1),
      //                         color: Colors.grey
      //                     ),
      //                   ]
      //                 ),
      //                 width: 330,
      //                 height: 40,
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(8.0),
      //                   child: Text(
      //                     'I’ll take my next treat right meow',
      //                     style: TextStyle(
      //                       color: Colors.black,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     height: 60,
            //     width: 393,
            //     decoration: BoxDecoration(
            //         color: Colors.white24,
            //       borderRadius: BorderRadius.vertical(top: Radius.circular(10))
            //     ),
            //     child: Center(
            //       child: Material(
            //         color: Colors.transparent,
            //         child: Text(
            //           'I’ll take my next treat right meow',
            //           style: TextStyle(
            //             color: Colors.black
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   bottom: 80,
            //   right: 10,
            //   child: Column(
            //   children: const [
            //      Icon(Icons.thumb_up_alt_outlined),
            //     SizedBox(height: 5,),
            //     Material(
            //       color: Colors.transparent,
            //       child: Text(
            //           '23',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ),
            //     SizedBox(height: 10,),
            //     Icon(Icons.share),
            //     SizedBox(height: 5,),
            //     Material(
            //       color: Colors.transparent,
            //       child: Text(
            //         '23',
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 12,
            //         ),
            //       ),
            //     ),
            // ])
            // ),
    //);
      // Scaffold(
      //   appBar: PreferredSize(
      //       preferredSize: Size.fromHeight(40),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           border: Border(
      //             bottom: BorderSide(),
      //           ),
      //         ),
      //         child: appbar(context),
      //       )),
      //   body: Container(
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(25),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.blueGrey,
      //             offset: const Offset(
      //               5.0,
      //               5.0,
      //             ),
      //             blurRadius: 10.0,
      //             spreadRadius: 2.0,
      //           ), //BoxShadow
      //           // BoxShadow(
      //           //   color: Colors.white,
      //           //   offset: const Offset(0.0, 0.0),
      //           //   blurRadius: 0.0,
      //           //   spreadRadius: 0.0,
      //           // ), //BoxShadow
      //         ],
      //       ),
      //       child: Padding(
      //         padding:
      //             const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 10),
      //         child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   children: [
      //                     Container(
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(53),
      //                           color: Colors.white,
      //                           boxShadow: const [
      //                             BoxShadow(
      //                                 blurRadius: 5.0,
      //                                 offset: Offset(-5, -5),
      //                                 color: Colors.white),
      //                             BoxShadow(
      //                                 blurRadius: 5.0,
      //                                 offset: Offset(2, 2),
      //                                 color: Colors.black45)
      //                           ]),
      //                       child: CircleAvatar(
      //                         radius: 22,
      //                         backgroundColor: Color(0xff74EDED),
      //                         backgroundImage: NetworkImage(
      //                             "https://placeimg.com/640/480/people"),
      //                       ),
      //                     ),
      //                     Container(
      //                       height: 30,
      //                       width: 100,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.circular(8),
      //                           color: Colors.white,
      //                           boxShadow: const [
      //                             BoxShadow(
      //                                 blurRadius: 5.0,
      //                                 offset: Offset(-5, -5),
      //                                 color: Colors.white),
      //                             BoxShadow(
      //                                 blurRadius: 5.0,
      //                                 offset: Offset(0, 3),
      //                                 color: Colors.grey)
      //                           ]),
      //                       child: Center(
      //                         child: Text(
      //                           "John.Doe",
      //                           style: TextStyle(
      //                             color: Colors.black,
      //                             fontWeight: FontWeight.bold,
      //                             fontSize: 16,
      //                             letterSpacing: 0.4,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Icon(Icons.more_horiz)
      //                   ]),
      //               SizedBox(
      //                 height: 20,
      //               ),
      //               Container(
      //                 decoration: BoxDecoration(
      //                     color: Colors.transparent,
      //                     borderRadius: BorderRadius.all(Radius.circular(15))),
      //                   child: ClipRRect(
      //                       borderRadius: BorderRadius.all(Radius.circular(15)),
      //                     child: Image.network(url,
      //                       fit: BoxFit.fitHeight,
      //                     ),
      //               )
      //               )
      //             ]),
      //       )));
  // }
// }

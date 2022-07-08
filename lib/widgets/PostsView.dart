import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PostsView extends StatefulWidget {
  final String url;
  final String caption;
  final int likes;
  final int shares;
  const PostsView({Key? key, required this.url, required this.caption, required this.likes, required this.shares}) : super(key: key);

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  bool istapped = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
                    bottom: 40,
                    right: 10,
                    child: Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              highlightColor: Colors.black38,
                                child: istapped ? Icon(Icons.favorite_border_rounded, size: 30,) :  Icon(Icons.favorite, size: 30,color: Colors.red,),
                              onTap: (){
                                  if(istapped)
                                    istapped=false;
                                  else
                                    istapped=true;
                                  setState((){
                                  });
                              },
                            ),
                          ),
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
                              child: Image.asset('assets/images/send.png',height: 25,),
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
          ),
          SizedBox(height: 100,),
          Container(
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Text(
                  widget.caption,
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  void _onShare(){
  // A builder is used to retrieve the context immediately
  // surrounding the ElevatedButton.
  //
  // The context's `findRenderObject` returns the first
  // RenderObject in its descendent tree when it's not
  // a RenderObjectWidget. The ElevatedButton's RenderObject
  // has its position and size after it's built.
    Share.share(widget.url);
  }
}
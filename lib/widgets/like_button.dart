import 'package:FlutterGalleryApp/res/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;

  LikeButton({this.likeCount, this.isLiked});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked;
  int likeCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          isLiked = !isLiked;
          isLiked ? likeCount++ : likeCount--;
        });
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              SizedBox(width: 5.0),
              Text(
                likeCount.toString(),
                textAlign: TextAlign.center,
                style: AppStyles.h4.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked ?? false;
    likeCount = widget.likeCount ?? 3;
  }
}

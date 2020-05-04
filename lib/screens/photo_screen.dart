import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/widgets.dart';
import '../res/res.dart';

class FullScreenImage extends StatelessWidget {
  String altDescription;
  String userName;
  String name;
  String photo;

  FullScreenImage({photo, Key key, userName, name, altDescription}) : super(key: key) {
    this.userName = userName ?? 'guest';
    this.name = name ?? 'name';
    this.altDescription = altDescription ?? 'text...';
    this.photo = photo ??
        'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photo'),
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Photo(photoLink: photo),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                altDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.h3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: <Widget>[
                  UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                  SizedBox(width: 6.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name, style: AppStyles.h1Black),
                      Text(
                        '@' + userName,
                        style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  LikeButton(likeCount: 10, isLiked: true),
                  Row(
                    children: <Widget>[
                      _buildButton(txt: 'Save'),
                      SizedBox(width: 10),
                      _buildButton(txt: 'Visit'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton({String txt = 'Button'}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.dodgerBlue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Text(txt, style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}

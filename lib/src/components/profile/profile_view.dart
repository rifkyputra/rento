import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rento/src/core/widgets/text/text_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  final double headerTitleHeight = 250;
  final double profileImgSize = 80;
  final double headerbgHeight = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: headerTitleHeight + headerbgHeight,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 130,
                        width: double.maxFinite,
                        child: Image.network(
                          'https://picsum.photos/id/0/300/70',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.blue,
                          height: headerTitleHeight,
                          width: double.maxFinite,
                          // child: ListView(
                          //   children: [
                          //     Text('hi'),
                          //   ],
                          // )
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget.size29(
                                'Purnama',
                              ),
                              TextWidget.size14(
                                'GPU Enthusiast #RentGPU',
                                font: interLight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(top: headerbgHeight - profileImgSize),
                  child: CircleAvatar(
                    minRadius: profileImgSize,
                    maxRadius: profileImgSize,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/id/1005/400/400'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:gnac_flutter_portfolio/res/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ImageViewer {
  ImageViewer(BuildContext context, String image,
      {bool isProject = false, String projectTitle = ""}) {
    showGeneralDialog(
      barrierColor: Colors.black,
      transitionDuration: const Duration(milliseconds: 500),
      barrierDismissible: true,
      barrierLabel: 'Barrier',
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return !isProject
            ? Center(
                child: Hero(
                  tag: 'IMAGEVIEW',
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Scaffold(
                        backgroundColor: Colors.black,
                        body: Container(
                          color: Colors.white,
                          child: Center(
                              child:
                                  PhotoView(imageProvider: AssetImage(image))),
                        )),
                  ),
                ),
              )
            : Center(
                child: Hero(
                  tag: 'IMAGEVIEW',
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Scaffold(
                        backgroundColor: bgColor,
                        appBar: AppBar(
                          leading: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                height: defaultPadding / 2,
                                width: defaultPadding / 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bgColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.pinkAccent.withOpacity(.5),
                                          offset: const Offset(1, 1)),
                                      BoxShadow(
                                          color: Colors.blue.withOpacity(.5),
                                          offset: const Offset(-1, -1)),
                                    ]),
                                child: Center(
                                    child: ShaderMask(
                                  shaderCallback: (bounds) {
                                    return LinearGradient(colors: [
                                      Colors.pink,
                                      Colors.blue.shade900
                                    ]).createShader(bounds);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                    size: defaultPadding,
                                  ),
                                )),
                              ),
                            ),
                          ),
                          backgroundColor: bgColor,
                          foregroundColor: Colors.white,
                          title: Text(
                            projectTitle,
                            overflow: TextOverflow.ellipsis,
                          ),
                          centerTitle: true,
                        ),
                        body: Container(
                          color: Colors.white,
                          child: Center(
                              child:
                                  PhotoView(imageProvider: AssetImage(image))),
                        )),
                  ),
                ),
              );
      },
    );
  }
}

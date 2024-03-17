import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
    super.key,
    required this.categoyName,
    this.onTap,
  });

  final String categoyName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(widthScreen * .02),
          child: Column(
            children: [
              Image.asset(
                MyImages.folderIcon,
                height: heightScreen * .12,
              ),
              Text(
                categoyName,
                style: TextStyle(
                  fontSize: fSize * 1.1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

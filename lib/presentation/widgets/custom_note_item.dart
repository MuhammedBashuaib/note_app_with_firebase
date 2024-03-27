import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/res/color_app.dart';
import 'package:note_app_with_firebase/res/images.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({
    super.key,
    this.onTap,
    required this.noteTitle,
    required this.note,
    required this.date,
    this.onPressedDelete,
  });

  final void Function()? onTap;
  final void Function()? onPressedDelete;
  final String noteTitle;
  final String note;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: heightScreen * .01,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: MyColors.kWhite,
              borderRadius: BorderRadius.circular(widthScreen * .03),
              border: Border.all(
                color: MyColors.kGrey,
                width: 2,
              )),
          padding: EdgeInsets.only(
            left: widthScreen * .02,
            right: widthScreen * .02,
            top: heightScreen * .01,
            bottom: heightScreen * .03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: heightScreen * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    widthScreen * .02,
                  ),
                ),
                child: Image.asset(
                  MyImages.folderIcon,
                ),
              ),
              SizedBox(
                height: heightScreen * .02,
              ),
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: heightScreen * .02),
                  child: Text(
                    noteTitle,
                    style: TextStyle(
                      color: MyColors.kOrange,
                      fontSize: fSize * 1.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(bottom: heightScreen * .02),
                  child: Text(
                    note,
                    style: TextStyle(
                      color: MyColors.kBlack.withOpacity(.5),
                      fontSize: fSize * 1.2,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: onPressedDelete,
                  icon: Icon(
                    Icons.delete,
                    size: heightScreen * .04,
                    color: MyColors.kMaroon,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: widthScreen * .04,
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: MyColors.kBlack.withOpacity(.5),
                    fontSize: fSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

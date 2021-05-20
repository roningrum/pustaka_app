import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';

import 'Constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox({Key key, this.title, this.descriptions, this.text, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: kPustakaBlackBoldMedium.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
              SizedBox(height:8,),
              Text(widget.descriptions,style: kPustakaBlackRegular.copyWith(
                fontSize: 12, letterSpacing: 0.2
              ),textAlign: TextAlign.start),
              SizedBox(height: 18),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.white30,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation:MaterialStateProperty.all(0),
                      backgroundColor:  MaterialStateProperty.all(Colors.transparent)
                    ),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text(widget.text,style: kPustakaGreenMedium.copyWith(fontSize: 16),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
              child: Image.asset("assets/images/dialog.png",fit:BoxFit.fill)
          ),
        ),
      ],
    );
}
}

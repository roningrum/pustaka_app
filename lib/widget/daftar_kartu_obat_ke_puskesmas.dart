import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pustaka_app/const.dart';

import 'Constants.dart';

class DaftarKartuObatDialog extends StatefulWidget {
  const DaftarKartuObatDialog({Key key}) : super(key: key);

  @override
  _DaftarKartuObatDialogState createState() => _DaftarKartuObatDialogState();
}

class _DaftarKartuObatDialogState extends State<DaftarKartuObatDialog> {
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
    return Container(
      padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
          + Constants.padding, right: Constants.padding,bottom: Constants.padding
      ),
      margin: EdgeInsets.only(top: Constants.avatarRadius),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Center(
            child: Image.asset("assets/images/dialog.png",fit: BoxFit.cover, width: 100, height: 100,),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16,),
              Text("Baru pertama kali berobat ke Puskesmas?", style: kPustakaBlackBoldMedium.copyWith(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.25), textAlign: TextAlign.center,),
              SizedBox(height: 8,),
              Text("Kamu bisa datang ke Puskesmas terdekat untuk dapat kartu obat.Jangan lupa, bawa kelengkapan dokumen pendukung seperti Fotocopy KTP, KK dan akta kelahiran ", style: kPustakaBlackRegular.copyWith(fontSize: 12, letterSpacing: 0.25)),
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
                      child: Text("Siap",style: kPustakaGreenMedium.copyWith(fontSize: 16),
                      )
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

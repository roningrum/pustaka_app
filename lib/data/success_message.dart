import 'package:flutter/material.dart';

class SuccessMessage{
  final String success;
  final String message;

  SuccessMessage({@required this.success, @required this.message});

  factory SuccessMessage.fromJson(Map<String, dynamic> json){
    return SuccessMessage(success: json['success'], message: json['message']);
  }


}
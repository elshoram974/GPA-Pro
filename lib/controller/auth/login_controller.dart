import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController{}
class LoginControllerImp extends LoginController{
  GlobalKey<FormState> key = GlobalKey<FormState>();

  
}
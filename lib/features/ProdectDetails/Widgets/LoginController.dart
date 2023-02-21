import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/app_theme.dart';

class LoginController extends GetxController {

var authState = ''.obs;
String verificationID= '';
 late String phoneN;
var auth = FirebaseAuth.instance;


verifyPhone(String phone,context) async {

  await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 120),
     phoneNumber: "+967"+phone,
      verificationCompleted: (AuthCredential authCredential) async {

        print("------------------------");
        print("done......................");
        print("------------------------");

        showTopSnackBar(
            context,
            CustomSnackBar.success(
              message:
              "تم ارسال الكود بنجاح",backgroundColor: AppTheme.primaryColor,
            ));

         // Navigator.push(
         //    context,
         //    CustomPageRoute(  child:   Otp()));
      },
      verificationFailed: (FirebaseAuthException e) {
        if(e.code =="network-request-failed")
  {
    showTopSnackBar(
        context,
        CustomSnackBar.success(
          message:
          "  يرجئ التاكد من انك متصل في الانترنت  ",backgroundColor:  AppTheme.primaryColor,icon: Icon(Icons.face_unlock_sharp),
        ));


  }
        else
          {
            print("------------------------");
            print(e.message.toString());
            print("------------------------");

            showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                  "   يرجئ التاكد من الرقم المدخل  هناك خطب ما يرجئ او يرجئ المحاوله لاحقا !",backgroundColor:  AppTheme.primaryColor,
                ));


         }


  },
   codeSent: (String id, [int? forceResent]){
  this.verificationID = id;
  authState.value = "login Success";


  },


  codeAutoRetrievalTimeout: (id) {

  this.verificationID = id;

  }

  );

  phoneN=phone;


}


verifyOTP (String otp,context) async{
try {

  var credential =PhoneAuthProvider.credential(
      verificationId: this.verificationID, smsCode: otp);
   await auth.signInWithCredential(credential);


  // await Navigator.push(
  //     context,
  //     CustomPageRoute(  child:  const Categories_Page()));
}

catch(FirebaseAuthException) {
  var fe = FirebaseAuthException;

  showTopSnackBar(
      context,
      CustomSnackBar.success(
      message:
      "يرجئ التاكد من رمز التحقق المدخل !"
          " اذا لم يصلك رمز التحقق اختار اعاده ارسال الكود",backgroundColor:  AppTheme.primaryColor,
  ));
}
}


resend (String phone,context) async {

  await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 40),
      phoneNumber: "+967"+phone,
      verificationCompleted: (AuthCredential authCredential) {
        showTopSnackBar(
            context,
            CustomSnackBar.success(
              message:
              "تم ارسال الكود بنجاح",backgroundColor:  AppTheme.primaryColor,
            ));

      },
      verificationFailed: (FirebaseAuthException e) {
        if(e.code =="network-request-failed")
        {
          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message:
                "يرجئ التاكد من انك متصل في الانترنت",backgroundColor:  AppTheme.primaryColor,
              ));

        }
        else
        {
          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message:
                "يرجئ التاكد من انك متصل في الانترنت",backgroundColor:  AppTheme.primaryColor,
              ));
        }


      },
      codeSent: (String id, [int? forceResent]){
        this.verificationID = id;
        authState.value = "login Success";
       // Get.to (Otp);
      },


      codeAutoRetrievalTimeout: (id) {

        this.verificationID = id;

      }

  );

  phoneN=phone;


}


}


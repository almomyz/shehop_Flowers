import 'package:shared_preferences/shared_preferences.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/util/ScreenUtil.dart';
import '../../../core/widgets/CustomPageRoute.dart';

import '../../Orders/presintation/Pages/OrdersPage.dart';
import '../presintation/Widgets/DoneWidget.dart';
import '../presintation/Widgets/OtpInpouts.dart';


class LoginController extends GetxController {

  var authState = ''.obs;
  String verificationID = '';
  late String phoneN;
  var auth = FirebaseAuth.instance;
  TextEditingController otp1=TextEditingController();
  TextEditingController otp2=TextEditingController();
  TextEditingController otp3=TextEditingController();
  TextEditingController otp4=TextEditingController();
  TextEditingController otp5=TextEditingController();
  TextEditingController otp6=TextEditingController();
  ScreenUtil screenUtil =ScreenUtil();
  verifyPhone(String phone, context) async {
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 120),
        phoneNumber: "+967" + phone,
        verificationCompleted: (AuthCredential authCredential) async {
          print("------------------------");
          print("done......................");
          print("------------------------");

          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message:
                "تم ارسال الكود بنجاح", backgroundColor: AppTheme.primaryColor,
              ));
          Navigator.pop(context);
          await Future.delayed(
              Duration(seconds: 2));
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              isScrollControlled: true,
              barrierColor: AppTheme.primarySwatch.shade700,
              context: context, builder: (context) {
                screenUtil.init(context);
            return Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: screenUtil.screenHeight *.4,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("تحقق ",
                        style: AppTheme.textTheme.bodyText1),
                    Text("...قم بإدخال الرمز المكون من ستة ارقام هنا ", style: AppTheme.textTheme.headline5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                otpInpouts(context,otp1),
                otpInpouts(context,otp2),
                otpInpouts(context,otp3),
                otpInpouts(context,otp4),
                otpInpouts(context,otp5),
                otpInpouts(context,otp6),
                ],
                ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppTheme.primaryColor),padding:MaterialStateProperty.all(EdgeInsets.all(10)) ,shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                                ),
                              ),),
                              onPressed: ()async {
                                verifyOTP(otp1.text+otp2.text+otp3.text+otp4.text+otp5.text+otp6.text,context);
                              },
                              child: Text("تحقق")

                          )
                      ),
                    ),
                    Text('اعاده ارسال الكود'),
                  ],
                ),
              ),
            );
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "network-request-failed") {
            showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                  "  يرجئ التاكد من انك متصل في الانترنت  ",
                  backgroundColor: AppTheme.primaryColor,
                  icon: Icon(Icons.face_unlock_sharp),
                ));
          }
          else {
            print("------------------------");
            print(e.message.toString());
            print("------------------------");

            showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                  "   يرجئ التاكد من الرقم المدخل  هناك خطب ما يرجئ او يرجئ المحاوله لاحقا !",
                  backgroundColor: AppTheme.primaryColor,
                ));
          }
        },
        codeSent: (String id, [int? forceResent]) {
          this.verificationID = id;
          authState.value = "login Success";
        },


        codeAutoRetrievalTimeout: (id) {
          this.verificationID = id;
        }

    );

    phoneN = phone;
  }


  verifyOTP(String otp, context) async {
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: this.verificationID, smsCode: otp);

      await auth.signInWithCredential(credential);

      showDialog(
        barrierDismissible: true,
        barrierColor: AppTheme.primaryColor,
        context: context, builder:(context) {
        screenUtil.init(context);
        return Dialog(

          child: Container(
              height: screenUtil.screenHeight *.4,
              width: screenUtil.screenWidth *.7,
              child: DoneWidget()),
        );
      },);

      await Future.delayed(
           Duration(seconds: 5));
      await Navigator.push(
          context,
          CustomPageRoute(  child:  const OredrsPage()));
    }

    catch (FirebaseAuthException) {
      var fe = FirebaseAuthException;

      showTopSnackBar(
          context,
          CustomSnackBar.success(
            message:
            "يرجئ التاكد من رمز التحقق المدخل !"
                " اذا لم يصلك رمز التحقق اختار اعاده ارسال الكود",
            backgroundColor: AppTheme.primaryColor,
          ));
    }
  }


  resend(String phone, context) async {
    await auth.verifyPhoneNumber(
        timeout: Duration(seconds: 40),
        phoneNumber: "+967" + phone,
        verificationCompleted: (AuthCredential authCredential) {
          showTopSnackBar(
              context,
              CustomSnackBar.success(
                message:
                "تم ارسال الكود بنجاح", backgroundColor: AppTheme.primaryColor,
              ));
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "network-request-failed") {
            showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                  "يرجئ التاكد من انك متصل في الانترنت",
                  backgroundColor: AppTheme.primaryColor,
                ));
          }
          else {
            showTopSnackBar(
                context,
                CustomSnackBar.success(
                  message:
                  "يرجئ التاكد من انك متصل في الانترنت",
                  backgroundColor: AppTheme.primaryColor,
                ));
          }
        },
        codeSent: (String id, [int? forceResent]) {
          this.verificationID = id;
          authState.value = "login Success";
          //  Get.to (Otp);
        },


        codeAutoRetrievalTimeout: (id) {
          this.verificationID = id;
        }

    );

    phoneN = phone;
  }



}
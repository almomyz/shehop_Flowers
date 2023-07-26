import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:shehop_flowers/core/app_theme.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/util/ScreenUtil.dart';
import '../../../core/widgets/CustomPageRoute.dart';
import '../../Orders/presintation/Pages/OrdersPage.dart';
import '../presintation/Widgets/DoneWidget.dart';
import 'LoginController.dart';



class ProdectDetailsController extends GetxController {
int counter=01;


intcrment(){
  counter++;
  update();
}


decrment(){

  if(counter<=1){
    counter=1;
    }
  else{
    counter--;
  }
  update();

}

phoneAuth(String phoneNumber,context,_formKey,phone){
  GetStorage box=GetStorage();
  ScreenUtil screenUtil =ScreenUtil();
  Icon SuffixIcon = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 32,
  );
  final loginController =     Get.put(LoginController());
  bool isLoding=false;
  if(phoneNumber==null){
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30))),
        barrierColor: AppTheme.primarySwatch.shade700,
        context: context,

        builder: (context) {
          screenUtil.init(context);
          return StatefulBuilder(builder: (context, setState2) {
            return SingleChildScrollView(
              child: Padding(

                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  height: screenUtil.screenHeight *.4,
                  width: double.infinity,
                  child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                        Text("ادخل رقم الهاتف",
                            style: AppTheme.textTheme.bodyText1),
                        Form(
                          key: _formKey,

                          child: TextFormField(

                            onChanged: (value) {
                              if (value.length == 9) {
                                setState2(() {
                                  SuffixIcon = Icon(Icons.check_circle,
                                      color: Colors.green, size: 32);
                                });
                              } else {
                                setState2(() {
                                  SuffixIcon = Icon(Icons.cancel,
                                      color: Colors.red, size: 32);
                                });
                              }
                            },
                            validator: (value) {
                              if (value.toString().isEmpty ||
                                  value.toString().length <= 8)
                                return "يرجئ التحقق من الرقم المدخل";
                              return null;
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: "7********",
                                labelText: "رقم الهاتف",

                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black12),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black12),
                                    borderRadius:
                                    BorderRadius.circular(10)),
                                prefix: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8),
                                  child: Text(
                                    '(+967)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                suffixIcon: SuffixIcon),
                            maxLength: 9,
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            textDirection: TextDirection.ltr,

                            cursorColor: AppTheme.primaryColor,
                          ),
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
                                  onPressed: () async{
  if(_formKey.currentState!.validate()) {
    setState2(() => isLoding = true);
    loginController.verifyPhone(
        phone.text, context);
    await Future.delayed(
        const Duration(seconds: 15));
    setState2(() => isLoding = false);
  }

                                  },
                                  child:isLoding? Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,)):Text("تاكيد",style: TextStyle(color: Colors.white,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 20),))),
                        )
                      ]),
                ),
              ),
            );
          },);
        });

  }else{
    showDialog(context: context, builder: (context) {
      return  Container(
        child: Center(
          child: Dialog(child: Container(
            height: screenUtil.screenHeight *.3,
            width: screenUtil.screenWidth *.5,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('هل تريد الطلب بهذا الرقم ',style: AppTheme.textTheme.bodyText1),
                  Text(      box.read('phoneNumber').toString()
                      ,style: AppTheme.textTheme.bodyText1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(child: Text('نعم',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily)),onPressed: ()async{
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
                        await  Navigator.pushReplacement(
                            context,
                            CustomPageRoute(  child:  const OredrsPage()));

                      },),
                      ElevatedButton(child: Text('تغيير الرقم',style: TextStyle(fontWeight: FontWeight.bold,fontFamily: AppTheme.fontFamily)),onPressed: (){
                        {
                          Navigator.pop(context);

                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              barrierColor: AppTheme.primarySwatch.shade700,
                              context: context,

                              builder: (context) {
                                screenUtil.init(context);
                                return StatefulBuilder(builder: (context, setState2) {
                                  return SingleChildScrollView(
                                    child: Padding(

                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context).viewInsets.bottom),
                                      child: Container(
                                        height: screenUtil.screenHeight *.4,
                                        width: double.infinity,
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("ادخل رقم الهاتف",
                                                  style: AppTheme.textTheme.bodyText1),
                                              Form(
                                                key: _formKey,

                                                child: TextFormField(

                                                  onChanged: (value) {
                                                    if (value.length == 9) {
                                                      setState2(() {
                                                        SuffixIcon = Icon(Icons.check_circle,
                                                            color: Colors.green, size: 32);
                                                      });
                                                    } else {
                                                      setState2(() {
                                                        SuffixIcon = Icon(Icons.cancel,
                                                            color: Colors.red, size: 32);
                                                      });
                                                    }
                                                  },
                                                  validator: (value) {
                                                    if (value.toString().isEmpty ||
                                                        value.toString().length <= 8)
                                                      return "يرجئ التحقق من الرقم المدخل";
                                                    return null;
                                                  },
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.grey.shade200,
                                                      hintText: "7********",
                                                      labelText: "رقم الهاتف",

                                                      enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.black12),
                                                          borderRadius:
                                                          BorderRadius.circular(10)),
                                                      focusedBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.black12),
                                                          borderRadius:
                                                          BorderRadius.circular(10)),
                                                      prefix: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 8),
                                                        child: Text(
                                                          '(+967)',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      suffixIcon: SuffixIcon),
                                                  maxLength: 9,
                                                  controller: phone,
                                                  keyboardType: TextInputType.phone,
                                                  textDirection: TextDirection.ltr,

                                                  cursorColor: AppTheme.primaryColor,
                                                ),
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
                                                        onPressed: () async{
                                                          setState2(() => isLoding = true);
                                                          loginController.verifyPhone(
                                                              phone.text, context);
                                                          await Future.delayed(
                                                              const Duration(seconds: 15));
                                                          setState2(() => isLoding = false);


                                                        },
                                                        child:isLoding? Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,)):Text("تاكيد",style: TextStyle(color: Colors.white,fontFamily: AppTheme.fontFamily,fontWeight: FontWeight.bold,fontSize: 20),))),
                                              )
                                            ]),
                                      ),
                                    ),
                                  );
                                },);
                              });

                        }
                      },)
                    ],)

                ]),
          )),
        ),
      );
    },);
  }
}

}


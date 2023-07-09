import 'package:flutter/material.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';

import '../../features/ProdectDetails/presintation/Widgets/OtpInpouts.dart';
import '../app_theme.dart';
ScreenUtil screenUtil=ScreenUtil();
TextEditingController phone=TextEditingController();

OtpAuth(context){
                        showModalBottomSheet(context: context, builder: (context) {
                          return
                            Container(
                              height: 800,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                Text("ادخل رمز التحقق", style: AppTheme.textTheme.bodyText1),
                                Text("...قم بإدخال الرمز المكون من ستة ارقام هنا ", style: AppTheme.textTheme.headline5),

                                  Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly
                                  ,children: [

                                      otpInpouts(context),
                                      otpInpouts(context),
                                      otpInpouts(context),
                                      otpInpouts(context),
                                      otpInpouts(context),
                                      otpInpouts(context),

                                  ],),
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
                                            onPressed: () {

                                            },
                                            child: Text("تحقق"))),
                                  )
                                ],
                              ),
                            );





                        },);

}
phoneAuth(context,bool isloding){
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
                    TextFormField(

                      maxLength: 9,
                       controller: phone,
                      keyboardType: TextInputType.phone,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                            fillColor: Colors.grey.shade200,
                        filled: true,
                        prefix: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Text(
                            textAlign: TextAlign.start,
                            '(+967)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        hintTextDirection:
                        TextDirection.ltr,
                        hintText: "رقم الهاتف ",

                        enabledBorder:
                        UnderlineInputBorder(

                          borderSide: BorderSide(
                              color: Colors.transparent,),
                        ),
                        prefixIcon: Icon(
                            Icons.phone_android,
                            size: 30,
                            color: AppTheme.primaryColor),
                        focusedBorder:
                        UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white),
                        ),
                      ),
                      cursorColor: AppTheme.primaryColor,
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
                              onPressed: () {

                              },
                              child:isloding? Center(child: CircularProgressIndicator(color: Colors.white,strokeWidth: 5,)):Text("تاكيد"))),
                    )
                  ]),
            ),
          ),
        );
      });

}

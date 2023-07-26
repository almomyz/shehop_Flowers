import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shehop_flowers/core/util/ScreenUtil.dart';
import 'package:shehop_flowers/features/Drawer/presintation/Page/DrawerWidget.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/util/common.dart';
import '../../../../core/widgets/myCustemAppber.dart';

class SpacialRequestPage extends StatefulWidget {
  const SpacialRequestPage({Key? key}) : super(key: key);

  @override
  State<SpacialRequestPage> createState() => _SpacialRequestPageState();
}

class _SpacialRequestPageState extends State<SpacialRequestPage> {
  @override
  var image;
  var imgname;
  var urlimg;
  var time= TimeOfDay.now();
  DateTime date=DateTime.now();
  late File file = image;
  var imgPicker = ImagePicker();
  bool visible=false;
  ScreenUtil screenUtil =ScreenUtil();
  Widget build(BuildContext context) {
    screenUtil.init(context);
    return SafeArea(
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffolKey,
        drawer: DrawerWidget(scaffolKey: scaffolKey),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    myCustemAppber(name: "طلبات خاصة",scaffolKey: scaffolKey, ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                    child: InkWell(
                        onTap: () {
                          selectimg(context);
                        },
                        child: file == null
                            ? image = Icon(
                                Icons.add_photo_alternate_outlined,
                                color: AppTheme.primaryColor,
                                size: 30,
                              )
                            : ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                              child: Image.file(
                                  file,
                                  fit: BoxFit.cover,
                                ),
                            )),
                    height: screenUtil.screenHeight *.3,
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.white,
                      border: Border.all(color: AppTheme.primaryColor),
                    )),
                Divider(color: AppTheme.primaryColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 30),
                  child: Text(
                    "اترك ملاحظاتك عن طلبك ",
                    style: AppTheme.textTheme.headline5,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 50, right: 20),
                  child: TextFormField(
                    maxLines: 4,
                    style: TextStyle(color: AppTheme.primaryColor),
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'اكتب ملاحظاتك هنا ......',
                      hintTextDirection: TextDirection.rtl,
                      suffixIcon: Icon(
                        Icons.edit_note,
                        color: AppTheme.primaryColor,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.primaryColor),
                      ),
                    ),
                    cursorColor: AppTheme.primaryColor,
                  ),
                ),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.center,


                  children: [
                    Checkbox(

                        value: visible, onChanged: (value){
                      setState(() {
                        visible=value!;
                      });
                    }),
                    Text('طلب مستعجل ',style: TextStyle(fontFamily: AppTheme.fontFamily,color: AppTheme.secondaryColor,fontWeight: FontWeight.bold,fontSize: 18)),

                  ],
                ),
                Visibility(
                  visible: visible,
                  child: SingleChildScrollView(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Text(time.hour.toString()+":"+time.minute.toString()),
                            IconButton(
                                onPressed: ()async {
                                  time=(await       showTimePicker(context: context, initialTime:time))!;
                                 if(time==null)return;
                                 setState(() {
                                   time;
                                 });
                                },
                                icon: Icon(Icons.access_alarm),
                                color: AppTheme.primaryColor),
                          ]),
                          Row(children: [
                            Text(date.day.toString()+"/"+date.month.toString()+"/"+date.year.toString()),
                            IconButton(
                                onPressed: () async{
                             DateTime? newDate=     await   showDatePicker(
                                      initialDate: date,
                                      firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  context:context,

                                  );

                             if(newDate==null)return;
                             setState(() {
                               date=newDate;
                             });
                                },
                                icon: Icon(Icons.calendar_month),
                                color: AppTheme.primaryColor),
                          ]),
                        ]),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppTheme.primaryColor),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(10)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "ارسال الـطلب",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,

                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.bold),
                          ))),
                )
              ]),
        ),
      ),
    ));
  }

  selectimg(context) async {
    var imgpiced = await imgPicker.getImage(source: ImageSource.gallery);
    if (imgpiced != null) {
      setState(() {
        file = File(imgpiced.path);
        imgname = basename(imgpiced.path);
      });
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.info(
            message: "لم يتم اختيار صوره ",
            backgroundColor: AppTheme.primaryColor),
      );
    }
  }


}

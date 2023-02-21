import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_theme.dart';

otpInpouts(context ){
  return SizedBox(
    width: 50,
    height: 50,
    child: TextFormField(

      decoration: InputDecoration(
        hintText: '*',
        hintTextDirection: TextDirection.rtl,

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primaryColor),
        ),
      ),

      keyboardType: TextInputType.number,
        style: TextStyle(color: AppTheme.primaryColor),
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: (value) {
        if (value.length == 1) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty) {
          FocusScope.of(context).previousFocus();
        }
      },

      onSaved: (value) {},
    ),
  );

}
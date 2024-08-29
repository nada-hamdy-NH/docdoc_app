import 'dart:ui';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFields extends StatefulWidget {
  
  const FormFields({super.key});

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  
final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool checkBoxValue = false;
    return Form(
      key:formKey ,
      child: Column(
        children: [
            Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFEDEDED)),
                borderRadius: BorderRadiusDirectional.circular(16.r ),
              ),
              child:TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFFDFDFF),
                hintText:"Email",
                hintStyle: TextStyles.font14LiteGrayMediam,
                border: InputBorder.none,                 
                    ),
                    )
            ),
            SizedBox(height: 16.h,),
            Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFEDEDED)),
                borderRadius: BorderRadiusDirectional.circular(16.r ),
              ),
              child:TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFFDFDFF),
                hintText:"Password",
                hintStyle: TextStyles.font14LiteGrayMediam,
                border: InputBorder.none,                 
                    ),
                    )
            ),
            SizedBox(height: 16.h,),
            Row(
              children:[
                Checkbox(
                  
                  value:checkBoxValue,
                  side: const BorderSide(
                    
                    color:Color(0xFFA9B2B9),
                    width: 2.0
                  ),
                  
                  shape: RoundedRectangleBorder(
                  
                    borderRadius:BorderRadius.all(Radius.circular(4)) ),
                  onChanged:(value){
                checkBoxValue = value!;
                
              }),
              Text("Remember me",style:TextStyles.font12GrayRegular),
              SizedBox(width:87.w,),
              Text("Forgot Password?",style:TextStyles.font12BlueRegular)
              
        ])
          
      
          ],
      ),
    );
  }
}

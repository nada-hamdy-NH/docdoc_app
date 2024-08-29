import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsOfLoginWith extends StatelessWidget {
  const IconsOfLoginWith({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.w),
      child: Row(children: [
        
             // IconButton(onPressed: (
             Expanded(
               child: SizedBox(
                height: 46.h,
                width: 46.w,
                child:CircleAvatar(  
               backgroundColor: Color(0xFFF5F5F5),
               child: SvgPicture.asset( "assets/svgs/google1.svg",width: 25,height: 24,fit: BoxFit.cover,
               )
                
                ),)
               )
             ,
             Expanded(
               child: SizedBox(
                height: 46.h,
                width: 46.w,
                child:CircleAvatar(  
               backgroundColor: Color(0xFFF5F5F5),
               child: IconButton(
                onPressed: (){},
                icon:SvgPicture.asset( "assets/svgs/facebook.svg",width: 25,height: 24,fit: BoxFit.cover,)
                ,))
               ),
             ),
             Expanded(
               child: SizedBox(
                height: 46.h,
                width: 46.w,
                child:CircleAvatar(  
               backgroundColor: Color(0xFFF5F5F5),
               child: IconButton(
                onPressed: (){},
                icon:SvgPicture.asset("assets/svgs/apple.svg",width: 25,height: 28,fit: BoxFit.cover)),)
               ),
             ),
              
              
              
              
          
          
        
      ],),
    );
    
  }
}
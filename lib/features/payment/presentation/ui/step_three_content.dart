import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/payment/presentation/ui/booking_info_time_anddate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class StepThreeContent extends StatelessWidget {
  final Doctor doctorInfo ; 
  final String image ; 
  final  DateTime selectedDate ; 
  final String selectedTime ;
  final String paymentOption ;
  final String appointmentType ;
  StepThreeContent({super.key ,
   required this.doctorInfo , required this.image, required this.selectedDate, required this.selectedTime, required this.appointmentType, required this.paymentOption});

  final List<Map<String, String>> bookingInfo = [
    {
      "icon": "assets/svgs/calendar.svg",
      "title": "Date & Time",
    },
    {"icon": "assets/svgs/clipboard-text.svg", "title": "Appointment Type"}
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(12),
           Padding(
              padding:  EdgeInsets.symmetric( horizontal:20.w ),
              child: Text(
            "Booking Information",
            style: TextStyles.font16darkBlue600Weight,
          )),
            Padding(
              padding:  EdgeInsets.symmetric( horizontal:20.w ),
              child:
          BookingInfoTimeAndDate(bookingInfo: bookingInfo,selectedDate:  selectedDate,selectedTime:  selectedTime,appointmentType:appointmentType )),
          Padding(
            padding:  EdgeInsets.only(bottom: 12.0.h , left: 20.0.h,top: 8.h ),
            child: Text(
              "Doctor Information",
              style: TextStyles.font16darkBlue600Weight,
            ),
          ),

           Padding(
              padding:  EdgeInsets.symmetric( horizontal:20.w ),
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: AssetImage(
                       image,),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorInfo.name!,    
                                          style: TextStyles.font16darkBlueBold,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("${doctorInfo.specialization!.name} | ${doctorInfo.phone}",
                          style: TextStyles.font12GrayMedium),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        doctorInfo.email!,
                        style: TextStyles.font12GrayMedium,
                      )
                    ]),
              )
            ]),
          )),
          Padding(
            padding:  EdgeInsets.only(top: 30.0.h , bottom: 24.0.h , left: 20.0.h),
            child: Text(
              "Payment Information",
              style: TextStyles.font16darkBlue600Weight,
            ),
          ),
          SizedBox(
            height: 40.h,

            child: const Row(
              children: [
              Icon(Icons.payment_outlined)
            ]),
          ),
Container(

  decoration:  BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(40),
    ),
    boxShadow: [
      BoxShadow(
        color: ColorsManager.darkBlue.withOpacity(0.04),
        blurRadius: 30,
        offset: const Offset(0, -5),
      ),
    ],
  ),
  child: Padding(
    padding:  EdgeInsets.symmetric ( horizontal:30.0.w , vertical: 10.0.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 50.w,
            height: 3.h,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: ColorsManager.LighterGray,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
    
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 24.h),
          child: const Text(
            "Payment Info",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w600, ),
          ),
        ),
       
    
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal" , style: TextStyles.font14GrayRegular),
             Text("\$4694" , style: TextStyles.font14DarkBlueSiemiBold),
          ],
        ),
         SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text("Tax" , style:  TextStyles.font14GrayRegular),
            Text("\$250" , style:  TextStyles.font14DarkBlueSiemiBold,),
          ],
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:  16.0.h),
          child:const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                "Payment Total",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                "\$4944",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
    
       
    
      ],
    ),
  ),
)
          
        ],
      ),
    );
  }
}


import 'package:docdoc/core/helper/spacing.dart';
import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/widgets/app_text_button.dart';
import 'package:docdoc/features/doctors/data/doctors_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_inout_model.dart';
import 'package:docdoc/features/payment/data/payment_intent_response_model/make_appointment_model.dart';
import 'package:docdoc/features/payment/presentation/logic/cubit/payment_cubit.dart';
import 'package:docdoc/core/widgets/build_header.dart';
import 'package:docdoc/features/payment/presentation/ui/custom_button_bloc_consumer.dart';
import 'package:docdoc/features/payment/presentation/ui/number_stepper_widget.dart';
import 'package:docdoc/features/payment/presentation/ui/step_one_content.dart';
import 'package:docdoc/features/payment/presentation/ui/step_three_content.dart';
import 'package:docdoc/features/payment/presentation/ui/step_two_content.dart';
import 'package:docdoc/features/payment/presentation/ui/stepper_header.dart';
import 'package:docdoc/features/payment/presentation/ui/times.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointment extends StatefulWidget {
  final String image;
  final Doctor doctorInfo;
  const BookAppointment(
      {super.key, required this.image, required this.doctorInfo});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  int activeStep = 0;
  int selectedContainer = 0;
  int selectedAppointmentTypeIndex = 0;

  // بيانات هنحتفظ بيها
  DateTime? selectedDate;
  String? selectedTime;
  int selectedPaymentIndex = 0;
  int selectedPaymentOptionIndex = 0;
  MakeAppointmentModel get makeAppointmentModel => buildAppointmentModel();

  final List<String> paymentOption = ["Credit Cards", "Bank Transfer", "Paypal"];

  final List<Map<String, String>> appointmentTypes = [
    {
      "title": "In Person",
      "icon": 'assets/svgs/profile-2user.svg',
      "bgColor": '0xFFEAF2FF',
    },
    {
      "title": "Video Call",
      "icon": 'assets/svgs/video.svg',
      "bgColor": '0xFFE9FAEF',
    },
    {
      "title": "Phone Call",
      "icon": 'assets/svgs/call.svg',
      "bgColor": '0xFFFDFDFF',
    },
  ];
  List<String> times = generateDynamicSlots(
    startHour: 14,
    endHour: 20,
    slotsCount: 6,
  );

  MakeAppointmentModel buildAppointmentModel() {
    return MakeAppointmentModel(
      doctorInfo: widget.doctorInfo,
      image: widget.image,
      selectedDate: selectedDate ?? DateTime.now(),
      selectedTime: selectedTime ?? "02:00",
      paymentOption: paymentOption[selectedPaymentOptionIndex],
      appointmentType: appointmentTypes[selectedAppointmentTypeIndex]["title"]!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: buildHeader("Book Appointment"),
            ),
            verticalSpace(40),
            CustomNumberStepper(
              stepCount: 3,
              activeStep: activeStep, // pass the int from parent state
              onStepReached: (index) => setState(() {
                activeStep = index;
              }), // optional
              stepRadius: 16.r, // if you use ScreenUtil
              lineLength: 50.w, // adjust spacing
              lineThickness: 2.0,
              completedColor: Colors.green,
              currentColor: ColorsManager.mainBlue, // your blue
              futureColor: ColorsManager.stepperColor, // your gray
              numberTextStyle: TextStyles.font12White500Weight,
            ),
            Center(
              child: SizedBox(
                width: 286.w,
                child: header(activeStep: activeStep),
              ),
            ),
            verticalSpace(20),
            Expanded(
              child: SingleChildScrollView(
                  child: activeStep == 0
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: StepOneContent(
                            selectedAppointmentTypeIndex:
                                selectedAppointmentTypeIndex,
                            selectedContainer: selectedContainer,
                            appointmentTypes: appointmentTypes,
                            availableTime: widget.doctorInfo.startTime!,
                            onTimeSelect: (index) {
                              setState(() => selectedContainer = index);
                              selectedTime = times[index];
                            },
                            onTypeSelect: (index) => setState(
                                () => selectedAppointmentTypeIndex = index),
                            onDateSelect: (DateTime value) {
                              setState(() => selectedDate = value);
                            },
                          ))
                      : activeStep == 1
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: StepTwoContent(
                                selectedPaymentIndex:
                                    selectedPaymentOptionIndex,
                                onPaymentOptionSelected: (index) {
                                  setState(
                                      () => selectedPaymentOptionIndex = index);
                                },
                              ))
                          : StepThreeContent(
                              appointmentModel: makeAppointmentModel)),
            ),
            verticalSpace(7),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomButtonBlocConsumer(
                  appointmentModel: makeAppointmentModel,
                  activeStep: activeStep,
                  selectedPaymentOptionIndex: selectedPaymentOptionIndex,
                  paymentIntentInputModel:
                      PaymentIntentInputModel(amount: 2000, currency: "usd"),
                  onNextStep: () {
                    setState(() => activeStep++);
                  },
                )),
          ],
        ),
      ),
    );
  }
}

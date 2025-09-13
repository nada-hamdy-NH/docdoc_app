import 'package:docdoc/features/inbox/data/model/message_item_model.dart';

List<MessageItemModel> messagesList = [
  MessageItemModel(
    name: 'Dr. Randy Wigham',
    specialization: "General Doctor",
    degree: "Specialist",
    image: "assets/images/doctor1.png",
    message1: "I have a headache and body aches.",
    message2:
        "I'm sorry to hear that. How long have you been feeling this way?",
    isUnread: true,
    time: '7:11 PM',
    numberOfUnreadMessages: '2',
  ),
  MessageItemModel(
    name: 'Dr. Jack Sulivan',
    specialization: "Neurologic",
    degree: "Consultant",
    image: "assets/images/doctor2.png",
    message1: "I've been having chest discomfort and shortness of breath.",
    message2:
        "That sounds concerning. Have you experienced this before or is this something new?",
    isUnread: true,
    time: '9:30 PM',
    numberOfUnreadMessages: '1',
  ),
  MessageItemModel(
    name: 'Dr. Hanna Stanton',
    specialization: "Pediatric",
    degree: "Specialist",
    image: "assets/images/doctor3.png",
    message1: "I think I have a fever and sore throat.",
    message2:
        "Let me check. Are you experiencing any other symptoms, such as a cough or body aches?",
    isUnread: false,
    time: '10:25 PM',
    numberOfUnreadMessages: '2',
  ),
  MessageItemModel(
    name: 'Dr. Emery Lubin',
    specialization: "Radiology",
    degree: "Consultant",
    image: "assets/images/doctor4.png",
    message1:
        "I’ve been feeling very fatigued lately and can't seem to concentrate.",
    message2:
        "I see. Have you noticed any changes in your sleep or diet recently?",
    isUnread: false,
    time: '9:44 PM',
    numberOfUnreadMessages: '1',
  ),
  MessageItemModel(
    name: 'Dr. Michael Huang',
    specialization: "General Doctor",
    degree: "Consultant",
    image: "assets/images/doctor1.png",
    message1: "My child has a rash that appeared suddenly. What should I do?",
    message2:
        "Let’s take a closer look. Has your child been exposed to any new foods, medications, or environments?",
    isUnread: false,
    time: '12:52 PM',
    numberOfUnreadMessages: '1',
  ),
];

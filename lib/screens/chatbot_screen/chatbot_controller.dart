import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:it_support/models/chatbot.dart';
import 'package:it_support/models/message.dart';


class ChatBotController extends GetxController {
  RxInt indexQuestion = 0.obs;
  var listMessage = [].obs;

  List<Chatbot> listChatbot = [
    new Chatbot(
      question: "Chúng tôi có thể giúp gì cho bạn?",
      listAnswer: [],
      typeInput: TextInputType.text,
    ),
    new Chatbot(
      question: "Vấn đề cần sự trợ giúp của bạn là gì?",
      listAnswer: [],
      typeInput: TextInputType.text,
    ),
    new Chatbot(
      question: "Máy tính khởi động chậm có thể do nhiều nguyên nhân.",
      listAnswer: [],
      typeInput: TextInputType.text,
    ),
    new Chatbot(
      question: "Trước tiên hãy cho tôi biến bạn sử dụng thiết bị gì?",
      listAnswer: [
        "Windows",
        "MacOS",
        "Linux",
        "Khác",
      ],
      typeInput: TextInputType.text,
    ),
    new Chatbot(
      question: "Máy tính của bạn thuộc nhà sản xuất nào?",
      listAnswer: [
        "Dell",
        "Asus",
        "Acer",
        "MSI",
        "Predator",
        "Khác",
      ],
      typeInput: TextInputType.text,
    ),
  ];

  RxBool isSend = true.obs;

  void nextQuestion() {
    new Future.delayed(const Duration(seconds: 2),
            () => {if (indexQuestion < listChatbot.length - 1) indexQuestion++});
    if (indexQuestion.value == listChatbot.length - 1) {
      Future.delayed(const Duration(seconds: 2));
    }
  }

  void addListMessage(String messageBot, String messagePatient) {
    listMessage.insert(
        0, Message(messageBot: messageBot, messagePatient: messagePatient));
  }

  void SendMessage() {
    new Future.delayed(const Duration(seconds: 2), () => isSend.value = false);
  }

  void SendMessageSuccess() {
    isSend.value = true;
  }

  RxBool start = false.obs;
  startChatBot() {
    new Future.delayed(const Duration(seconds: 4), () => start.value = true);
  }

  RxBool startBubble = false.obs;
  bubbleAppear() {
    new Future.delayed(const Duration(seconds: 2), () => startBubble.value = true);
  }


}

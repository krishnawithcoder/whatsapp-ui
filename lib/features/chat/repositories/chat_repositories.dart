import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_ui/common/enums/message_enum.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/model/chat_contects_model.dart';
import 'package:whatsapp_ui/model/user_model.dart';

class ChatRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ChatRepository({required this.firestore, required this.auth});

  void _saveDataToContactsSubcollection(
    UserModel senderUserData,
    UserModel reciverUserData,
    String text,
    DateTime timeSend,
    String recieverUserId,
  ) async {
    var reciverChatContact = ChatContact(
      name: senderUserData.name,
      profilePic: senderUserData.profilePic,
      contactId: senderUserData.uid,
      timeSend: timeSend,
      lastMessage: text,
    );
    await firestore
        .collection('user')
        .doc(recieverUserId)
        .collection('chats')
        .doc(auth.currentUser!.uid)
        .set(
          reciverChatContact.toMap(),
        );
    var senderChatContact = ChatContact(
      name: reciverUserData.name,
      profilePic: reciverUserData.profilePic,
      contactId: reciverUserData.uid,
      timeSend: timeSend,
      lastMessage: text,
    );
    await firestore
        .collection('user')
        .doc(auth.currentUser!.uid)
        .collection('chats')
        .doc(recieverUserId)
        .set(
          senderChatContact.toMap(),
        );
  }

  void _saveMessageToContactsSubcollection({
    required String recieverUserId,
    required String text,
    required DateTime timeSent,
    required String messageId,
    required String username,
    required reciverUsername,
    required MessageEnum messageType,
  }) async {}

  void sendTextMessege(
      {required BuildContext context,
      required String text,
      required String recieverUserId,
      required UserModel senderUser}) async {
    try {
      var timeSent = DateTime.now();
      UserModel recieverUserData;
      var userDataMap =
          await firestore.collection('users').doc(recieverUserId).get();

      recieverUserData = UserModel.fromMap(userDataMap.data()!);
      _saveDataToContactsSubcollection(
        senderUser,
        recieverUserData,
        text,
        timeSent,
        recieverUserId,
      );
      // _saveMessageToContactsSubcollection(
      //     messageId: '',
      //     messageType: null,
      //     recieverUserId: '',
      //     reciverUsername: null,
      //     text: '',
      //     timeSent: null,
      //     username: '');
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}

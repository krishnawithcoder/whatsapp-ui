class ChatContact {
  final String name;
  final String profilePic;
  final String contactId;
  final DateTime timeSend;
  final String lastMessage;

  ChatContact({
    required this.name,
    required this.profilePic,
    required this.contactId,
    required this.timeSend,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'profilePic': profilePic});
    result.addAll({'contactId': contactId});
    result.addAll({'timeSend': timeSend.millisecondsSinceEpoch});
    result.addAll({'lastMessage': lastMessage});

    return result;
  }

  factory ChatContact.fromMap(Map<String, dynamic> map) {
    return ChatContact(
      name: map['name'] ?? '',
      profilePic: map['profilePic'] ?? '',
      contactId: map['contactId'] ?? '',
      timeSend: DateTime.fromMillisecondsSinceEpoch(map['timeSend']),
      lastMessage: map['lastMessage'] ?? '',
    );
  }
}

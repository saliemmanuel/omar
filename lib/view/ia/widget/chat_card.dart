import 'package:flutter/material.dart';

import '../../../config/palette.dart';

class ChatCard extends StatelessWidget {
  final bool? isMe;
  final String? messages;

  final String? date;
  const ChatCard({Key? key, this.isMe, this.messages, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        message(isMe: isMe!, message: messages!, date: date!),
      ],
    );
  }
}

message({bool? isMe, String? message, String? date}) {
  return Column(
    crossAxisAlignment:
        isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Palette.footerColors,
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(23.0),
              bottomLeft: isMe
                  ? const Radius.circular(23.0)
                  : const Radius.circular(0.0),
              topLeft: const Radius.circular(23.0),
              bottomRight: isMe
                  ? const Radius.circular(0.0)
                  : const Radius.circular(23.0),
            )),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(message!, style: const TextStyle(color: Colors.white)),
              Align(
                alignment: Alignment.centerRight,
                child: Text(date!, style: const TextStyle(color: Colors.white)))
            ],
          ),
        ),
      ),
    ],
  );
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:omar/view/ia/widget/proposition_ai_bubble.dart';
import './ia_controller.dart';
import 'dart:math' as math;

class IaPage extends GetView<IaController> {
  const IaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            const Flexible(
              // child: ListView.separated(
              //   itemCount: 12,
              //   shrinkWrap: true,
              //   reverse: true,
              //   separatorBuilder: (_, i) => const SizedBox(height: 1.0),
              //   itemBuilder: (_, i) {
              //     return InkWell(
              //         child: ChatCard(
              //       isMe: i % 2 == 0 ? true : false,
              //       date: "10:20",
              //       messages:
              //           "Ullamco consectetur anim velit ipsum eiusmod dolore quis aute esse aliqua. Aliquip cupidatat sunt nisi aliquip et do qui. Sint aliquip excepteur et eiusmod reprehenderit incididunt ut deserunt eu nulla officia dolore eu. Irure aute pariatur ullamco anim ullamco culpa velit minim cillum. Elit laborum consequat sunt culpa ea ad reprehenderit eiusmod aliqua ea voluptate duis. Et ut culpa tempor mollit deserunt id mollit minim dolor.",
              //     ));
              //   },
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  AutoSizeText(
                    "Posez moi une question.",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 32),
                  ),
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [PropositionIABubble()],
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          children: [
                            PropositionIABubble(),
                            SizedBox(width: 12),
                            PropositionIABubble()
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30)
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(
                    child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  decoration:
                      InputDecoration(hintText: 'Envoyer un message texte'),
                )),
                IconButton(
                  icon: const HeroIcon(HeroIcons.paperAirplane),
                  onPressed: () async {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

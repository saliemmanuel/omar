import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:heroicons/heroicons.dart';

class PropositionIABubble extends StatelessWidget {
  const PropositionIABubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          Transform.rotate(
            angle: -math.pi / 8,
            child: const HeroIcon(HeroIcons.chatBubbleLeft),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
                maxLines: 2,
                "Est in officia nisi cupidatat dolore voluptate. Cupidatat aute aute in ipsum laborum est ipsum labore excepteur officia eiusmod aute. Sunt tempor tempor ut sint cupidatat commodo duis fugiat deserunt nulla reprehenderit. Velit consectetur eiusmod adipisicing sint duis. Tempor laboris nostrud non ut minim deserunt duis aute. Proident anim magna nulla in reprehenderit irure sunt commodo officia aliquip. Voluptate aute enim ullamco adipisicing est officia in."),
          ),
        ],
      ),
    ));
  }
}

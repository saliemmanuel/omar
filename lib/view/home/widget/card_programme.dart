import 'package:flutter/material.dart';

import '../../../config/palette.dart';

class CardProgramme extends StatelessWidget {
  final String nomUnite;
  final String codeUnite;
  final String heurCM;
  final String heurTD;
  final String heurTP;
  final String heurTPE;
  final String heurDebut;
  final String heurFin;
  final String nomEnseignant;
  final String nomSalle;
  const CardProgramme(
      {super.key,
      required this.nomUnite,
      required this.codeUnite,
      required this.heurCM,
      required this.heurTD,
      required this.heurTP,
      required this.heurTPE,
      required this.heurDebut,
      required this.heurFin,
      required this.nomEnseignant,
      required this.nomSalle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 95,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 0, 76, 253),
            Color.fromARGB(255, 136, 0, 255)
          ]),
          color: Palette.kPrimaryColor,
          borderRadius: BorderRadiusDirectional.circular(13)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 12, color: Colors.white),
                      Text(
                        ' $heurDebut',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    ' $heurFin',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 90,
              width: 1,
              color: Colors.deepPurple,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8, right: 5, left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "$codeUnite $nomUnite",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          'Now',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      nomSalle,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

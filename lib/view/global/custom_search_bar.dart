import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 5),
      height: 50.0,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12.0)),
      child: Row(
        children: [
          const SizedBox(width: 15.0),
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 15.0),
          Expanded(
              child: Column(
            children: [
              const SizedBox(height: 12.0),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
            ],
          )),
          const SizedBox(width: 15.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;

  const CustomAppBar({super.key, required this.titleText});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.memory,
                    size: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 6),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Tech',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Fix',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          titleText,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 11, 19, 37),
      ),
    );
  }
}

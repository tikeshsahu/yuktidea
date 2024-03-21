import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.18),
              offset: const Offset(-3, -3),
              blurRadius: 7,
              spreadRadius: 2,
            ),
            const BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 3,
            ),
          ],
          border: Border.all(color: Colors.black, width: 0.5),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 0,
          color: const Color.fromARGB(255, 17, 17, 17),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.all(12),
              color: const Color.fromARGB(255, 17, 17, 17),
              child: const Center(
                  child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 17,
              )),
            ),
          ),
        ),
      ),
    );
  }
}

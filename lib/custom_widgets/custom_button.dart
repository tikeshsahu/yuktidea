import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButton({Key? key, required this.onPressed, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              offset: const Offset(-3, -3),
              blurRadius: 7,
              spreadRadius: 1,
            ),
            const BoxShadow(
              color: Colors.black,
              offset: Offset(3, 3),
              blurRadius: 6,
              spreadRadius: 2.5,
            ),
          ],
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          elevation: 0,
          color: const Color.fromARGB(255, 17, 17, 17),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              color: const Color.fromARGB(255, 17, 17, 17),
              child: Center(child: child),
            ),
          ),
        ),
      ),
    );
  }
}

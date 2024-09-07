import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  final int selectedIndex;
  final void Function(int) onTap;

  const AppDrawer({
    required this.icon,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(index);
      },
      child: Container(
        alignment: Alignment.center,
        width: 200,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? const Color(0xFF347CFF).withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: selectedIndex == index
                  ? const Color(0xFF252525)
                  : const Color(0xFF000000).withOpacity(0.3),
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: selectedIndex == index
                    ? Colors.black
                    : const Color(0xFF000000).withOpacity(0.6),
                fontWeight: selectedIndex == index
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

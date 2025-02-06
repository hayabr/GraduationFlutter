import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt, size: 28),
          label: "Trans.",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart, size: 28),
          label: "Stats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet, size: 28),
          label: "Accounts",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz, size: 28),
          label: "More",
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey.shade600,
      onTap: onItemTapped,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.orange,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: Colors.grey,
      ),
      backgroundColor: Colors.white,
      elevation: 5,  // إضافة الظل لجعل الشريط يبرز
      type: BottomNavigationBarType.fixed, // لتغيير نوع التحديد
      selectedIconTheme: const IconThemeData(
        color: Colors.red, // تغيير لون الأيقونة المحددة
        size: 30, // زيادة حجم الأيقونة المحددة
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey, // تغيير لون الأيقونة غير المحددة
        size: 28, // تقليل حجم الأيقونة غير المحددة
      ),
    );
  }
}

import 'package:budgetbuddy/app/constants.dart';
import 'package:budgetbuddy/presentation/screens/Receipts.dart';
import 'package:budgetbuddy/presentation/screens/Transactions.dart';
import 'package:budgetbuddy/presentation/screens/Wallet.dart';
import 'package:budgetbuddy/presentation/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _handleDrawerTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(
                    'assets/icons/BB.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  "BudgetBuddy",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
                SizedBox(width: 5),
                Text(
                  "| Affan Saleem",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 0.4,
        crossAxisSpacing: 50,
        children: [
          // Drawer widget
          Card(
            color: const Color(0xFFF1F5FB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // User Image and Info
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/images/my_img.PNG",
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Affan Saleem",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Developer",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          AppDrawer(
                            icon: Icons.dashboard,
                            title: "Dashboard",
                            index: 0,
                            selectedIndex: _selectedIndex,
                            onTap: _handleDrawerTap,
                          ),
                          AppDrawer(
                            icon: Icons.account_balance_wallet_outlined,
                            title: "Wallet",
                            index: 1,
                            selectedIndex: _selectedIndex,
                            onTap: _handleDrawerTap,
                          ),
                          AppDrawer(
                            icon: Icons.layers_outlined,
                            title: "Transactions",
                            index: 2,
                            selectedIndex: _selectedIndex,
                            onTap: _handleDrawerTap,
                          ),
                          AppDrawer(
                            icon: Icons.analytics_outlined,
                            title: "Revenue Analytics",
                            index: 3,
                            selectedIndex: _selectedIndex,
                            onTap: _handleDrawerTap,
                          ),
                          AppDrawer(
                            icon: Icons.search,
                            title: "Search",
                            index: 4,
                            selectedIndex: _selectedIndex,
                            onTap: _handleDrawerTap,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 3,
                        height: 180,
                      ),
                    ],
                  ),
                ),
                AppDrawer(
                  icon: Icons.settings,
                  title: "Setting",
                  index: 5,
                  selectedIndex: _selectedIndex,
                  onTap: _handleDrawerTap,
                ),
                AppDrawer(
                  icon: Icons.help_outline_outlined,
                  title: "Help",
                  index: 6,
                  selectedIndex: _selectedIndex,
                  onTap: _handleDrawerTap,
                ),
                AppDrawer(
                  icon: Icons.login_outlined,
                  title: "Logout",
                  index: 7,
                  selectedIndex: _selectedIndex,
                  onTap: _handleDrawerTap,
                ),
              ],
            ),
          ),
          // 1st Column
          TransactionPart(),

          // 2nd Column
          WalletPart(),

          // 3rd Column
          ReceiptsPart(),
        ],
      ),
    );
  }
}

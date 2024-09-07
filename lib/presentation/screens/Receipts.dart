import 'package:flutter/material.dart';

class ReceiptsPart extends StatefulWidget {
  const ReceiptsPart({super.key});

  @override
  State<ReceiptsPart> createState() => _ReceiptsPartState();
}

class _ReceiptsPartState extends State<ReceiptsPart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.only(bottom: 55),
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
            color: const Color(0xFFF1F5FB),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Payable Account",
                    style: TextStyle(fontSize: 20, color: Color(0xFF333E52)),
                  ),
                  const Text(
                    "Keep your accounts up to date to avoid issues",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    textAlign: TextAlign.start,
                    '14 OUT OF 16',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(50),
                    value: 0.7,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFF252525),
                    minHeight: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Receipts",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF333E52),
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.call_made_outlined,
                      color: Colors.red,
                    ),
                    title: Text("\$ 5,000.00"),
                    subtitle: Text("Salary"),
                  ),
                  ListTile(
                    leading: Icon(Icons.call_made_outlined),
                    title: Text("\$ 5,000.00"),
                    subtitle: Text("Salary"),
                  ),
                  ListTile(
                    leading: Icon(Icons.call_made_outlined),
                    title: Text("\$ 5,000.00"),
                    subtitle: Text("Salary"),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payables",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF333E52),
                        fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.receipt_outlined),
                    title: Text("\$ 202.98"),
                    subtitle: Text("Salary"),
                  ),
                  ListTile(
                    leading: Icon(Icons.receipt_outlined),
                    title: Text("\$ 3030.00"),
                    subtitle: Text("Utility Bills"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

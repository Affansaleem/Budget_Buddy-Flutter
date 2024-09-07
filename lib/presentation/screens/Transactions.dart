import 'package:flutter/material.dart';

class TransactionPart extends StatefulWidget {
  const TransactionPart({super.key});

  @override
  State<TransactionPart> createState() => _TransactionPartState();
}

class _TransactionPartState extends State<TransactionPart> {
  bool _isHovered = false;
  final List<String> entries = <String>['Shopping', 'Grocery', 'Fuel', 'Online Purchases', 'Bills', 'BrainTel', 'Spotify'];
  final List<String> dates = <String>['Jan 25', 'Feb 14', '10 Mar', '10 Apr', '6 May', '7 Jun', '1 July'];
  final List<int> amounts = <int>[300, 350, 400, 450, 500, 550, 600];
  void _onHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            filled: true,
            prefixIcon: const Icon(Icons.search),
            fillColor: Colors.grey[200],
          ),
        ),
        const SizedBox(height: 20,),
        const Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 28),
        ),
        MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            // Smooth animation curve
            transform: _isHovered
                ? Matrix4.translationValues(0, -5, 0)
                : Matrix4.identity(),
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(_isHovered ? 0.7 : 0.5),
                  spreadRadius: _isHovered ? 8 : 5,
                  blurRadius: _isHovered ? 12 : 7,
                  offset: Offset(0, _isHovered ? 5 : 3),
                ),
              ],
              color: const Color(0xFFCDDEFB),
              borderRadius: BorderRadius.circular(20),
            ),
            duration: const Duration(milliseconds: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "5328 4388 4161 8183",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Affan Saleem",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        Text("13/31",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                      ],
                    ),
                    Image.asset(
                      "assets/icons/img_1.png",
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5FB),
            borderRadius: BorderRadius.circular(30),
          ),
          height: 600,
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder:(BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.call_received),
                title: Text(entries[index]),
                subtitle: Text(dates[index]),
                trailing: Text("R\$${amounts[index]}"),
              );

            }, separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        )
      ],
    );
  }
}

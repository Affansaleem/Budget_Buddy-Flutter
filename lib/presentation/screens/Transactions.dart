import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shimmer/shimmer.dart';

class TransactionPart extends StatefulWidget {
  const TransactionPart({super.key});

  @override
  State<TransactionPart> createState() => _TransactionPartState();
}

class _TransactionPartState extends State<TransactionPart> {
  bool _isHovered = false;
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> profiles = [];
  final supabase = Supabase.instance.client;
  bool _isLoading = true; // Add a loading state

  void _onHover(bool hovering) {
    setState(() {
      _isHovered = hovering;
    });
  }

  Future<void> _fetchProfileData() async {
    final response = await supabase.from('profile').select();
    setState(() {
      profiles = List<Map<String, dynamic>>.from(response as List);
      _isLoading = false;
    });
  }

  Future<void> _fetchTransactionsData() async {
    final response = await supabase.from('expenses').select();
    setState(() {
      data = List<Map<String, dynamic>>.from(response as List);
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchTransactionsData();
    _fetchProfileData();
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
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 28),
        ),
        _isLoading
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: MouseRegion(
                  onEnter: (_) => _onHover(true),
                  onExit: (_) => _onHover(false),
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    transform: _isHovered
                        ? Matrix4.translationValues(0, -5, 0)
                        : Matrix4.identity(),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    padding: const EdgeInsets.all(20),
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.grey.withOpacity(_isHovered ? 0.7 : 0.5),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16)),
                                Text("13/31",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14)),
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
              )
            : MouseRegion(
                onEnter: (_) => _onHover(true),
                onExit: (_) => _onHover(false),
                child: AnimatedContainer(
                  curve: Curves.easeInOut,
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
                       Text(
                        profiles[0]['cardno'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profiles[0]['name'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16)),
                              Text(profiles[0]['creationDate'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14)),
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
          child: _isLoading
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: const Icon(Icons.call_received),
                        title: Container(
                          color: Colors.grey.shade300,
                          height: 16,
                          width: double.infinity,
                        ),
                        subtitle: Container(
                          color: Colors.grey.shade300,
                          height: 14,
                          width: double.infinity,
                        ),
                        trailing: Container(
                          color: Colors.grey.shade300,
                          height: 16,
                          width: 60,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item =
                        data[index]; // Get the item directly from the data list
                    return ListTile(
                      leading: const Icon(Icons.call_received),
                      title: Text(item['title'] ?? 'Unknown'),
                      // Safely handle null values
                      subtitle: Text(item['created_at'] != null
                          ? DateTime.parse(item['created_at'])
                              .toLocal()
                              .toString()
                          : 'Unknown'),
                      trailing: Text("R\$${item['amount'] ?? 0}"),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
        ),
      ],
    );
  }
}

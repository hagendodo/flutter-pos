import 'package:flutter/material.dart';
import 'package:flutter_pos_app/main.dart';
import 'components/topmenu.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  double totalValue = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          TopMenuWidget(
            title: 'POS BENSU',
            subTitle: 'Cabang ABC',
            action: Container(),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _itemOrder(
                  image: 'items/1.png',
                  title: 'Orginal Burger',
                  qty: '2',
                  price: 5.99,
                ),
                _itemOrder(
                  image: 'items/2.png',
                  title: 'Double Burger',
                  qty: '3',
                  price: 10.99,
                ),
                _itemOrder(
                  image: 'items/6.png',
                  title: 'Special Black Burger',
                  qty: '2',
                  price: 8.00,
                ),
                _itemOrder(
                  image: 'items/4.png',
                  title: 'Special Cheese Burger',
                  qty: '2',
                  price: 12.99,
                ),
                _itemOrder(
                  image: 'items/4.png',
                  title: 'Special Cheese Burger',
                  qty: '2',
                  price: 12.99,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemOrder({
    required String image,
    required String title,
    required String qty,
    required double price,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Color.fromARGB(255, 54, 54, 59),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kode Beli : XXX",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Tanggal: 15-06-2023",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white54,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Atas Nama $title',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Rp $price',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage(
                            movePage: "DetailHistory",
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepOrange,
              ),
              child: Row(
                children: [
                  Icon(Icons.menu, color: Colors.white), // Delete icon
                  // Some spacing between the icon and text
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pos_app/main.dart';
import 'components/topmenu.dart';

class DetailHistory extends StatefulWidget {
  const DetailHistory({super.key});

  @override
  State<DetailHistory> createState() => _DetailHistoryState();
}

class _DetailHistoryState extends State<DetailHistory> {
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
            action: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPage(
                              movePage: "History",
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange, // Button color
                ),
                child: const Row(
                  children: [
                    Text(
                      "Kembali",
                      selectionColor: Colors.white,
                    )
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color(0xff1f2029),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0, -1), // Negative y offset for top shadow
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Atas Nama Siapa',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kode Beli',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'XXXX',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      '15-06-2023',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total (PPN 10%)',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'Rp ${totalValue.toStringAsFixed(2)}', // Format the total value as needed
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Rp $price',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'X $qty',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

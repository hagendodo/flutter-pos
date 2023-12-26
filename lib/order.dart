import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'components/topmenu.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  double totalValue = 0;

  void updateTotal(val, price) {
    try {
      double parsedValue = double.parse(val);
      double parsedPrice = double.parse(price);

      setState(() {
        totalValue = totalValue + (parsedValue * parsedPrice);
      });
    } catch (e) {
      print("Error parsing string to double: $e");
      // Handle the error accordingly, you might want to show a message or log it
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          TopMenuWidget(
            title: 'Point Of Sale',
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(137, 92, 92, 92),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 6, left: 12),
                      hintText: 'Atas Nama',
                      hintStyle:
                          const TextStyle(color: Colors.white54, fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.white), // Set white border
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 2,
                  width: double.infinity,
                  color: Colors.white,
                ),
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
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SizedBox(width: 6), Text('Pesan')],
                  ),
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
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
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
                const SizedBox(height: 10),
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
            decoration: BoxDecoration(
              color: Colors.white, // Set the background color to white
              borderRadius: BorderRadius.circular(
                  8), // Adjust the border radius as needed
            ),
            child: InputQty(
              maxVal: 10,
              initVal: 0,
              minVal: 0,
              steps: 1,
              onQtyChanged: (val) {
                updateTotal(val.toString(), price.toString());
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_pos_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1200;
    bool isPC = MediaQuery.of(context).size.width >= 1200;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 20,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: _topMenu(
                  title: 'Point Of Sale',
                  subTitle: 'Cabang X',
                  action: _search(),
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: isMobile ? 2 : 3,
                  childAspectRatio: isPC ? (2 / 1.4) : (1 / 1.4),
                  children: [
                    _item(
                      image: 'items/1.png',
                      title: 'Original Burger',
                      price: 'Rp 5.99',
                      item: '11 item',
                    ),
                    _item(
                      image: 'items/2.png',
                      title: 'Double Burger',
                      price: 'Rp 10.99',
                      item: '10 item',
                    ),
                    _item(
                      image: 'items/3.png',
                      title: 'Cheese Burger',
                      price: 'Rp 6.99',
                      item: '7 item',
                    ),
                    _item(
                      image: 'items/4.png',
                      title: 'Double Cheese Burger',
                      price: 'Rp 12.99',
                      item: '20 item',
                    ),
                    _item(
                      image: 'items/5.png',
                      title: 'Spicy Burger',
                      price: 'Rp 7.39',
                      item: '12 item',
                    ),
                    _item(
                      image: 'items/6.png',
                      title: 'Special Black Burger',
                      price: 'Rp 7.39',
                      item: '39 item',
                    ),
                    _item(
                      image: 'items/7.png',
                      title: 'Special Cheese Burger',
                      price: 'Rp 8.00',
                      item: '2 item',
                    ),
                    _item(
                      image: 'items/8.png',
                      title: 'Jumbo Cheese Burger',
                      price: 'Rp 15.99',
                      item: '2 item',
                    ),
                    _item(
                      image: 'items/9.png',
                      title: 'Spicy Burger',
                      price: 'Rp 7.39',
                      item: '12 item',
                    ),
                    _item(
                      image: 'items/10.png',
                      title: 'Special Black Burger',
                      price: 'Rp 7.39',
                      item: '39 item',
                    ),
                    _item(
                      image: 'items/11.png',
                      title: 'Special Cheese Burger',
                      price: 'Rp 8.00',
                      item: '2 item',
                    ),
                    _item(
                      image: 'items/12.png',
                      title: 'Jumbo Cheese Burger',
                      price: 'Rp 15.99',
                      item: '2 item',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
      ],
    );
  }

  Widget _item({
    required String image,
    required String title,
    required String price,
    required String item,
    VoidCallback? onAddToCart, // Callback function for the button press
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 20, bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
                ),
              ),
              Text(
                item,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                                  movePage: "FormMenu",
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.deepOrange,
                            width: 2), // Border color and width
                        borderRadius: BorderRadius.circular(8), // Border radius
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: Colors.deepOrange), // Edit icon
                      ],
                    ),
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                    onPressed: () {
                      // Show a confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmation'),
                            content: Text('Are you sure you want to delete?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Close the dialog
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Add your logic for delete here
                                  // ...

                                  // Close the dialog
                                  Navigator.pop(context);
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange, // Button color
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.white), // Delete icon
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _topMenu({
    required String title,
    required String subTitle,
    required Widget action,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
        Expanded(flex: 5, child: action),
      ],
    );
  }

  Widget _search() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white54,
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white54, fontSize: 11),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 6),
                hintText: 'Cari Menu',
                hintStyle: TextStyle(color: Colors.white54, fontSize: 11),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

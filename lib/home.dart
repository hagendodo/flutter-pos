import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_app/main.dart';
import 'package:flutter_pos_app/services/format_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio dio = Dio();
  List<Widget> menuItems = [];

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1200;
    bool isPC = MediaQuery.of(context).size.width >= 1200;

    return FutureBuilder(
      future: fetchData(), // Assuming fetchData returns a Future<List<dynamic>>
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: MediaQuery.of(context).size.height,
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
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
                          children: menuItems),
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          );
        }
      },
    );
  }

  Future<void> fetchData() async {
    try {
      // Make a GET request using Dio
      Response response = await dio.get('http://localhost:3000/api/items');

      // Assuming the response data is a list of menu items
      List<dynamic> responseData = response.data;

      // Create _item widgets based on the fetched data
      menuItems = responseData.map((itemData) {
        return _item(
          image: itemData['image'],
          title: itemData['title'],
          price: itemData['price'],
        );
      }).toList();
    } catch (error) {
      // Handle the error
      print('Error fetching data: $error');
    }
  }

  Widget _item({
    required String image,
    required String title,
    required String price,
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
                image:
                    NetworkImage(image), // Replace with your actual image URL
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
                formatCurrency(double.parse(price)),
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20,
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
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.deepOrange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Colors.deepOrange),
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
                                Navigator.pop(context);
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
                    primary: Colors.deepOrange,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.white),
                    ],
                  ),
                )
              ],
            ),
          ),
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

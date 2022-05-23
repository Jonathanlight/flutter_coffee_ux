import 'package:app/utils/coffee_card.dart';
import 'package:app/utils/coffee_second_card.dart';
import 'package:app/utils/coffee_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeTitle = [
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['The', false],
    ['Anglais', false],
  ];

  void coffeeSelect(int index) {
    setState(() {
      for (var i = 0; i < coffeeTitle.length; i++) {
        coffeeTitle[i][1] = false;
      }

      coffeeTitle[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.grid_view_rounded,
            color: Colors.grey,
          ),
          enableFeedback: false,
          color: Colors.grey[900],
          onPressed: null,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/image/profil.webp',
              width: 35,
              height: 35,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Start the day with great taste',
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              autocorrect: false,
              decoration: InputDecoration(
                fillColor: Colors.grey[800],
                filled: true,
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                prefixIconColor: Colors.white,
                prefixStyle: const TextStyle(color: Colors.white),
                hintText: 'Find your coffee .',
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTitle.length,
                  itemBuilder: (context, index) {
                    return CoffeeTitle(
                      isSelected: coffeeTitle[index][1],
                      coffeeType: coffeeTitle[index][0],
                      onTap: () {
                        coffeeSelect(index);
                      },
                    );
                  }),
            ),
          ),
          const SizedBox(height: 1.0),
          SizedBox(
            height: 310,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeCard(
                  coffeeImagePath: 'assets/image/coffee_1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '5.75',
                ),
                CoffeeCard(
                  coffeeImagePath: 'assets/image/coffee_3.jpeg',
                  coffeeName: 'Black',
                  coffeePrice: '6.75',
                ),
                CoffeeCard(
                  coffeeImagePath: 'assets/image/coffee_2.jpeg',
                  coffeeName: 'Latte',
                  coffeePrice: '3.75',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Special for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.coffee_maker,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeSecondCard(
                  coffeeImagePath: 'assets/image/coffee_3.jpeg',
                  coffeeName: 'Black',
                  coffeePrice: '6.75',
                ),
                CoffeeSecondCard(
                  coffeeImagePath: 'assets/image/coffee_1.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '5.75',
                ),
                CoffeeSecondCard(
                  coffeeImagePath: 'assets/image/coffee_2.jpeg',
                  coffeeName: 'Latte',
                  coffeePrice: '3.75',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

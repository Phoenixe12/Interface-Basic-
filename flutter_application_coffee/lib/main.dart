import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.black, secondary: Colors.white),
        useMaterial3: true,
      ),
      home: const Coffee(title: 'Coffee Shop'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Coffee extends StatelessWidget {
  final String title;
  const Coffee({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_sharp, color: Colors.white),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Ajout du défilement vertical global
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.black,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Bilzen, Belgium',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(Icons.expand_more,
                              color: Colors.white, size: 20),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 260,
                              height: 50,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.3),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Search coffee',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 241, 140, 77)
                                    .withOpacity(0.8),
                              ),
                              child: Icon(Icons.tune, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 165),
                  width: MediaQuery.of(context).size.width * 10,
                  height: 200,
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/coffee4.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 20), // Espacement supplémentaire entre les sections

            // Liste horizontale
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoixCoeffee('All Coffee'),
                  ChoixCoeffee('Espresso'),
                  ChoixCoeffee('Cappuccino'),
                  ChoixCoeffee('Latte'),
                  ChoixCoeffee('Mocha'),
                  ChoixCoeffee('Macchiato'),
                  ChoixCoeffee('Americano'),
                ],
              ),
            ),

            const SizedBox(height: 20), // Espacement supplémentaire

            // Liste verticale des cartes de café
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                CoffeeCard(
                  title:'Flat White', 
                  name: 'Espresso',
                  url: 'coffee-2306471_1280',
                  
                  context: context,
                    price:'5.00', 
                ),
                CoffeeCard(
                     title:'Espresso', 
                  name: 'Cappuccino',
                  url: 'coffee-4159024_1280',
                  context: context,
                    price:'5.00', 
                ),
                CoffeeCard(
                     title:'Cappuccino', 
                  name: 'Latte',
                  url: 'coffee-5086398_1280',
                price: '5.00',
                  context: context,
                ),
                CoffeeCard(
                     title:'Latte' ,
                     price: '5.00',
                  name: 'Mocha',
                  url: 'coffee-7292250_1280',
                  context: context,
                ),
                CoffeeCard(
                     title:'Mocha', 
                  name: 'Macchiato',
                  url: 'nathan-dumlao-r-KfktlyBL0-unsplash',
                  context: context,
                    price:'5.00', 
                ),
                CoffeeCard(
                     title:'Macchiato', 
                  name: 'Americano',
                  url: 'coffee-7561288_1280',
                  context: context,
                    price:'5.00', 
                ),
               
              ],
            ),
          ],
        ),
      ),

    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.shopping_cart, color: Colors.white),
      backgroundColor:  const Color.fromARGB(255, 241, 140, 77).withOpacity(0.8),
    ),

    
     bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
     
        selectedItemColor: Colors.amber[800],
       
      ),
    
    );
  }

  Container ChoixCoeffee(String title) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 154, 154, 154).withOpacity(0.1),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Color.fromARGB(255, 40, 40, 40),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Container CoffeeCard({
    required String name,
    required String url,
    required String title,
    required String price,
 
    required BuildContext context,
  }) {
    double sizeWidth = 150;
    double sizeHeigth = 150;
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
    height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 154, 154, 154).withOpacity(0.2),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: sizeWidth,
            height: sizeHeigth,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/$url.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Text(
            name,
            style: const TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Color.fromARGB(255, 40, 40, 40),
              fontSize: 16,
              
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               
              Text(
                '$price €',
                style: const TextStyle(
                  color: Color.fromARGB(255, 40, 40, 40),
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      const Color.fromARGB(255, 241, 140, 77).withOpacity(0.8),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}

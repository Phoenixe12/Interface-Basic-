import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bugger application',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,

      ),
      home: const BuggerApp(title: 'Burger Queen'),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}

class BuggerApp extends StatelessWidget {
  final String title;
  const BuggerApp({super.key, required this.title});

  final TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.brown,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: titleStyle),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(Icons.token),
        actions: const [
          Icon(Icons.person),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //section restaurant le plus proche
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 150,
              child: Center(
                child: Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const Text('Mon restaurant le plus proche',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const Spacer(),
                            Text(
                              "4 Kms",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white),
                              Text(
                                'Commander',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //Section en ce moment
            sectionTitle(title: "En ce moment"),
            Center(
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/layer-burger.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'une petite faim ?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Venez personnaliser votre burger",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            sectionTitle(title: "Chaud devant !"),
            Container(
              margin: EdgeInsets.all(8),
              child: const Text("Le meilleur de nos burgers a portee de clic",
                  style: TextStyle(
                    color: Colors.black54,
                  )),
            ),

            SizedBox(
              height: 250,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    burgerCard(
                      name: "Tiwins",
                      url: "twins",
                      description: "Le Burger des jumeaux qui font la paire",
                    ),
                    burgerCard(
                      name: "Big Queen",
                      url: "big-queen",
                      description:
                          "Pour celles qui portent la couronne a la maison",
                    ),
                    burgerCard(
                      name: "Egg Bacon",
                      url: "egg-bacon-burger",
                      description: "Le burger qui vous met l'eau a la bouche",
                    ),
                    burgerCard(
                      name: "Prince",
                      url: "prince",
                      description: "Le preféré des futurs rois",
                    ),
                    burgerCard(
                      name: "Cheese",
                      url: "twins",
                      description: "Le classique pour les fans de fromage",
                    ),
                  ],
                ),
              ),
            ),

            //Section accompagenement
            sectionTitle(title: "Les accompagnements"),
            Card(
              elevation: 8,
              child: Column(
                children: [
                  sideDish(name: "Frites classique", url: "fries"),
                  sideDish(name: "Frites de patate douce", url: "patate-douce"),
                  sideDish(name: "Poutine", url: "poutine"),
                  sideDish(name: "Potaroes", url: "potatoes"),
                ],
              ),
            ),

            //Section Boisson
            sectionTitle(title: "une petite soif ?"),
            Container(
              color: Theme.of(context).colorScheme.inversePrimary,
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    drinkCard(name: "Le classique", url: "classic-cola"),
                    drinkCard(name: "Eau gazeuse", url: "sparkling"),
                    drinkCard(name: "A l'orange", url: "orange-soda"),
                    drinkCard(name: "Gout fraise", url: "strawberry-soda"),
                  ],
                ),
              ),
            ),
            sectionTitle(title: "Pour finir une petite touche sucrée"),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                douceur(
                    name: "Glace Oreo",
                    url: "oreo-ice",
                    size: MediaQuery.of(context).size.width * 0.4,
                    context: context),
                douceur(
                    name: "Crepe Fraise",
                    url: "strawberry-waffle",
                    size: MediaQuery.of(context).size.width * 0.4,
                    context: context),
                douceur(
                    name: "Donut",
                    url: "donut",
                    size: MediaQuery.of(context).size.width * 0.4,
                    context: context),
                douceur(
                    name: "Cupcake",
                    url: "cupcake",
                    size: MediaQuery.of(context).size.width * 0.4,
                    context: context),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: sectionTitle(title: "Et bon appétit"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

//=======================================================
//Les widgets et methodes utilitaires
//=======================================================

  sectionTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8),
      child: Text(
        title,
        style: titleStyle,
      ),
    );
  }

  Container burgerCard({
    required String name,
    required String url,
    required String description,
  }) {
    double size = 180;

    TextStyle descriptionStyle = const TextStyle(
      fontStyle: FontStyle.italic,
      color: Colors.black54,
    );

    return Container(
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.pink.withOpacity(0.3),
      ),
      height: size,
      width: size,
      child: Column(
        children: [
          Image.asset(
            "assets/images/$url.jpg",
            height: size * 0.6,
            width: size,
            fit: BoxFit.cover,
          ),
          Text(
            name,
            style: titleStyle,
          ),
          Text(
            description,
            style: descriptionStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container sideDish({required String name, required String url}) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/$url.jpg"),
                radius: 32,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Divider(
            indent: 8,
            endIndent: 8,
          ),
        ],
      ),
    );
  }

  Container drinkCard({required String name, required String url}) {
    const double height = 250;
    const double width = 150;

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/$url.jpg",
              height: height, width: width, fit: BoxFit.cover),
          Text(
            name,
            style: titleStyle.copyWith(
                color: const Color.fromARGB(255, 177, 11, 11)),
          ),
        ],
      ),
    );
  }

  Container douceur({
    required String name,
    required String url,
    required double size,
    required BuildContext context,
  }) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/$url.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            name,
            style: titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

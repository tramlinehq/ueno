import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ueno aesthetic',
      theme: ThemeData(
        fontFamily: 'NotoSerifJP',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(body: Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border =
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));

    const paddingGrids = EdgeInsets.all(10.0);
    const paddingTitle = EdgeInsets.symmetric(vertical: 50.0);

    const stations = [
      ["池袋", "Ikebukuro"],
      ["大塚", "Ōtsuka"],
      ["巣鴨", "Sugamo"],
      ["駒込", "Komagome"],
      ["田端", "Tabata"],
      ["西日暮里", "Nishi-Nippori"],
      ["日暮里", "Nippori"],
      ["鶯谷", "Uguisudani"],
      ["上野", "Ueno"],
      ["御徒町", "Okachimachi"],
      ["秋葉原", "Akihabara"],
      ["神田", "Kanda"],
      ["高田馬場", "Takadanobaba"],
      ["目白", "Mejiro"],
      ["東京", "Tōkyō"],
      ["有楽町", "Yūrakuchō"],
      ["新橋", "Shimbashi"],
      ["浜松町", "Hamamatsuchō"],
      ["田町", "Tamachi"],
      ["品川", "Shinagawa"],
      ["大崎", "Ōsaki"],
      ["五反田", "Gotanda"],
      ["目黒", "Meguro"],
      ["恵比寿", "Ebisu"],
      ["渋谷", "Shibuya"],
      ["原宿", "Harajuku"],
      ["代々木", "Yoyogi"],
      ["新宿", "Shinjuku"],
      ["新大久保", "Shin-Ōkubo"]
    ];

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Color(0xffF23030),
              Color(0xffF26241),
              Color(0xff025159),
              Color(0xff024959),
            ])),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Padding(
              padding: paddingTitle,
              child: Text("~ ueno (上野) aesthetic ~",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28))),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(1.0),
                  children: <Widget>[
                for (var station in stations)
                  Padding(
                      padding: paddingGrids,
                      child: Card(
                          color: const Color(0xffF29E6D),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(station[0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18)),
                                Text(station[1],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 18))
                              ])))
              ]))
        ]));
  }
}

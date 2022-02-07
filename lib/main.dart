import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  Home createState() => Home();
}

class Home extends State {
  late AudioPlayer player;
  String versionString = "";

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    setVersionString();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void setVersionString() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;
      versionString = version + " • " + buildNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    const paddingGrids = EdgeInsets.all(10.0);
    const paddingHeader = EdgeInsets.symmetric(vertical: 50.0);
    const paddingFooter = EdgeInsets.symmetric(vertical: 5.0);

    // japanese, english, mp3-name, color
    const stations = [
      ["品川", "Shinagawa", "shinagawa"],
      ["大崎", "Ōsaki", "osaki"],
      ["五反田", "Gotanda", "gotanda"],
      ["目黒", "Meguro", "meguro"],
      ["恵比寿", "Ebisu", "ebisu"],
      ["渋谷", "Shibuya", "shibuya"],
      ["原宿", "Harajuku", "harajuku"],
      ["代々木", "Yoyogi", "yoyogi"],
      ["新宿", "Shinjuku", "shinjuku"],
      ["新大久保", "Shin-Ōkubo", "shinokubo"],
      ["高田馬場", "Takadanobaba", "takadanobaba"],
      ["目白", "Mejiro", "mejiro"],
      ["池袋", "Ikebukuro", "ikebukuro"],
      ["大塚", "Ōtsuka", "otsuka"],
      ["巣鴨", "Sugamo", "sugamo"],
      ["駒込", "Komagome", "seseragi"],
      ["田端", "Tabata", "tabata"],
      ["西日暮里", "Nishi-Nippori", "nishinipori"],
      ["日暮里", "Nippori", "nippori"],
      ["鶯谷", "Uguisudani", "uguisudani"],
      ["上野", "Ueno", "ueno"],
      ["御徒町", "Okachimachi", "okachimachi"],
      ["秋葉原", "Akihabara", "akihabara"],
      ["神田", "Kanda", "kanda"],
      ["東京", "Tōkyō", "tokyo"],
      ["有楽町", "Yūrakuchō", "jr-sh2"],
      ["新橋", "Shimbashi", "shimbashi"],
      ["浜松町", "Hamamatsuchō", "hamamatsucho"],
      ["田町", "Tamachi", "tamachi"],
      ["高輪ゲートウェイ", "Takanawa Gateway", "tokyo"],
    ];

    return MaterialApp(
        title: 'ueno aesthetic',
        theme: ThemeData(
          fontFamily: 'NotoSerifJP',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            body: Container(
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: paddingHeader,
                          child: Text("~ ueno (上野) aesthetic ~",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 30))),
                      Expanded(
                          child: GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(10.0),
                              children: <Widget>[
                            for (var station in stations)
                              Padding(
                                  padding: paddingGrids,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color(0xffBF634E),
                                        onPrimary: Colors.black,
                                      ),
                                      onPressed: () async {
                                        await player.setAsset('assets/media/' +
                                            station[2] +
                                            '.mp3');
                                        player.play();
                                      },
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(station[0],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 15)),
                                            Text(station[1],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16))
                                          ])))
                          ])),
                      Padding(
                          padding: paddingFooter,
                          child: Text(versionString,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15)))
                    ]))));
  }
}

import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/cupertino.dart';
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

CupertinoDynamicColor bgColor() {
  return const CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.extraLightBackgroundGray,
    darkColor: CupertinoColors.black,
  );
}

CupertinoDynamicColor textBgColor() {
  return const CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.black,
    darkColor: CupertinoColors.white,
  );
}

CupertinoDynamicColor textColor() {
  return const CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.white,
    darkColor: CupertinoColors.black,
  );
}

const title = "~ ueno (上野) aesthetic ~ ";

// japanese, english, asset-name
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
  ["西日暮里", "Nishi-Nippori", "nishinippori"],
  ["日暮里", "Nippori", "nippori"],
  ["鶯谷", "Uguisudani", "uguisudani"],
  ["上野", "Ueno", "ueno"],
  ["御徒町", "Okachimachi", "okachimachi"],
  ["秋葉原", "Akihabara", "akihabara"],
  ["神田", "Kanda", "kanda"],
  ["東京", "Tōkyō", "tokyo"],
  ["有楽町", "Yūrakuchō", "yurakucho"],
  ["新橋", "Shimbashi", "shimbashi"],
  ["浜松町", "Hamamatsuchō", "hamamatsucho"],
  ["田町", "Tamachi", "tamachi"],
  ["高輪ゲートウェイ", "Takanawa Gateway", "tokyo"],
];

class Home extends State {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: title,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          scaffoldBackgroundColor: bgColor(),
          textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                  fontFamily: "Raleway",
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  backgroundColor: textBgColor()))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final paddingHeader = const EdgeInsets.only(top: 20, bottom: 20);
  late AudioPlayer player;
  var _setPlayingIndex = -1;
  String _versionString = "";

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    initVersion();
  }

  initVersion() {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      String version = packageInfo.version;
      String buildNumber = packageInfo.buildNumber;

      setState(() {
        _versionString = "build version • $version • $buildNumber";
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Padding(
                  padding: paddingHeader,
                  child: Text(title,
                      style: TextStyle(
                          backgroundColor: textBgColor(),
                          color: textColor(),
                          fontWeight: FontWeight.w500,
                          fontSize: 30))),
              Padding(padding: const EdgeInsets.only(bottom: 20),
                child:
                Column(children: [
                  Text("swipe right to play station audio, swipe left to stop",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          backgroundColor: bgColor(),
                          color: textBgColor())),
                  Text(_versionString,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 12,
                          backgroundColor: bgColor(),
                          color: textBgColor())),
                ])),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width * 0.98,
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: SingleChildScrollView(
                  child: CupertinoListSection.insetGrouped(
                    backgroundColor: bgColor(),
                    children: [
                      ...List.generate(
                        stations.length,
                        (index) => GestureDetector(
                          onPanUpdate: (details) async {
                            onSwipe(details, index);
                          },
                          child: buildCupertinoFormRow(stations[index],
                              playing: _setPlayingIndex == index),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        )));
  }

  void onSwipe(details, index) async {
    // Left swipe
    if (details.delta.dx < 0) {
      setState(() {
        _setPlayingIndex = -1;
      });

      player.stop();
    }

    // Right swipe
    if (details.delta.dx > 0) {
      setState(() {
        _setPlayingIndex = index;
      });

      await player.setAsset('assets/media/${stations[index][2]}.mp3');

      player.playerStateStream.listen((playerState) {
        if (playerState.processingState == ProcessingState.completed) {
          setState(() {
            _setPlayingIndex = -1;
          });
        }
      });

      player.play();
    }
  }

  Widget buildCupertinoFormRow(stations, {bool playing = true}) {
    var stationNameEn = "${stations[1]}";
    var stationNameJp = stations[0];
    var coverImage = "assets/cover/${stations[2]}.jpg";

    return CupertinoListTile(
        title: DropShadow(
            blurRadius: 1,
            borderRadius: 5,
            spread: 1,
            offset: const Offset(0.0, 1.0),
            child: Image.asset(coverImage, width: 150.0)),
        padding: const EdgeInsets.all(15.0),
        additionalInfo:
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(stationNameEn,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      backgroundColor: textBgColor(),
                      color: textColor()))),
          Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Text(stationNameJp,
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      backgroundColor: textBgColor(),
                      color: textColor()))),
          Visibility(
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              visible: playing,
              child: Text(" playing…",
                  style: TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.normal,
                      backgroundColor: textBgColor(),
                      color: textColor())))
        ]));
  }
}

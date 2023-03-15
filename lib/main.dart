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

// japanese, english, asset-name, distance from prev station, total distance, shinkansen pass-thru
const stations = [
  [
    "品川",
    "Shinagawa",
    "shinagawa",
    "0.9",
    "0.0",
    ["jrc"]
  ],
  ["大崎", "Ōsaki", "osaki", "2.0", "2.0", []],
  ["五反田", "Gotanda", "gotanda", "0.9", "2.9", []],
  ["目黒", "Meguro", "meguro", "1.2", "4.1", []],
  ["恵比寿", "Ebisu", "ebisu", "1.5", "5.6", []],
  ["渋谷", "Shibuya", "shibuya", "1.6", "7.2", []],
  ["原宿", "Harajuku", "harajuku", "1.2", "8.4", []],
  ["代々木", "Yoyogi", "yoyogi", "1.5", "9.9", []],
  ["新宿", "Shinjuku", "shinjuku", "0.7", "10.6", []],
  ["新大久保", "Shin-Ōkubo", "shinokubo", "1.3", "11.9", []],
  ["高田馬場", "Takadanobaba", "takadanobaba", "1.4", "13.3", []],
  ["目白", "Mejiro", "mejiro", "0.9", "14.2", []],
  ["池袋", "Ikebukuro", "ikebukuro", "1.2", "15.4", []],
  ["大塚", "Ōtsuka", "otsuka", "1.8", "17.2", []],
  ["巣鴨", "Sugamo", "sugamo", "1.1", "18.3", []],
  ["駒込", "Komagome", "seseragi", "0.7", "19.0", []],
  ["田端", "Tabata", "tabata", "1.6", "20.6", []],
  ["西日暮里", "Nishi-Nippori", "nishinippori", "0.8", "21.4", []],
  ["日暮里", "Nippori", "nippori", "0.5", "21.9", []],
  ["鶯谷", "Uguisudani", "uguisudani", "1.1", "23.0", []],
  [
    "上野",
    "Ueno",
    "ueno",
    "1.1",
    "24.1",
    ["jre", "jrh"]
  ],
  ["御徒町", "Okachimachi", "okachimachi", "0.6", "24.7", []],
  ["秋葉原", "Akihabara", "akihabara", "1.0", "25.7", []],
  ["神田", "Kanda", "kanda", "0.7", "26.4", []],
  [
    "東京",
    "Tōkyō",
    "tokyo",
    "1.3",
    "27.7",
    ["jrc", "jre", "jrh"]
  ],
  ["有楽町", "Yūrakuchō", "yurakucho", "0.8", "28.5", []],
  ["新橋", "Shimbashi", "shimbashi", "1.1", "29.6", []],
  ["浜松町", "Hamamatsuchō", "hamamatsucho", "1.2", "30.8", []],
  ["田町", "Tamachi", "tamachi", "1.5", "32.3", []],
  ["高輪ゲートウェイ", "Takanawa Gateway", "takanawagateway", "1.3", "33.6", []],
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
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(children: [
                Text("swipe right to play station audio, swipe left to stop",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 12,
                        backgroundColor: textBgColor(),
                        color: textColor())),
                Text(_versionString,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 12,
                        backgroundColor: textBgColor(),
                        color: textColor())),
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
                    (index) => buildCupertinoFormRow(stations[index], index,
                        playing: _setPlayingIndex == index),
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

  Widget buildCupertinoFormRow(station, index, {bool playing = true}) {
    var stationNameEn = station[1];
    var stationNameJp = station[0];
    var shinkansens = station[5];
    var totalDistanceCovered = "total covered – ${station[4]}kms";
    var coverImage = "assets/cover/${station[2]}.jpg";
    var prevStation = [];

    if (index == 0) {
      prevStation = stations[stations.length - 1];
    } else {
      prevStation = stations[index - 1];
    }

    var stationDistanceBetween = "from ${prevStation[1]} – ${station[3]}kms";

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanUpdate: (details) async {
        onSwipe(details, index);
      },
      child: CupertinoListTile(
          title: DropShadow(
              blurRadius: 1,
              borderRadius: 5,
              spread: 1,
              offset: const Offset(0.0, 1.0),
              child: Image.asset(coverImage, width: 150.0)),
          padding: const EdgeInsets.all(10.0),
          subtitle:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(stationDistanceBetween,
                    style: TextStyle(
                        fontSize: 11,
                        fontStyle: FontStyle.normal,
                        backgroundColor: textBgColor(),
                        color: textColor()))),
            Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(totalDistanceCovered,
                    style: TextStyle(
                        fontSize: 11,
                        fontStyle: FontStyle.normal,
                        backgroundColor: textBgColor(),
                        color: textColor())))
          ]),
          additionalInfo:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text(stationNameEn,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
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
            ...List.generate(
              shinkansens.length,
                  (index) => DropShadow(
                  blurRadius: 0.2,
                  borderRadius: 0,
                  spread: 1,
                  offset: const Offset(0.0, 1.0),
                  child: Image.asset(
                      "assets/misc/shinkansen/${shinkansens[index]}.png",
                      width: 25.0)),
            ),
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
          ])),
    );
  }
}

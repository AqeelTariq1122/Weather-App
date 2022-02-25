import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:weatherapp/Getx Notifier/Getx.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScreenOne extends StatelessWidget {
  ScreenOne({Key? key}) : super(key: key);

  WeatherData weatherData = Get.put(WeatherData());
  @override
  functiondata(var sta) {
    if (sta == WeatherStatus.loading) {
      return Text('$sta');
    }
    if (sta == WeatherStatus.loading) {
      return CircularProgressIndicator();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GetBuilder<WeatherData>(
        initState: (_) => weatherData.getWeatherData(),
        builder: (data) {
          if (data.status == WeatherStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (data.status == WeatherStatus.loaded) {
            return Container(
              // height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image:
                    AssetImage("backgrounds/${data.descriptionWallpaper}.png"),
                fit: BoxFit.fill,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            width: 170,
                            height: 200,
                            // color: Colors.pink,
                            margin: EdgeInsets.symmetric(
                                vertical: 50.0, horizontal: 30.0),
                            child: GlassContainer(
                              blur: 6,
                              shadowStrength: 5,
                              opacity: 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                      "http://openweathermap.org/img/wn/${data.icon}.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // Icon(
                                  //  data.icon,
                                  // ),

                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  Text(
                                    "Currently in ${data.cityName}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${data.temp.toString()}\u00B0",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${data.currently.toString()}",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.blue,
                      height: 200,
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                            width: 200,
                            child: CupertinoSearchTextField(
                              onSubmitted: (String city) {
                                weatherData.SearchWeatherData(city);
                              },
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 90,
                  // ),
                  Flexible(
                    flex: 3,
                    child: ClipPath(
                      clipper: WaveClipperTwo(reverse: true),
                      child: GlassContainer(
                        height: double.infinity,
                        blur: 0,
                        shadowStrength: 1,
                        opacity: 0.3,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                          // color: Colors.red,
                          child: Stack(
                            alignment: AlignmentDirectional.topStart,
                            children: [
                              // Container(
                              //   alignment: AlignmentDirectional.topStart,
                              //   child: Text(
                              //     " ", //Weater detail
                              //     style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 20,
                              //         fontWeight: FontWeight.bold),
                              //   ),
                              // ),
                              Container(
                                // color: Colors.blue,
                                height: 300,
                                // blur: 1,
                                // shadowStrength: 5,
                                // opacity: 0.2,
                                child: ListView(
                                  children: ListTile.divideTiles(
                                    context: context,
                                    tiles: [
                                      ListTile(
                                        textColor: Colors.white,
                                        iconColor: Colors.blue,
                                        leading: FaIcon(
                                          FontAwesomeIcons.temperatureHigh,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                        title: Text("Temprature"),
                                        trailing: Text("${data.temp}\u00B0"),
                                      ),
                                      ListTile(
                                        textColor: Colors.white,
                                        iconColor: Colors.blue,
                                        leading: FaIcon(
                                          FontAwesomeIcons.cloud,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                        title: Text("Weather"),
                                        trailing: Text("${data.description}"),
                                      ),
                                      ListTile(
                                        textColor: Colors.white,
                                        iconColor: Colors.blue,
                                        leading: FaIcon(
                                          FontAwesomeIcons.sun,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                        title: Text("Humidity"),
                                        trailing: Text("${data.humidity}"),
                                      ),
                                      ListTile(
                                        textColor: Colors.white,
                                        iconColor: Colors.blue,
                                        leading: FaIcon(
                                          FontAwesomeIcons.wind,
                                          color: Colors.blueGrey.shade800,
                                        ),
                                        title: Text("Wind Speed"),
                                        trailing: Text("${data.wind}"),
                                      ),
                                    ],
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          else return Container(
            // height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                  AssetImage("backgrounds/${data.descriptionWallpaper}.png"),
                  fit: BoxFit.fill,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: 170,
                          height: 200,
                          // color: Colors.pink,
                          margin: EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 30.0),
                          child: GlassContainer(
                            blur: 6,
                            shadowStrength: 5,
                            opacity: 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: Image.network(
                                    "http://openweathermap.org/img/wn/${data.icon}.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // Icon(
                                //  data.icon,
                                // ),

                                // SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  "Currently in ${data.cityName}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${data.temp.toString()}\u00B0",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${data.currently.toString()}",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade800,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    // color: Colors.blue,
                    height: 200,
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${data.errorMessage}", style: TextStyle(color: Colors.red.shade900,fontWeight: FontWeight.bold),),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 2, 0),
                          width: 200,
                          child: CupertinoSearchTextField(
                            onSubmitted: (String city) {
                              weatherData.SearchWeatherData(city);
                            },
                            padding: const EdgeInsets.all(8.0),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 90,
                // ),
                Flexible(
                  flex: 3,
                  child: ClipPath(
                    clipper: WaveClipperTwo(reverse: true),
                    child: GlassContainer(
                      height: double.infinity,
                      blur: 0,
                      shadowStrength: 1,
                      opacity: 0.3,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        // color: Colors.red,
                        child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            // Container(
                            //   alignment: AlignmentDirectional.topStart,
                            //   child: Text(
                            //     " ", //Weater detail
                            //     style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                            Container(
                              // color: Colors.blue,
                              height: 300,
                              // blur: 1,
                              // shadowStrength: 5,
                              // opacity: 0.2,
                              child: ListView(
                                children: ListTile.divideTiles(
                                  context: context,
                                  tiles: [
                                    ListTile(
                                      textColor: Colors.white,
                                      iconColor: Colors.blue,
                                      leading: FaIcon(
                                        FontAwesomeIcons.temperatureHigh,
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      title: Text("Temprature"),
                                      trailing: Text("${data.temp}\u00B0"),
                                    ),
                                    ListTile(
                                      textColor: Colors.white,
                                      iconColor: Colors.blue,
                                      leading: FaIcon(
                                        FontAwesomeIcons.cloud,
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      title: Text("Weather"),
                                      trailing: Text("${data.description}"),
                                    ),
                                    ListTile(
                                      textColor: Colors.white,
                                      iconColor: Colors.blue,
                                      leading: FaIcon(
                                        FontAwesomeIcons.sun,
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      title: Text("Humidity"),
                                      trailing: Text("${data.humidity}"),
                                    ),
                                    ListTile(
                                      textColor: Colors.white,
                                      iconColor: Colors.blue,
                                      leading: FaIcon(
                                        FontAwesomeIcons.wind,
                                        color: Colors.blueGrey.shade800,
                                      ),
                                      title: Text("Wind Speed"),
                                      trailing: Text("${data.wind}"),
                                    ),
                                  ],
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );

        },
      ),
    );
  }
}


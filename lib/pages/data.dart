// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:hp/app_color.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataState();
  }
}

class _DataState extends State<Data> {
  SharedPreferences? _prefs;
  String _data = '';
  late Map<int, String> _sessions;
  final List<String> _dates = [];
  final List<String> _sesh = [];
  int _totalMin = 0;
  int _longestSesh = 0;
  int _seshNum = 0;
  double _avgSesh = 0;

  @override
  void initState() {
    super.initState();
    _getPrefs();
  }

  void _getPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _data = _prefs!.getString('time')!;
      final split = _data.split('/');

      _sessions = {for (int i = 0; i < split.length; i++) i: split[i]};
      for (int i = 1; i < _sessions.length; i++) {
        _dates.add(_sessions[i]!.split(' ')[2]);
      }
      for (int i = 1; i < _sessions.length; i++) {
        _sesh.add(_sessions[i]!.split(' ')[1]);
        _totalMin += int.parse(_sessions[i]!.split(' ')[1]);
        _seshNum++;
        if (int.parse(_sessions[i]!.split(' ')[1]) > _longestSesh) {
          _longestSesh = int.parse(_sessions[i]!.split(' ')[1]);
        }
      }
      _avgSesh = _totalMin / _seshNum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        // padding: const EdgeInsets.all(20.0),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: AppColors.backgroundColor,
            title: const Text.rich(
              TextSpan(
                text: 'Data', // text for title
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontFamily: 'Arial',
                ),
              ),
            )),
        body: SizedBox(
            width: 600,
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 0,
                      ),
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.backgroundColor,
                          shadowColor: AppColors.primaryColor,
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.access_time_filled_outlined,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                ),
                                Text(_totalMin.toString(),
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial')),
                                const Text('total minutes',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'Arial',
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.backgroundColor,
                          shadowColor: AppColors.primaryColor,
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.emoji_events,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                ),
                                Text(_longestSesh.toString(),
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial')),
                                const Text('longest session',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'Arial',
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.backgroundColor,
                          shadowColor: AppColors.primaryColor,
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                ),
                                Text(_seshNum.toString(),
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial')),
                                const Text('number of sessions',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'Arial',
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          color: AppColors.backgroundColor,
                          shadowColor: AppColors.primaryColor,
                          elevation: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.bar_chart_rounded,
                                  color: AppColors.primaryColor,
                                  size: 50,
                                ),
                                Text(
                                    double.parse((_avgSesh).toStringAsFixed(2))
                                        .toString(),
                                    style: const TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Arial')),
                                const Text('avg session time',
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontSize: 12,
                                        fontFamily: 'Arial',
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

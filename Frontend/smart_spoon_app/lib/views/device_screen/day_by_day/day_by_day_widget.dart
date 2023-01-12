import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../models/data.dart';
import 'chart_widget.dart';
import 'daybyday_drop_down.dart';

class DayByDayWidget extends StatefulWidget {
  final List<Data> listData;
  const DayByDayWidget({Key? key, required this.listData}) : super(key: key);

  @override
  State<DayByDayWidget> createState() => _DayByDayWidgetState();
}

class _DayByDayWidgetState extends State<DayByDayWidget> {
  Data? data;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var _theme = Theme.of(context);
    data = data ?? widget.listData.first;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            DayByDayDropDown(
              list: widget.listData.map((e) => e.title).toList(),
              changeDate: (value) {
                // This is called when the user selects an item.
                // value return an index
                setState(
                  () {
                    data = widget.listData[value];
                  },
                );
              },
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid, width: 0),
                borderRadius: BorderRadius.circular(25),
                color: _theme.colorScheme.primary.withAlpha(100),
              ),
              child: Text(
                AppLocalizations.of(context)!.bites +
                    ": " +
                    data!.numberOfBites.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: _theme.colorScheme.onBackground,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Divider(
              thickness: 2,
              color: _theme.colorScheme.secondary.withAlpha(100),
              indent: size.width * 0.3,
              endIndent: size.width * 0.3,
            ),
            ChartWidget(
                data: data!.roll, title: AppLocalizations.of(context)!.roll),
            Divider(
              thickness: 2,
              color: _theme.colorScheme.secondary.withAlpha(100),
              indent: size.width * 0.3,
              endIndent: size.width * 0.3,
            ),
            ChartWidget(
                data: data!.pitch, title: AppLocalizations.of(context)!.pitch),
            SizedBox(
              height: size.height * 0.3,
            ),
          ],
        ),
      ),
    );
  }
}

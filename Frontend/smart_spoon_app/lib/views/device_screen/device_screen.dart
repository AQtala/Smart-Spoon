import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_spoon_app/blocs/data_cubit.dart';
import 'package:smart_spoon_app/blocs/data_state.dart';
import 'package:smart_spoon_app/enums/selection_enum.dart';
import 'package:smart_spoon_app/models/data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_spoon_app/views/device_screen/compare/compare_widget.dart';
import 'package:smart_spoon_app/views/device_screen/selection_drop_down.dart';
import 'day_by_day/day_by_day_widget.dart';

class DeviceScreen extends StatefulWidget {
  static String name = "/deviceScreen";
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Data? data;
  SelectionEnum selectionEnum = SelectionEnum.dayByDay;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final cubit = context.read<DataCubit>();
        cubit.fetchData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.demo_device),
        centerTitle: true,
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is InitDataState || state is LoadingDataState) {
            return Center(
              child: CircularProgressIndicator(
                color: _theme.colorScheme.secondary,
              ),
            );
          } else if (state is ErrorDataState) {
            return Center(
              child: Text(
                AppLocalizations.of(context)!.internet_error,
                style: TextStyle(
                  color: _theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is ResponseDataState) {
            state.data.sort(
              (a, b) => a.title.compareTo(b.title),
            );
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SelectionDropDown(
                  changeSelection: (value) {
                    setState(
                      () {
                        selectionEnum = value;
                      },
                    );
                  },
                ),
                SizedBox(
                  height: size.height * 0.8,
                  width: size.width,
                  child: selectionEnum == SelectionEnum.dayByDay
                      ? SingleChildScrollView(
                          child: DayByDayWidget(listData: state.data))
                      : CompareWidget(
                          selectionEnum: selectionEnum, listData: state.data),
                )
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: _theme.colorScheme.secondary,
            ),
          );
        },
      ),
    );
  }
}

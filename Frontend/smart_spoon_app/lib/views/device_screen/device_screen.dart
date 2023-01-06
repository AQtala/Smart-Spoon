import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_spoon_app/blocs/data_cubit.dart';
import 'package:smart_spoon_app/blocs/data_state.dart';
import 'package:smart_spoon_app/models/data.dart';
import 'package:smart_spoon_app/views/device_screen/chart_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smart_spoon_app/views/device_screen/drop_down_button.dart';

class DeviceScreen extends StatefulWidget {
  static String name = "/deviceScreen";
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Data? data;
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
    final Size size = MediaQuery.of(context).size;
    var _theme = Theme.of(context);
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
            data = data ?? state.data.first;
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
                    DropDownButton(
                      list: state.data.map((e) => e.title).toList(),
                      changeDate: (value) {
                        // This is called when the user selects an item.
                        // value return an index
                        setState(
                          () {
                            data = state.data[value];
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
                        data: data!.roll,
                        title: AppLocalizations.of(context)!.roll),
                    Divider(
                      thickness: 2,
                      color: _theme.colorScheme.secondary.withAlpha(100),
                      indent: size.width * 0.3,
                      endIndent: size.width * 0.3,
                    ),
                    ChartWidget(
                        data: data!.pitch,
                        title: AppLocalizations.of(context)!.pitch),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                  ],
                ),
              ),
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

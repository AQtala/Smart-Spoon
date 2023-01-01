import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_spoon_app/blocs/data_cubit.dart';
import 'package:smart_spoon_app/blocs/data_state.dart';
import 'package:smart_spoon_app/services/data_service.dart';
import 'package:smart_spoon_app/views/home_screen/home_screen_widgets/device_container_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DeviceScreen extends StatefulWidget {
  static String name = "/deviceScreen";
  const DeviceScreen({Key? key}) : super(key: key);

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<DataCubit>();
      cubit.fetchData();
    });
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
          }
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}

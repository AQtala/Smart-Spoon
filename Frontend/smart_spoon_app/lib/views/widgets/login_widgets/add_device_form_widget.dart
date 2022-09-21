import 'package:flutter/material.dart';
import 'package:smart_spoon_app/controllers/ThemeController/theme_constants.dart';

class AddDeviceFormWidget extends StatefulWidget {
  const AddDeviceFormWidget({Key? key}) : super(key: key);

  @override
  State<AddDeviceFormWidget> createState() => _AddDeviceFormWidgetState();
}

class _AddDeviceFormWidgetState extends State<AddDeviceFormWidget> {
  String _name = "";
  bool _isNameValid = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: _isNameValid ? COLOR_ACCENT : Colors.red),
      ),
      child: TextFormField(
        focusNode: _focusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Device Name",
          labelStyle:
              TextStyle(color: _isNameValid ? COLOR_ACCENT : Colors.red),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: COLOR_ACCENT,
        ),
        style: const TextStyle(fontSize: 18),
        cursorColor: Colors.grey,
        maxLines: 1,
        validator: (value) {
          if (value == null) {
            setState(() {
              _isNameValid = false;
            });
            _focusNode.unfocus();
            return "* Name is Required";
          } else if (value.trim().isEmpty) {
            setState(() {
              _isNameValid = false;
            });
            _focusNode.unfocus();
            return "* Name is Required";
          } else if (!_isNameValid) {
            setState(() {
              _isNameValid = true;
            });
            _focusNode.unfocus();
          }
          return null;
        },
        onSaved: (value) {
          _focusNode.unfocus();
          _name = value!;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 2,
                blurStyle: BlurStyle.outer,
                spreadRadius: 5),
          ]),
      margin: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNameField(),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    primary: COLOR_PRIMARY,
                    onPrimary: Colors.white,
                    elevation: 5,
                    shadowColor: COLOR_PRIMARY,
                    side: const BorderSide(color: COLOR_PRIMARY),
                    shape: const StadiumBorder(),
                    fixedSize: const Size(140, 60)),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

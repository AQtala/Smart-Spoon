import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: _isNameValid
                  ? const Color.fromARGB(255, 0, 207, 155)
                  : Colors.red)),
      child: TextFormField(
        focusNode: _focusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: "Device Name",
          labelStyle: TextStyle(
              color: _isNameValid
                  ? const Color.fromARGB(255, 0, 207, 155)
                  : Colors.red),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: const Color.fromARGB(255, 0, 207, 155),
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
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                blurRadius: 3,
                blurStyle: BlurStyle.outer,
                spreadRadius: 10),
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
                    primary: const Color.fromARGB(255, 0, 207, 155),
                    onPrimary: Colors.white,
                    elevation: 10,
                    shadowColor: const Color.fromARGB(255, 0, 207, 155),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 0, 207, 155)),
                    shape: const StadiumBorder(),
                    fixedSize: const Size(140, 60)),
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
                },
                child: const Text(
                  "Login",
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

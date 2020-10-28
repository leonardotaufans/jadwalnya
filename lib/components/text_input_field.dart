import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  const TextInputField({
    Key key,
    @required this.theme,
    @required this.hintText,
    @required this.prefixIcon,
    this.isPassword = false,
    this.onChanged,
    @required this.controller,
    this.inputAction,
    this.validator,
  }) : super(key: key);

  final ThemeData theme;
  final String hintText;
  final Icon prefixIcon;
  final bool isPassword;
  final Function onChanged;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final Function validator;

  @override
  _TextInputFieldState createState() => _TextInputFieldState(
      isPassword: isPassword,
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      inputAction: inputAction);
}

class _TextInputFieldState extends State<TextInputField> {
  final TextEditingController controller;
  bool isPassword;
  bool passwordVisible = false;
  final Function onChanged;
  final Function validator;
  final TextInputAction inputAction;

  _TextInputFieldState(
      {@required this.isPassword,
      this.onChanged,
      @required this.controller,
      this.validator,
      this.inputAction});

  @override
  void initState() {
    passwordVisible = false;
    super.initState();
  }

  void _togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        validator: validator,
        obscureText: isPassword == true ? !passwordVisible : false,
        onChanged: onChanged,
        controller: controller,
        textInputAction: inputAction,
        decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.theme.primaryColor)),
            labelText: widget.hintText,
            suffixIcon: isPassword == false
                ? null
                : GestureDetector(
                    onTap: () {
                      _togglePasswordVisibility();
                    },
                    child: Icon(passwordVisible == true
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )),
      ),
    );
  }
}

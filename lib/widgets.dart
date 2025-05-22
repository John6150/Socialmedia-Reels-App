import 'package:_firstapp/main.dart';
import 'package:_firstapp/variables.dart';
// import 'package:_firstapp/variables.dart';
import 'package:flutter/material.dart';

class CustomInputFields extends StatefulWidget {
  String labelText;
  Widget prefixIcn;
  dynamic keyboard;
  String? type;
  TextEditingController? controller;

  CustomInputFields(
      {super.key,
      required this.prefixIcn,
      required this.labelText,
      required this.controller,
      this.type,
      this.keyboard});
  @override
  State<CustomInputFields> createState() => _CustomInputFieldsState();
}

class _CustomInputFieldsState extends State<CustomInputFields> {
  TextEditingController? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            // height: 45,
            width: 370,
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(),
              controller: widget.controller,
              decoration: InputDecoration(
                  hintText: widget.labelText,
                  label: Text(widget.labelText),
                  border: const OutlineInputBorder(),
                  prefixIcon: widget.prefixIcn),
              validator: (value, [type]) {
                if (value == '') {
                  return '${widget.labelText} can not be empty';
                } else if (value!.length <= 5) {
                  return '${widget.labelText} length has to be more than 5';
                }
              },
              onChanged: (value) {},
            )),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

class PasswordInputField extends CustomInputFields {
  Widget suffIcn;

  PasswordInputField(
      {super.key,
      required super.prefixIcn,
      required super.labelText,
      required super.controller,
      required this.suffIcn,
      super.type});
  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool privacy = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            // height: 45,
            width: 370,
            child: TextFormField(
              obscureText: privacy,
              controller: widget.controller,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          privacy = !privacy;
                        });
                      },
                      icon: privacy
                          ? widget.suffIcn
                          : Icon(Icons.visibility_off)),
                  hintText: widget.labelText,
                  label: Text(widget.labelText),
                  border: const OutlineInputBorder(),
                  prefixIcon: widget.prefixIcn),
              validator: (value, [type]) {
                if (value == '') {
                  return '${widget.labelText} can not be empty';
                } else if (value != passwordController.text) {
                  return 'Passwords do not match';
                } else if (widget.type == 'password' &&
                    !RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+=-{};:"<>,./?])[A-Za-z\d!@#$%^&*()_+=-{};:"<>,./?]+$')
                        .hasMatch(value!)) {
                  return 'Sorry ${widget.labelText} has to be alphabets, numbers and symbols';
                }
              },
              onChanged: (value) {},
            )),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  bool isHidden = true;
  final TextEditingController textEditingController;
  final String labelText;
  final String? hintText;
  final bool isPassword;
  final FormFieldValidator<String?>? validator;
  final IconData iconData;
  final TextInputType? keyboardType;

  InputWidget({
    Key? key,
    required this.textEditingController,
    required this.labelText,
    this.hintText,
    this.isPassword = false,
    this.validator,
    required this.iconData,
    this.isHidden = true,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.isPassword ? widget.isHidden : false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(widget.iconData),
        suffixIcon: (!widget.isPassword)
          ? GestureDetector(
            child: const Icon(Icons.delete_outline,),
            onTap: () {
              widget.textEditingController.clear();
            },
          )
          : IconButton(
            icon: Icon(widget.isHidden ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                widget.isHidden = !widget.isHidden;
              });
            },
          ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2.0)
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.blue, width: 2.0)
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0)
        ),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Colors.red, width: 2.0)
        ),
      ),
      validator: widget.validator,
    );
  }
}

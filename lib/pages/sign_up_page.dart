import 'package:firebase/units/unit_values.dart';
import 'package:firebase/widgets/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatefulWidget {

  final VoidCallback onClickedSignUp;

  const SignUpPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login_form_title),
        centerTitle: UnitValues.appBar['centerTitle'],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              InputWidget(
                textEditingController: _loginController,
                labelText: AppLocalizations.of(context)!.login_label_text,
                hintText: AppLocalizations.of(context)!.login_hint_text,
                iconData: Icons.email,
                validator: _validateEmail,
              ),
              const SizedBox(height: 10),
              InputWidget(
                textEditingController: _passwordController,
                labelText: AppLocalizations.of(context)!.password_label_text,
                hintText: AppLocalizations.of(context)!.password_hint_text,
                iconData: Icons.security,
                isPassword: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: _submitForm,
                child: Text(AppLocalizations.of(context)!.sign_up_title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: AppLocalizations.of(context)!.have_account_title + ' ',
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.submit_login_form,
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _loginController.text.trim().toLowerCase(),
        password: _passwordController.text.trim(),
      );
      print('Form is valid');
      print('Login: ${_loginController.text}');
      print('Password: ${_passwordController.text}');
      // Navigator.push(context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(),
      //   ),
      // );
    } else {
      _showMessage(AppLocalizations.of(context)!.form_is_not_valid);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        backgroundColor: Colors.red,
        content: Text(message,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18.0
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    final _emailExp = RegExp(r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$');
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.email_is_required_message;
    } else if (!_emailExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.email_is_reg_message;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.password_is_required_message;
    }
    return null;
  }
}

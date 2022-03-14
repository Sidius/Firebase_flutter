import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/widgets/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase/models/user.dart' as custom;

class StorageForm extends StatefulWidget {
  final User? user;
  final DocumentReference docUser;

  const StorageForm({Key? key, required this.user, required this.docUser}) : super(key: key);

  @override
  State<StorageForm> createState() => _StorageFormState();
}

class _StorageFormState extends State<StorageForm> {

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputWidget(
            textEditingController: _nameController,
            labelText: AppLocalizations.of(context)!.name_label_text,
            hintText: AppLocalizations.of(context)!.name_hint_text,
            iconData: Icons.person,
            validator: _validateName,
          ),
          const SizedBox(height: 10),
          InputWidget(
            textEditingController: _surnameController,
            labelText: AppLocalizations.of(context)!.surname_label_text,
            hintText: AppLocalizations.of(context)!.surname_hint_text,
            iconData: Icons.person,
            validator: _validateSurname,
          ),
          const SizedBox(height: 10),
          InputWidget(
            textEditingController: _ageController,
            labelText: AppLocalizations.of(context)!.age_label_text,
            hintText: AppLocalizations.of(context)!.age_hint_text,
            iconData: Icons.person,
            validator: _validateSurname,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            onPressed: _submitForm,
            child: Text(AppLocalizations.of(context)!.send,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Form is valid');
      print('Name: ${_nameController.text}');
      print('Surname: ${_surnameController.text}');
      print('Age: ${_ageController.text}');

      // final json = {
      //   'name': _nameController.text.trim(),
      //   'surname': _surnameController.text.trim(),
      //   'age': int.parse(_ageController.text.trim()),
      // };

      final customUser = custom.User(
        name: _nameController.text.trim(),
        surname: _surnameController.text.trim(),
        age: int.parse(_ageController.text.trim()),
      );

      final json = customUser.toJson();

      await widget.docUser.set(json);

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

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.name_is_required_message;
    }
    return null;
  }

  String? _validateSurname(String? value) {
    if (value!.isEmpty) {
      return AppLocalizations.of(context)!.surname_is_required_message;
    }
    return null;
  }
}

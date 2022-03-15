import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/pages/auth_page.dart';
import 'package:firebase/units/unit_values.dart';
import 'package:firebase/widgets/card_attribute_widget.dart';
import 'package:firebase/widgets/storage_form_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase/models/user.dart' as custom;

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  late DocumentReference docUser;

  HomePage({Key? key}) : super(key: key) {
    docUser = FirebaseFirestore.instance.collection(UnitValues.collectionRecName).doc(user!.uid);
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );
    }

    //docUser.set(custom.User(name: null, surname: null, age: null).toJson());

    final Widget userInfoWidget = StreamBuilder<DocumentSnapshot>(
      stream: docUser.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox();
        }

        if (snapshot.hasData) {
          final data = snapshot.data!.data();
          if (data == null) {
            return SizedBox();
          }
          final user = custom.User.fromJson(data as Map<String, dynamic>);

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.name_title,
                  attrValue: user.name,
                ),
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.surname_title,
                  attrValue: user.surname,
                ),
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.age_title,
                  attrValue: (user.age != null) ? user.age.toString() : null,
                ),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home_page),
        centerTitle: UnitValues.appBar['centerTitle'],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.email_title,
                  attrValue: user!.email,
                ),
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.email_title,
                  attrValue: user!.displayName,
                ),
                CardAttribute(
                  attrName: AppLocalizations.of(context)!.id_title,
                  attrValue: user!.uid,
                ),
                userInfoWidget,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text(AppLocalizations.of(context)!.submit_logout,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
                ),
                StorageForm(
                  user: user,
                  docUser: docUser,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

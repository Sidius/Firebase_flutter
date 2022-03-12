import 'package:firebase/generated/l10n.dart';
import 'package:firebase/pages/login_page.dart';
import 'package:firebase/widgets/card_attribute_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home_page),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ),
      ),
    );
  }
}

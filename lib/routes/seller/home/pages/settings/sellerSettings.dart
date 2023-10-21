import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../services/supabase/supabaseAuth.dart';

class SellerSettings extends StatefulWidget {
  const SellerSettings({super.key});

  @override
  State<SellerSettings> createState() => _SellerSettingsState();
}

class _SellerSettingsState extends State<SellerSettings> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 180,
              height: 45,
              child: FilledButton(
                  child: Text('Log out'),
                  onPressed: () {_onClickLogOut(context);}
              ),
            ),
          ],
        ));
  }

  Future<void> _onClickLogOut(BuildContext context) async {
    try {
      await SupabaseAuthRepository.signOut().then((response) {
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.pushReplacementNamed(context, '/login');
      });
    } catch (e) {
      // TODO: Show proper error to users
      print("Sign in error");
      print(e);
    }
  }
}

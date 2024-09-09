import 'package:flutter/material.dart';

class langdropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<AppLanguage>(
        value: AppLanguage.en,
        items: List.generate(AppLanguage.values.length, (index) {
          return DropdownMenuItem(
              value: AppLanguage.values[index],
              child: Text(AppLanguage.values[index].getlangname));
        }),
        onChanged: (val) {});
  }
}

extension langhandeler on AppLanguage {
  String get getlangname {
    switch (this) {
      case AppLanguage.ar:
        return "العربية";
        break;
      case AppLanguage.en:
        return "English";
    }
  }
}

enum AppLanguage { ar, en }

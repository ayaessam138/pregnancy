import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../custom_text_field.dart';

class obertichistory extends StatelessWidget {
  obertichistory(
      {required this.FallTermPregancy,
      required this.Pretermpregancy,
      required this.Abortion,
      required this.LiveBabies,
      required this.fallTermPregancy,
      required this.pretermpregancy,
      required this.abortion,
      required this.liveBabies});

  TextEditingController FallTermPregancy, Pretermpregancy, Abortion, LiveBabies;
  FocusNode fallTermPregancy, pretermpregancy, abortion, liveBabies;
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'fullTermBirth'.tr(),
          hinttext: 'fullTermBirth'.tr(),
          controller: FallTermPregancy, foucusnode: fallTermPregancy,
          // onchanged: (dynamic FallTermPregancyvalue) {
          //   FallTermPregancy = FallTermPregancyvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'pretermBirth'.tr(),
          hinttext: 'pretermBirth'.tr(),
          controller: Pretermpregancy, foucusnode: pretermpregancy,
          // onchanged: (dynamic Pretermpregancyvalue) {
          //   Pretermpregancy = Pretermpregancyvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'abortion'.tr(),
          hinttext:  'abortion'.tr(),
          controller: Abortion, foucusnode: abortion,
          // onchanged: (dynamic Abortionvalue) {
          //   Abortion = Abortionvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        ),
        customtextformfield(
          valuevaldiation: (value) {
            if (value!.isEmpty) {
              return 'fieldrequired'.tr();
            }
          },
          fieldtype: TextInputType.number,
          labeltext: 'liveBabies'.tr(),
          hinttext: 'liveBabies'.tr(),
          controller: LiveBabies, foucusnode: liveBabies,
          // onchanged: (dynamic LiveBabiesvalue) {
          //   LiveBabies = LiveBabiesvalue;
          // },
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}

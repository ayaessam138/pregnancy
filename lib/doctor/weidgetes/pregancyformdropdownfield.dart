// old version usless mtgrbesh t7oteha fe  form tani
import 'package:flutter/material.dart';

import '../../patient/weidgetes/custom_text_field.dart';
import '../constants.dart';
import 'Dropdownbutton.dart';


// ignore: camel_case_types
class pregancyformdropdownfield extends StatefulWidget {
  @override
  State<pregancyformdropdownfield> createState() =>
      _pregancyformdropdownfieldState();
}

class _pregancyformdropdownfieldState extends State<pregancyformdropdownfield> {
  bool HeadNeckvisbility = false;
  bool BreastsNipplesvisbility = false;
  bool Chestvisibility = false;
  bool TeethGumsvisibility = false;
  bool Heartvisbility = false;
  bool Abdomenvisbility = false;
  bool Backbonevisbility = false;
  bool VaricositiesExtremitiesvisibility = false;
  bool Edemavisbility = false;
  String? HeadNeckdropdown;

  String? dropDwonValue;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              HeadNeckdropdown = value;
              status = value!;
              if (status == 'Normal') {
                HeadNeckvisbility = false;
              } else if (status == 'AbNormal') {
                HeadNeckvisbility = true;
              }
            });
          },
          text: 'Head&neck',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: HeadNeckvisbility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                BreastsNipplesvisbility = false;
              } else if (status == 'AbNormal') {
                BreastsNipplesvisbility = true;
              }
            });
          },
          text: 'Breasts&Nipples',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: BreastsNipplesvisbility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                Chestvisibility = false;
              } else if (status == 'AbNormal') {
                Chestvisibility = true;
              }
            });
          },
          text: 'Chest',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: Chestvisibility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                TeethGumsvisibility = false;
              } else if (status == 'AbNormal') {
                TeethGumsvisibility = true;
              }
            });
          },
          text: 'Teeth&Gums',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: TeethGumsvisibility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                Heartvisbility = false;
              } else if (status == 'AbNormal') {
                Heartvisbility = true;
              }
            });
          },
          text: 'Heart',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: Heartvisbility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                Abdomenvisbility = false;
              } else if (status == 'AbNormal') {
                Abdomenvisbility = true;
              }
            });
          },
          text: 'Abdomen',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: Abdomenvisbility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                Backbonevisbility = false;
              } else if (status == 'AbNormal') {
                Backbonevisbility = true;
              }
            });
          },
          text: 'Backbone',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: Backbonevisbility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                VaricositiesExtremitiesvisibility = false;
              } else if (status == 'AbNormal') {
                VaricositiesExtremitiesvisibility = true;
              }
            });
          },
          text: 'Varicosities&Extremities',
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
            visible: VaricositiesExtremitiesvisibility,
            child: customtextformfield(
              valuevaldiation: (value) {
                if (value!.isEmpty) {
                  return 'field required';
                }
              },
              hinttext: 'Specifiy Abnormal',
            )),
        SizedBox(
          height: 15,
        ),
        Dropdownbuttonformfield(
          onchanged: (value) {
            setState(() {
              dropDwonValue = value;
              status = value!;
              if (status == 'Normal') {
                Edemavisbility = false;
              } else if (status == 'AbNormal') {
                Edemavisbility = true;
              }
            });
          },
          text: 'Edema',
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

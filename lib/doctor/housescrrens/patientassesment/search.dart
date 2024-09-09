import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/patientcontainer.dart';
import 'package:pregancy/doctor/weidgetes/custom_text_field.dart';

class search extends StatelessWidget {
  static String searchid = 'search';

  // TextEditingController searchcontroller = TextEditingController();
  String? name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          customtextformfield(
            onchanged: (value) {
              name = value;
            },
            hinttext: 'searchbyname'.tr(),
            valuevaldiation: (value) {
              if (value!.isEmpty) {
                return 'fieldrequired'.tr();
              }
            },
            foucusnode: null,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<PregancyformCubit>(context)
                    .searchpatient(name: name!);
              },
              child:  Text('search'.tr())),
          BlocBuilder<PregancyformCubit, PregancyformState>(
              builder: (context, state) {
            if (BlocProvider.of<PregancyformCubit>(context).pregnacy.isEmpty) {
              return Container();
            } else if (state is pregnacyformsearch) {
              return Expanded(
                child: ListView.builder(
                    itemCount: state.pregnancy!.length,
                    itemBuilder: (context, index) {
                      return patientcontainer(
                        pregancy: state.pregnancy![index],
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ],
      ),
    );
  }
}

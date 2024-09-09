import 'package:flutter/cupertino.dart';
import 'package:pregancy/patient/constants.dart';

class guidesubpagemain extends StatelessWidget {
  guidesubpagemain({
    required this.title,
    required this.text,
  });

  String title, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title,
                  style: TextStyle(
                      color: kprimarycolor, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(text)),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class guidesubpagemain2 extends StatelessWidget {
  guidesubpagemain2(
      {required this.title, required this.text, required this.text2});

  String title, text, text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title,
                  style: TextStyle(
                      color: kprimarycolor, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(text),
              SizedBox(
                height: 15,
              ),
              Text(text2)
            ],
          ),
        ),
      ],
    );
  }
}

class subimage extends StatelessWidget {
  const subimage({
    super.key,
    required this.Cardimage,
  });

  final String? Cardimage;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Cardimage!,
      height: (MediaQuery.of(context).size.height / 3),
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}

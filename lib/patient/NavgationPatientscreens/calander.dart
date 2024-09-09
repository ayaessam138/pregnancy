import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:table_calendar/table_calendar.dart';

import '../../doctor/weidgetes/addeventtextfield.dart';
import '../constants.dart';
import '../cubit/calender_cubit/calender_cubit.dart';

class calendar extends StatefulWidget {
  // static String calendarid = 'calender';
  const calendar({Key? key}) : super(key: key);

  @override
  _calendarState createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  final todaysDate = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();

  CalendarFormat _calendarFormat = CalendarFormat.month;

  late Map<DateTime, List<MyEvents>> mySelectedEvents;
  //late Map<String, List<dynamic>> x;

  @override
  void initState() {
    //x['x']!.add(1);
    selectedCalendarDate = _focusedCalendarDate;

    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CalenderCubit>(context)
        .showevents(eventdate: selectedCalendarDate!);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(color: kprimarycolor, width: 2.0),
              ),
              child: TableCalendar(
                focusedDay: _focusedCalendarDate,
                // today's date
                firstDay: _initialCalendarDate,
                // earliest possible date
                lastDay: _lastCalendarDate,
                // latest allowed date
                calendarFormat: _calendarFormat,
                // onFormatChanged: (format) {
                //   if (_calendarFormat != format) {
                //     setState(() {
                //       _calendarFormat = format;
                //     });
                //   }
                // },
                // default view when displayed
                // default is Saturday & Sunday but can be set to any day.
                // instead of day number can be mentioned as well.
                weekendDays: const [DateTime.sunday, 6],
                // default is Sunday but can be changed according to locale
                startingDayOfWeek: StartingDayOfWeek.monday,
                // height between the day row and 1st date row, default is 16.0
                daysOfWeekHeight: 40.0,
                // height between the date rows, default is 52.0
                rowHeight: 60.0,
                // this property needs to be added if we want to show events
                eventLoader: _listOfDayEvents,
                // Calendar Header Styling

                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleTextStyle:
                      TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: BoxDecoration(
                      color: kprimarycolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  // formatButtonTextStyle:
                  //     TextStyle(color: Colors.black, fontSize: 16.0),
                  // formatButtonDecoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.all(
                  //     Radius.circular(5.0),
                  //   ),
                  // ),
                  leftChevronIcon: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 28,
                  ),
                  rightChevronIcon: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                // Calendar Days Styling
                daysOfWeekStyle: const DaysOfWeekStyle(
                  // Weekend days color (Sat,Sun)
                  weekendStyle: TextStyle(color: kprimarycolor),
                ),
                // Calendar Dates styling
                calendarStyle: const CalendarStyle(
                  // Weekend dates color (Sat & Sun Column)
                  weekendTextStyle: TextStyle(color: kprimarycolor),
                  // highlighted color for today
                  todayDecoration: BoxDecoration(
                    color: kprimarycolor,
                    shape: BoxShape.circle,
                  ),
                  // highlighted color for selected day
                  selectedDecoration: BoxDecoration(
                    color: kprimarycolor,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                      color: kprimarycolor, shape: BoxShape.circle),
                ),
                selectedDayPredicate: (currentSelectedDate) {
                  // as per the documentation 'selectedDayPredicate' needs to determine
                  // current selected day
                  return (isSameDay(
                      selectedCalendarDate!, currentSelectedDate));
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // as per the documentation
                  if (!isSameDay(selectedCalendarDate, selectedDay)) {
                    setState(() {
                      selectedCalendarDate = selectedDay;
                      _focusedCalendarDate = focusedDay;
                      BlocProvider.of<CalenderCubit>(context)
                          .showevents(eventdate: selectedCalendarDate!);
                    });
                  }
                },
              ),
            ),

            BlocBuilder<CalenderCubit, CalenderState>(
                builder: (context, state) {
              if (state is Calendersubitted) {
                return ListTile(
                  leading: const Icon(
                    Icons.done,

                    color: kprimarycolor,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child:
                        Text('eventtitle'.tr() + ' ${state.eventlist!.eventTitle}'),
                  ),
                  subtitle:
                      Text('eventDescription '.tr()+ ' ${state.eventlist!.eventDescp}'),
                );
              } else {
                return Container();
              }
            })

            // ..._listOfDayEvents(selectedCalendarDate!).map(
            //   (myEvents) => ListTile(
            //     leading: const Icon(
            //       Icons.done,
            //       color: kprimarycolor,
            //     ),
            //     title: Padding(
            //       padding: const EdgeInsets.only(bottom: 8.0),
            //       child: Text('Event Title:   ${myEvents.eventTitle}'),
            //     ),
            //     subtitle: Text('Description:   ${myEvents.eventDescp}'),
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kprimarycolor,
        onPressed: () => _showAddEventDialog(),
        label:  Text('addevent'.tr()),
      ),
    );
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title:  Text(
                'NewEvent'.tr(),
                style: TextStyle(color: kprimarycolor),
              ),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  addeventTextField(
                      controller: titleController, hint: 'entertitle'.tr()),
                  const SizedBox(
                    height: 20.0,
                  ),
                  addeventTextField(
                      controller: descpController, hint: 'enterDescription'.tr()),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child:  Text(
                    'cancel'.tr(),
                    style: const TextStyle(color: kprimarycolor),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty &&
                        descpController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text('Pleaseentertitledescription'.tr()),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      //Navigator.pop(context);
                      return;
                    } else {
                      setState(() {
                        BlocProvider.of<CalenderCubit>(context).addevent(
                            eventdate: selectedCalendarDate!,
                            eventTitle: titleController.text,
                            eventDescp: descpController.text);
                        // if (mySelectedEvents[selectedCalendarDate] != null) {
                        //   mySelectedEvents[selectedCalendarDate]?.add(MyEvents(
                        //       eventTitle: titleController.text,
                        //       eventDescp: descpController.text));
                        // } else {
                        //   mySelectedEvents[selectedCalendarDate!] = [
                        //     MyEvents(
                        //         eventTitle: titleController.text,
                        //         eventDescp: descpController.text)
                        //   ];
                        // }
                      });

                      titleController.clear();
                      descpController.clear();

                      Navigator.pop(context);
                      return;
                    }
                  },
                  child:  Text(
                    'Add'.tr(),
                    style: TextStyle(color: kprimarycolor),
                  ),
                ),
              ],
            ));
  }
}

class MyEvents {
  String? eventTitle;
  String? eventDescp;

  DateTime? eventdate;

  MyEvents(
      {required this.eventTitle,
      required this.eventDescp,
      required this.eventdate});
  MyEvents.fromjson(Map<String, dynamic> json) {
    eventDescp = json['eventDescp'];
    eventTitle = json['eventTitle'];
  }

  // @override
  // String toString() => eventTitle;
}

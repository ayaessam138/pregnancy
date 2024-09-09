import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pregancy/core/blocoberver.dart';
import 'package:pregancy/doctor/cubit/calenderdoctor_cubit/calenderdoctor_cubit.dart';
import 'package:pregancy/doctor/cubit/cubit/predictionDoctor_cubit.dart';
import 'package:pregancy/doctor/cubit/getimages_cubit/getimages_cubit.dart';
import 'package:pregancy/doctor/cubit/peedectionpatientbydoctor_cubit/predectionpatientbydoctor_cubit.dart';
import 'package:pregancy/doctor/house_weidghets/notes.dart';
import 'package:pregancy/doctor/housescrrens/housedoctor.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/patientdata.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/patientsassesment.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/search.dart';
import 'package:pregancy/doctor/housescrrens/patientassesment/updatepatientdata.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/analysisrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/assesmentrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/partientrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/patientsubrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondata.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectiondoctorrecord.dart';
import 'package:pregancy/doctor/housescrrens/patientrecord/predectionrecord.dart';

import 'package:pregancy/doctor/screens/reservationrecord.dart';
import 'package:pregancy/doctor/screens/dr_appointments.dart';

import 'package:pregancy/doctor2/cubit/claendernurse_cubit/calendernurse_cubit.dart';
import 'package:pregancy/doctor2/cubit/navigation_nurse_cuibt/navigationnurse_cubit.dart';
import 'package:pregancy/doctor2/cubit/nurseregesteration_cubit/cubit/nurseregesteration_cubit.dart';
import 'package:pregancy/doctor2/cubit/predectiondoctorbynurse_cubit/predectiondoctorbynurse_cubit.dart';
import 'package:pregancy/doctor2/cubit/predectionpatientbynurse%20_cubit/predectionpatientbynurse_cubit.dart';

import 'package:pregancy/doctor2/navigationscreen/calendernuese.dart';

import 'package:pregancy/doctor2/navigationscreen/LayoutNurse.dart';
import 'package:pregancy/doctor2/navigationscreen/profienurse.dart';
import 'package:pregancy/doctor2/screens/appointmetrecordnurse.dart';
import 'package:pregancy/doctor2/screens/homenurse.dart';
import 'package:pregancy/doctor2/screens/notesnurse.dart';
import 'package:pregancy/doctor2/screens/nurseappoitment.dart';
import 'package:pregancy/doctor2/screens/nurseregesteration.dart';
import 'package:pregancy/doctor2/screens/patientnurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/analysisnurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecord.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectiondoctorbynursecontanier.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnurserecordwiedght/predectionpatientbynursecontanier.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/patientnursesubrecord.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbynurse.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/predectionpatientbypatient.dart';
import 'package:pregancy/doctor2/screens/patientnurserecord/prededctiondoctorbynurse.dart';
import 'package:pregancy/doctor2/screens/predectiondoctorbynurse.dart';
import 'package:pregancy/doctor2/screens/predectionpatientbynurse.dart';
import 'package:pregancy/patient/HomePatientscrrens/notes/NotesView.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/reservation_cubit.dart';
import 'package:pregancy/patient/cubit/UpoladAnalysis/upolad_analysis_cubit.dart';
import 'package:pregancy/patient/cubit/calender_cubit/calender_cubit.dart';
import 'package:pregancy/patient/cubit/cubit/predection_patient_cubit.dart';
import 'package:pregancy/patient/cubit/kickcounter_cubit/kickcounter_cubit.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/AntenatalVisits.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/Fetal%20assessment.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/Interventionsforcommonphysiologicalsymptoms.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/Maternalfetalassessment.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/Nutritionalmterventions.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/Preventivemeasures.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/anemiahighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/anemialowrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/diabiteshighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/diabiteslowrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/genralguide.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/preeclamcyahighrisk.dart';
import 'package:pregancy/patient/HomePatientscrrens/guide/preeclamcylowrisk.dart';

import 'package:pregancy/patient/NavgationPatientscreens/PredictionPatient.dart';
// import 'package:pregancy/patient/NavgationPatientscreens/change_profile_screen.dart';
import 'package:pregancy/patient/NavgationPatientscreens/doctor_info.dart';

import 'package:pregancy/patient/NavgationPatientscreens/LayoutPatient.dart';
import 'package:pregancy/patient/NavgationPatientscreens/hospitalis.dart';

import 'package:pregancy/patient/NavgationPatientscreens/emergency.dart';
import 'package:pregancy/doctor/screens/predectionpatientbydoctor.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/rservationrole.dart';
import 'package:pregancy/patient/HomePatientscrrens/reservations/rservationsnurse.dart';
import 'package:pregancy/shared_screen/cache_helper.dart';
import 'package:pregancy/shared_screen/loginScreen.dart';
import 'package:pregancy/shared_screen/login_cubit/login_cubit.dart';
import 'package:pregancy/shared_screen/notes_cubit/notes_cubit.dart';
import 'package:pregancy/shared_screen/signup_cubit/signup_cubit.dart';
import 'package:pregancy/shared_screen/splash_screen.dart';

import 'doctor/cubit/appiotment_cubit/appiotments_cubit.dart';
import 'doctor/cubit/navgation_cubit/navgation_cubit/navgation_cubit.dart';

import 'doctor/cubit/pregancyform_cubit/pregancyform_cubit.dart';

import 'doctor/screens/dr registration.dart';
import 'doctor/screens/DoctorLayout.dart';
import 'doctor/screens/prediction.dart';
import 'doctor/screens/pregancyform.dart';
import 'doctor/screens/profiledoctor.dart';

import 'patient/cubit/ProfilePatient/patientprofile_cubit.dart';
import 'patient/cubit/navgation_cubit/navgation_cubit/navgation_cubit.dart';
import 'patient/HomePatientscrrens/guide.dart';
import 'patient/HomePatientscrrens/UploadAnalysis.dart';
import 'patient/HomePatientscrrens/kickcounter.dart';
import 'patient/HomePatientscrrens/qusetions.dart';
import 'patient/HomePatientscrrens/reservations/reservations.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pregancy/patient/HomePatientscrrens/HomePatient.dart';

import 'shared_screen/change_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('user SignOut');
    } else {
      print('user SignIn' + user.uid);
    }
  });
  await CacheHelper.init();
  // String? uId=CacheHelper.getData(key: 'uId');

  runApp(
    EasyLocalization(
        startLocale: Locale('ar'),
        supportedLocales: [
          const Locale('en'),
          const Locale(
            'ar',
          )
        ],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'ar'),
        child: pregancy()),
  );
}

class pregancy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(
            create: (context) => NurseregesterationCubit()..getnursedata()),
        // BlocProvider(create: (context) => PatientprofileCubit()),
        // BlocProvider(
        //     create: (context) => UpoladAnalysisCubit()
        //       ..GetUploadedAanalysisByPatient(
        //           email: CacheHelper.getData(key: 'email'))),
        // BlocProvider(create: (context) => NotesCubit()..GetNotes()),
        // BlocProvider(create: (context) => NavigationnurseCubit()),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => GetimagesCubit(),
        ),
        // BlocProvider(
        //   create: (context) => NavgationCubitDoctor(),
        // ),
        BlocProvider(create: (context) => PregancyformCubit()),
        BlocProvider(
          create: (context) => PredictionDoctorCubit(),
        ),
        BlocProvider(
          create: (context) =>
              CalenderCubit()..showevents(eventdate: DateTime.now()),
        ),
        BlocProvider(
          create: (context) => kickcouter()..showkicks(),
        ),
        BlocProvider(
          create: (context) =>
              CalenderdoctorCubit()..showevents(eventdate: DateTime.now()),
        ),
        // BlocProvider(create: (context) => NavgationCubitPatient()),
        BlocProvider(
          create: (context) => PredectionPatientCubit(),
        ),
        BlocProvider(
          create: (context) => AppiotmentsCubit(),
        ),
        BlocProvider(
          create: (context) => PredectionpatientbydoctorCubit(),
        ),
        BlocProvider(create: (context) => PredectionpatientbynurseCubit()),
        BlocProvider(create: (context) => PredectiondoctorbynurseCubit()),
        BlocProvider(create: (context) => CalendernurseCubit()),
        BlocProvider(create: (context) => ReservationCubit()),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: {
            '/': (context) => const splashScreen(),
            LayoutPatient.homeid: (context) => LayoutPatient(),
            guide.guideid: (context) => guide(),
            Uplaodanalysis.analysisid: (context) => Uplaodanalysis(),
            kickcounter.kickcounterid: (context) => kickcounter(),
            qusetions.qusetionsid: (context) => qusetions(),
            reservations.reservationsid: (context) => reservations(),
            emergency.emergencyid: (context) => emergency(),
            doctorInfo.doctorInfoid: (context) => const doctorInfo(),
            // pharmicies.pharmiciesid: (context) => pharmicies(),
            hospitalis.hospitalisid: (context) => hospitalis(),
            anemialowrisk.anemialowriskid: (context) => anemialowrisk(),
            preelcamcyalowrisk.preelcamcyalowriskid: (context) =>
                preelcamcyalowrisk(),
            diabiteslowrisk.diabiteslowriskid: (context) => diabiteslowrisk(),
            anemiahighrisk.anemiahighriskid: (context) => anemiahighrisk(),
            preelcamcyahighrisk.preelcamcyahighriskid: (context) =>
                preelcamcyahighrisk(),
            diabiteshighrisk.diabiteshighriskid: (context) =>
                diabiteshighrisk(),
            pregancyform.pregancyformid: (context) => pregancyform(),
            Nutritionalinterventions.Nutritionalinterventionsid: (context) =>
                Nutritionalinterventions(),
            genralguide.genralguideid: (context) => genralguide(),
            Maternalfetalassessment.Maternalfetalassessmentid: (context) =>
                Maternalfetalassessment(),
            Fetalassessment.fetalassessment: (context) => Fetalassessment(),
            Preventivemeasures.Preventivemeasuresid: (context) =>
                Preventivemeasures(),
            Interventionsphysiologicalsymptoms
                    .Interventionsphysiologicalsymptomsid:
                (context) => Interventionsphysiologicalsymptoms(),
            AntenatalVisits.AntenatalVisitsid: (context) => AntenatalVisits(),
            NotesView.mainnoteid: (context) => NotesView(),
            Login.logid: (context) => Login(),
            PredectionPatient.predectionPatientid: (context) =>
                PredectionPatient(),
            pregancyform.pregancyformid: (context) => pregancyform(),
            DoctorLayout.homeid: (context) => DoctorLayout(),
            // doctor_registration.regidd: (context) => doctor_registration(),
            doctor_appointments.appointmentsidd: (context) =>
                const doctor_appointments(),
            patients.patientsid: (context) => const patients(),
            profileDoctor.profileid: (context) => profileDoctor(),
            pregancyform.pregancyformid: (context) => pregancyform(),
            patientrecord.patientrecordid: (context) => patientrecord(),
            predection.predectionid: (context) => predection(),
            patientdata.patientdataid: (context) => patientdata(),
            pregancyformupdate.pregancyformupdateid: (context) =>
                pregancyformupdate(),
            search.searchid: (context) => search(),
            analysisrecord.analysisrecordid: (context) => analysisrecord(),
            appointmentrecord.appointmentrecordid: (context) =>
                appointmentrecord(),
            assesmentrecord.assesmentrecordid: (context) => assesmentrecord(),
            predectionrecord.predectionrecordid: (context) =>
                predectionrecord(),
            patientsubrecord.patientsubrecordid: (context) =>
                patientsubrecord(),
            predectionpatientdata.predectionpatientdataid: (context) =>
                predectionpatientdata(),
            predectiondoctorrecord.predectiondoctorrecordid: (context) =>
                predectiondoctorrecord(),
            predectiondoctordata.predectiondoctordataid: (context) =>
                predectiondoctordata(),
            predectionpatientbydoctor.predectionpatientbydoctorid: (context) =>
                predectionpatientbydoctor(),
            // changeprofileDoctor.changeprofileid: (context) => changeprofileDoctor(),
            // ChangeDoctorProfile.ChangeDoctorProfileid: (context) =>
            //     ChangeDoctorProfile(),
            ChangePatientProfile.ChangePatientProfileid: (context) =>
                ChangePatientProfile(),
            housedoctor.houseid: (context) => housedoctor(),
            HomePatient.houseid: (context) => HomePatient()

            // nurse
            ,
            LayOutNurse.homenursepageid: (context) => LayOutNurse(),
            homenurse.homenurseid: (context) => homenurse(),
            patientnurse.patientnurseid: (context) => patientnurse(),
            notesnurse.notesnurseid: (context) => notes(),
            nurseregesterations.nurseregesterationsid: (context) =>
                nurseregesterations(),
            patientnurserecord.patientnurserecordid: (context) =>
                patientnurserecord(),
            nurseappoitments.nurseappoitmentsid: (context) =>
                nurseappoitments(),
            appoitmentsrecordnurse.appoitmentsrecordnurseid: (context) =>
                appoitmentsrecordnurse(),
            // calendernurse.calendernurseid: (context) => calendernurse(),
            profilenurse.profilenurseid: (context) => profilenurse(),
            LayOutNurse.homenursepageid: (context) => LayOutNurse(),
            predectionpatientbynurse.predectionpatientbynurseid: (context) =>
                predectionpatientbynurse(),
            predectiondoctorbynurse.predectiondoctorbynurseid: (context) =>
                predectiondoctorbynurse(),
            // ChangeNurseProfile.ChangeNurseProfileid: (context) =>
            //     ChangeNurseProfile(),
            homenurse.homenurseid: (context) => homenurse(),

            // patientnurserecord
            analysisnurse.analysisnurseid: (context) => analysisnurse(),
            predectionpatientbypatientrecord.predectionpatientbypatientrecordid:
                (context) => predectionpatientbypatientrecord(),
            predectionpatientbynurserecord.predectionpatientbynurserecordid:
                (context) => predectionpatientbynurserecord(),
            predectiondoctorbynurserecord.predectiondoctorbynurserecordid:
                (context) => predectiondoctorbynurserecord(),
            patientnursesubrecord.patientnursesubrecordid: (context) =>
                patientnursesubrecord(),
            predectionpatientbynursedata.predectionpatientdataid: (context) =>
                predectionpatientbynursedata(),
            predectiondoctorbynursedata.predectiondoctorbynursedataid:
                (context) => predectiondoctorbynursedata(),
            reservarionrole.reservarionroleid: (context) => reservarionrole(),
            reservationsnurse.reservationsnurseid: (context) =>
                const reservationsnurse()

            //appNavigation.appNavigationid : (context) => appNavigation(),
          },
          initialRoute: '/',
        ),
      ),
    );
  }
}

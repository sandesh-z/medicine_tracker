import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicine_tracker/core/notification/notification_service.dart';
import 'package:medicine_tracker/features/add_medicine/domain/usecases/get_medicine_details.dart';
import 'package:medicine_tracker/features/add_medicine/presentation/bloc/add_medicine_bloc.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';
import 'package:medicine_tracker/ui/widgets/colors.dart';
import 'package:medicine_tracker/utils/schedule_task.dart';

final appRouter = AppRouter();
void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppLocalizationCubit>(),
        ),
        BlocProvider(
          create: (context) => AddMedicineBloc(getIt<GetMedicineDetails>()),
        ),
      ],
      child: BlocConsumer<AppLocalizationCubit, AppLocalizationState>(
        listener: (context, state) {
          if (Intl.defaultLocale != null) {
            Intl.defaultLocale = state.appLocale.locale.languageCode;
          }
        },
        builder: (context, localestate) {
          ScreenUtil.init(context);
          return MaterialApp.router(
            key: localestate.key,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Palette.primaryBackground1),
                useMaterial3: true,
                scaffoldBackgroundColor: const Color(0xffF7F6FB)),
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              return locale;
            },
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: localestate.appLocale.locale,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await getIt<NotificationService>().initialize();
  await getIt<ScheduleTask>().initPeriodicTask();
  await ScreenUtil.ensureScreenSize();
}

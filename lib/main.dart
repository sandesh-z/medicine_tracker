import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medicine_tracker/features/localization_cubit/app_localization_cubit.dart';
import 'package:medicine_tracker/injections/injection.dart';
import 'package:medicine_tracker/ui/routes/routes.dart';

void main() async {
  initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => getIt<AppLocalizationCubit>(),
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
            routerConfig: router,
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.green.shade400),
                useMaterial3: true,
                scaffoldBackgroundColor: const Color(0xffF7F6FB)),
            localeResolutionCallback:
                (Locale? locale, Iterable<Locale> supportedLocales) {
              return locale;
            },
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: localestate.appLocale.locale,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await ScreenUtil.ensureScreenSize();
}

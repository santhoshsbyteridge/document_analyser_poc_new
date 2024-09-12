import 'package:document_analyser_poc_new/bloc_observer.dart';
import 'package:document_analyser_poc_new/blocs/customer_phone_call/customer_phone_call_bloc.dart';
import 'package:document_analyser_poc_new/blocs/sidenav_bar/sidenav_bar_bloc.dart';
import 'package:document_analyser_poc_new/routes/app_router.dart';
import 'package:document_analyser_poc_new/services/phone_call_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// dart run build_runner watch -d

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SidenavBarBloc>(
          create: (BuildContext context) => SidenavBarBloc(),
        ),
        BlocProvider<CustomerPhoneCallBloc>(
          create: (BuildContext context) =>
              CustomerPhoneCallBloc(PhoneCallService()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Document Ananlyzer',
        routerConfig: AppRouter.router,
      ),
    );
  }
}

import 'package:election_exit_poll_07610633/pages/listresult.dart';
import 'package:election_exit_poll_07610633/pages/namelist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/exitpoll_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ELECTION EXIT POLL',
      theme: ThemeData(
        fontFamily: GoogleFonts.mitr().fontFamily,
        primarySwatch: Colors.purple,
      ),
      //home: const ExitPoll(),
      routes: {
        ExitPoll.routeName: (context) => const ExitPoll(),
        NameListPage.routeName: (context) => const NameListPage(),
        ListResultPage.routeName: (context) => const ListResultPage(),
      },
      initialRoute: ExitPoll.routeName,
    );
  }
}


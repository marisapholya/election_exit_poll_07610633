import 'package:election_exit_poll_07610633/pages/listresult.dart';
import 'package:election_exit_poll_07610633/pages/namelist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ExitPoll extends StatefulWidget {
  static const routeName = '/exitpoll';
  const ExitPoll({Key? key}) : super(key: key);

  @override
  _ExitPollState createState() => _ExitPollState();
}

class _ExitPollState extends State<ExitPoll> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          //child:const ListResultPage(),
           child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  "assets/images/vote_hand.png",
                  width: 150.0,
                  height: 150.0,
                ),
                const Text(
                  "EXIT POLL",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "เลือกตั้ง อบต.",
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "รายชื่อผู้สมัครรับเลือกตั้ง\n"
                      "นายกองค์การบริหารส่วนตำบลเขาพระ"
                      "\nอำเภอเมืองนครนายก จังหวัดนครนายก",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, NameListPage.routeName);
                        },
                        child: const Text(
                          'ดูรายชื่อ',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          fixedSize: const Size(180, 60),
                          textStyle: const TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, ListResultPage.routeName);
                        },
                        child: const Text(
                          'ดูคะแนน',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          fixedSize: const Size(180, 60),
                          textStyle: const TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),
      ),
    );
  }

}

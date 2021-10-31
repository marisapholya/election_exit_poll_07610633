import 'package:election_exit_poll_07610633/models/list_name.dart';
import 'package:election_exit_poll_07610633/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameListPage extends StatefulWidget {
  static const routeName = '/namelist';

  const NameListPage({Key? key}) : super(key: key);

  @override
  _NameListPageState createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  Future<List<ListName>>? _futurelistname;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<List<ListName>>(
          future: _futurelistname,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var NameItem = snapshot.data![index];
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(8.0),
                    elevation: 5.0,
                    shadowColor: Colors.black.withOpacity(0.2),
                    child: InkWell(
                      onTap: () => () {},
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              color: Colors.grey.withOpacity(0.3),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${NameItem.number}',
                                    style: GoogleFonts.mitr(fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '${NameItem.title}${NameItem.firstName}  ${NameItem.lastName}',
                                    style: GoogleFonts.mitr(fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              const SizedBox.shrink();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<List<ListName>> _loadName() async {
    List list = await Api().fetch('exit_poll');
    var nameList = list.map((item) => ListName.fromJson(item)).toList();
    return nameList;
  }

  @override
  void initState() {
    super.initState();
    _futurelistname = _loadName();
  }
}

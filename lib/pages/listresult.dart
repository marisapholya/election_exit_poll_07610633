import 'package:election_exit_poll_07610633/models/list_result.dart';
import 'package:election_exit_poll_07610633/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListResultPage extends StatefulWidget {
  static const routeName = '/resultlist';
  const ListResultPage({Key? key}) : super(key: key);

  @override
  _ListResultPageState createState() => _ListResultPageState();
}

class _ListResultPageState extends State<ListResultPage> {
  Future<List<ListResult>>? _futureListResult;
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
        child: FutureBuilder<List<ListResult>>(
          future: _futureListResult,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var ResultItem = snapshot.data![index];
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
                                    '${ResultItem.number}',
                                    style: GoogleFonts.mitr(fontSize: 20.0),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    '${ResultItem.title}${ResultItem.firstName}  ${ResultItem.lastName}',
                                    style: GoogleFonts.mitr(fontSize: 20.0),
                                  ),
                                  Text(
                                    ResultItem.score,
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

  Future<List<ListResult>> _loadResult() async {
    List list = await Api().fetch('exit_poll/result');
    var nameList = list.map((item) => ListResult.fromJson(item)).toList();
    return nameList;
  }

  @override
  void initState() {
    super.initState();
    _futureListResult = _loadResult();
  }



}

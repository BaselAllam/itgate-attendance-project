import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/api/attendmodel.dart';
import 'package:flutter/material.dart';

class AlTen extends StatefulWidget {
  const AlTen({Key? key}) : super(key: key);

  @override
  _AlTenState createState() => _AlTenState();
}

class _AlTenState extends State<AlTen> {
  Future<List<AttendModel>>? albums;

  @override
  Widget build(BuildContext context) {
    albums = Api.getdata(Api.id);
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          backgroundColor: Colors.indigo[700],
        ),
        body: Column(children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: 100,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[700]),
                    child: Center(
                      child: Text(
                        "DAY",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                    width: 80,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[700]),
                    child: Center(
                      child: Text(
                        "IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                    width: 80,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[700]),
                    child: Center(
                      child: Text(
                        "OUT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                    width: 50,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[700]),
                    child: Center(
                      child: Text(
                        "BREAK",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ))
              ]),
          Expanded(
            child: FutureBuilder<List<AttendModel>>(
              future: albums,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, i) {
                        return Dismissible(
                            background: Container(
                              color: Colors.grey[700],
                              child: Icon(Icons.check),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              child: Icon(Icons.cancel),
                            ),
                            key: ObjectKey(snapshot.data![i].id),
                            onDismissed: (direction) {
                              //print(direction.index);
                            },
                            child: Card(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                        width: 100,
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[700]),
                                        child: Center(
                                          child: Text(
                                            snapshot.data![i].date.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Container(
                                        width: 80,
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[700]),
                                        child: Center(
                                          child: Text(
                                            snapshot.data![i].goin.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Container(
                                        width: 80,
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[700]),
                                        child: Center(
                                          child: Text(
                                            snapshot.data![i].goout.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Container(
                                        width: 50,
                                        padding: EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[700]),
                                        child: Center(
                                          child: Text(
                                            snapshot.data![i].brea.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))
                                  ]),
                            ));
                      });
                } else if (snapshot.hasError) {
                  Text('Sorry there');
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.blue.shade900,
                      color: Colors.orange,
                    )
                  ],
                );
              },
            ),
          )
        ]));
  }
}

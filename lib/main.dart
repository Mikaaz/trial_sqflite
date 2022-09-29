import 'package:flutter/material.dart';
import 'package:sqflitetrial/database_helper.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite example"),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(onPressed: () async{
              int? i = await DatabaseHelper.instance.insert({
                DatabaseHelper.columnName : "Mika"
              });

              print("the insert id is $i");

            }, child: Text('insert'), style: ElevatedButton.styleFrom(primary: Colors.redAccent[400])),
            ElevatedButton(onPressed: () async{
              List<Map<String, dynamic>>? queryRows = await DatabaseHelper.instance.queryAll();
              print(queryRows);

            }, child: Text('query'), style: ElevatedButton.styleFrom(primary: Colors.grey[400])),
            ElevatedButton(onPressed: () async{
              int updatedId = await DatabaseHelper.instance.update({
                DatabaseHelper.columnId: 3,
                DatabaseHelper.columnName: "Moguz"
              });

              print(updatedId);

            }, child: Text('update'), style: ElevatedButton.styleFrom(primary: Colors.green[400])),
            ElevatedButton(onPressed: () async{

              int? rowsEffected = await DatabaseHelper.instance.delete(3);
              print(rowsEffected);


            }, child: Text('delete'), style: ElevatedButton.styleFrom(primary: Colors.blue[400])),
          ],
        ),
      ),
    );
  }
}

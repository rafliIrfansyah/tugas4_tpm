import 'package:flutter/material.dart';

class MemberList extends StatefulWidget {
  const MemberList({super.key});

  @override
  MemberListState createState() => MemberListState();
}

class MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Kelompok 11"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                  child: Text('No', 
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                  child: Text('Nama',
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                  child: Text('NIM', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            
              rows: const <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Usamah Faizul Islam')),
                  DataCell(Text('123200073')),
                ],
                ),
                DataRow(cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('Syihabudin Rahmat Ramadhan')),
                  DataCell(Text('123200081')),
                ],
                ),
                DataRow(cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Rafli Irfansyah Kusumawardhana')),
                  DataCell(Text('123200084')),
                ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
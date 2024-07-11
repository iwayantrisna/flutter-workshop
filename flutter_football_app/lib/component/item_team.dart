import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_football_app/data_source.dart';
import 'package:flutter_football_app/model/list_team.dart';
import 'package:flutter_football_app/pages/page_detail.dart';

class ItemTeam extends StatelessWidget {
  ItemTeam({Key? key, this.listTeam}) : super(key: key);

  final DataSource dataSource = DataSource();
  final ListTeam? listTeam;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      listTeam?.data.length ?? 0,
      (index) {
        final data = listTeam?.data[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TeamDetailWidget(id: data != null ? data.id : 0)));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      data != null
                          ? data.imagePath
                          : "https://via.placeholder.com/150",
                      width: 100,
                      height: 100),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data != null ? data.name : "-"),
                          Text(data != null ? data.founded.toString() : "-"),
                        ]),
                  )
                ],
              ),
            ));
      },
    ));
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_football_app/data_source.dart';

class TeamDetailWidget extends StatefulWidget {
  final int id;
  final DataSource dataSource = DataSource();
  TeamDetailWidget({Key? key, required this.id}) : super(key: key);

  @override
  _TeamDetailWidgetState createState() => _TeamDetailWidgetState();
}

class _TeamDetailWidgetState extends State<TeamDetailWidget> {
  String? name;
  int? founded;
  String country = '';
  String venue = '';
  String? imagePath;

  @override
  void initState() {
    widget.dataSource.fetchDetailTeam(widget.id).then((value) {
      if (value != null) {
        setState(() {
          name = value.data.name;
          founded = value.data.founded;
          country = value.data.country.name;
          venue = value.data.venue.name;
          imagePath = value.data.imagePath;
        });
      }
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Detail Team',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                      imagePath ?? "https://via.placeholder.com/150"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: $name',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Founded: $founded',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      Text('Country: $country',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('Venue: $venue',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pokemon_data.dart';

class HalamanDetail extends StatelessWidget {
  final PokemonData pokemon;
  const HalamanDetail({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.heart_broken_outlined),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child : Image.network(pokemon.image),
          ),
          SizedBox(height: 16),
          Text(pokemon.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          SizedBox(height: 16),
          Text("Type", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("${pokemon.type}"),
          SizedBox(height: 16),
          Text("Weakness", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("${pokemon.weakness}"),
          SizedBox(height: 16),
          Text("Previous Evolution", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("${pokemon.prevEvolution}"),
          SizedBox(height: 16),
          Text("Next Evolution", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("${pokemon.nextEvolution}"),
          SizedBox(height: 16),
          IconButton(
            onPressed: () {
              launchURL(pokemon.wikiUrl);
            },
            icon: Icon(Icons.circle_notifications, color: Colors.red, size: 50,),
          )
        ],
      ),
    );
  }
}
Future<void> launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if(!await launchUrl(_url)) {
    throw 'Could not launch $url';
  }
}
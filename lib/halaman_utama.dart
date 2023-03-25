import 'package:kuis_tpm/pokemon_data.dart';
import 'package:flutter/material.dart';
import 'halaman_detail.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HalamanDetail(pokemon: listPokemon[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    listPokemon[index].image,
                    height: 100,
                  ),
                  Text(listPokemon[index].name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// lib/pages/character_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spongebob/components/character_tile.dart';
import 'package:spongebob/services/character_service.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});


  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search characters',
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Colors.grey),
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
          ),
        ),

        const SizedBox(height: 24),

        // Message
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Let\'s look what is in the underwater world',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),

        const SizedBox(height: 24),

        // Section Title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Famous Character',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        // Characters grid
        Expanded(
          child: Consumer<CharacterService>(
            builder: (context, characterService, child) {
              final characters = characterService.searchCharacters(_searchQuery);
              
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: characters.isEmpty
                    ? const Center(
                        child: Text('No characters found',
                            style: TextStyle(fontSize: 18)),
                      )
                    : GridView.builder(
                        itemCount: characters.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // 2 tiles per row
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                        itemBuilder: (context, index) {
                          final character = characters[index];
                          final originalIndex = characterService.findCharacterIndex(character.name);
                          return CharacterTile(
                            character: character,
                            index: originalIndex,
                          );
                        },
                      ),
              );
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(
              top: 25.0, left: 25, right: 25, bottom: 25),
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
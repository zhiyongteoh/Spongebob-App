// lib/pages/favourite_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spongebob/components/character_tile.dart';
import 'package:spongebob/services/character_service.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterService>(
      builder: (context, characterService, child) {
        final favorites = characterService.favorites;

        return Column(
          children: [
            const SizedBox(height: 20),
            
            // Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Favorite Characters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Favorites list
            Expanded(
              child: favorites.isEmpty
                  ? const Center(
                      child: Text(
                        'No favorite characters yet',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        itemCount: favorites.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.6,
                        ),
                        itemBuilder: (context, index) {
                          final character = favorites[index];
                          final originalIndex = characterService.findCharacterIndex(character.name);
                          return CharacterTile(
                            character: character, 
                            index: originalIndex,
                          );
                        },
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
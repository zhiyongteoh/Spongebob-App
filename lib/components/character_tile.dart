import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spongebob/models/character.dart';
import 'package:spongebob/services/character_service.dart';
import 'package:spongebob/pages/character_detail_page.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final int index;

  const CharacterTile({
    super.key,
    required this.character,
    required this.index,
  });

  // Get background color based on character name
  Color getCharacterColor() {
    switch (character.name) {
      case 'Spongebob SquarePants':
        return Colors.yellow[100]!;
      case 'Patrick Star':
        return Colors.pink[50]!;
      case 'Squidward Tentacles':
        return Colors.teal[50]!;
      case 'Mr. Krabs':
        return Colors.red[50]!;
      case 'Sandy Cheeks':
        return Colors.brown[100]!;
      case 'Plankton':
        return Colors.green[50]!;
      case 'Gary the Snail':
        return Colors.blue[50]!;
      case 'Mrs. Puff':
        return Colors.lime[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailPage(
              character: character,
              index: index,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: getCharacterColor(), // Use the custom color here
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: getCharacterColor().withOpacity(0.5),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Character pic
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  character.imagePath,
                  height: 200,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Name and love icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      character.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // prevent tap from triggering tile tap
                      Provider.of<CharacterService>(context, listen: false)
                          .toggleFavorite(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        character.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                character.description,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
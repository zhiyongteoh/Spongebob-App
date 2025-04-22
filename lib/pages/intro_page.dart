import 'package:flutter/material.dart';
import 'package:spongebob/pages/home_page.dart';


class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //spongebob pic
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Image.asset('lib/images/spongebob family.png',
                height: 300,
                ),
              ),
          
              const SizedBox(height: 24),
          
              //title
              const Text('Welcome to Spongebob Squarepants Underwater World!',
                style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
          
              const SizedBox(height: 24),
          
              //subtitle
              const Text('The misadventures of a talking sea sponge who works at a fast food restaurant, attends a boating school, and lives in an underwater pineapple.',
                style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
                ),
                textAlign: TextAlign.center,
              ),
          
              const SizedBox(height: 40),

              //learn more button
              GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const HomePage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Center(
                    child: Text('Learn More!',
                    style: TextStyle(color: Colors.white,
                    fontSize: 15,
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: SocialPostScreen(),
    );
  }
}

class SocialPostScreen extends StatefulWidget {
  const SocialPostScreen({super.key});

  @override
  _Calculadora createState() => _Calculadora();
}

class _Calculadora extends State<SocialPostScreen> {
  int likes = 233;
  bool isLiked = false;
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
      }
      isLiked = !isLiked;
    });
  }

  void addComment() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        comments.add(commentController.text);
        commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Escribe un comentario...",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('7'),
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('8')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('9')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('/')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('4'),
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('5')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('6')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('x')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('1'),
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('2')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('3')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('-')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('0'),
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('.')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('-/+')
              ),
              ElevatedButton(
                onPressed: toggleLike, 
                child: Text('+')
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: toggleLike,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: Text('='),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(SocialPostApp());
}

class SocialPostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      home: SocialPostScreen(),
    );
  }
}

class SocialPostScreen extends StatefulWidget {
  @override
  _SocialPostScreenState createState() => _SocialPostScreenState();
}

class _SocialPostScreenState extends State<SocialPostScreen> {
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
        title: Text("Publicación de TheWeeknd"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              "https://i.scdn.co/image/ab6761610000e5eb9e528993a2820267b97f6aae",
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: toggleLike,
                icon: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.white : Colors.red,
                ),
                label: Text(
                  "$likes",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isLiked ? Colors.red : Theme.of(context).colorScheme.inversePrimary,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addComment,
                  child: Text("Enviar"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.comment),
                  title: Text(comments[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

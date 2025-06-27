import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; // Untuk ListEquality

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {

  List<int> puzzlePieces = List.generate(9, (index) => index);
  List<int> shuffledPuzzle = [];

  @override
  void initState() {
    super.initState();
    shuffledPuzzle = List.from(puzzlePieces)..shuffle();
  }

  void swapPieces(int index1, int index2) {
    setState(() {
      var temp = shuffledPuzzle[index1];
      shuffledPuzzle[index1] = shuffledPuzzle[index2];
      shuffledPuzzle[index2] = temp;
    });
  }

  bool isPuzzleSolved() {
    return ListEquality().equals(puzzlePieces, shuffledPuzzle);
  }

  bool _canSwap(int index1, int index2) {
    int row1 = index1 ~/ 3, col1 = index1 % 3;
    int row2 = index2 ~/ 3, col2 = index2 % 3;
    return (row1 == row2 && (col1 - col2).abs() == 1) || (col1 == col2 && (row1 - row2).abs() == 1);
  }

  Alignment _getAlignment(int index) {
    int row = index ~/ 3;
    int col = index % 3;
    double dx = col / 3.0;
    double dy = row / 3.0;
    return Alignment(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF037A16),
        centerTitle: true,
        title: Text('Puzzle Reward', style: TextStyle(fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: shuffledPuzzle.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    int emptyIndex = shuffledPuzzle.indexOf(0);
                    if (_canSwap(index, emptyIndex)) {
                      swapPieces(index, emptyIndex);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      image: shuffledPuzzle[index] == 0
                          ? null
                          : DecorationImage(
                        image: AssetImage('assets/images/masjid.jpg'),
                        fit: BoxFit.cover,
                        alignment: _getAlignment(index),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isPuzzleSolved()
                  ? () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Congratulations!'),
                      content: Text('You have completed the puzzle!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
                  : null,
              child: Text('Solve Puzzle'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

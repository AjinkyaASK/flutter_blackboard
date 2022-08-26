import 'package:canvas/canvas.dart';
import 'package:flutter/material.dart';

class Blackboard extends StatefulWidget {
  const Blackboard({Key? key}) : super(key: key);

  @override
  State<Blackboard> createState() => _BlackboardState();
}

class _BlackboardState extends State<Blackboard> {
  final List<Offset?> _drawingPoints = [];

  static const Color _lightColor = Color(0xFFECEFF1);
  static const Color _darkColor = Color.fromARGB(255, 28, 30, 31);

  void _onGesture(offset) => setState(() => _drawingPoints.add(offset));

  void _onClear() => setState(() => _drawingPoints.clear());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _darkColor,
        appBar: AppBar(
          title: const Text('Canvas'),
          foregroundColor: _lightColor,
          centerTitle: false,
          backgroundColor: _darkColor.withOpacity(0.75),
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onPanStart: (details) => _onGesture(details.localPosition),
          onPanUpdate: (details) => _onGesture(details.localPosition),
          onPanEnd: (details) => _onGesture(null),
          child: CustomPaint(
            painter: CanvasView(_drawingPoints),
            size: Size.infinite,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onClear,
          backgroundColor: _lightColor,
          foregroundColor: _darkColor,
          child: const Icon(Icons.clear_all),
        ),
      ),
    );
  }
}

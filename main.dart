import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppScreen(),
    );
  }
}

class MyAppScreen extends StatefulWidget {
  const MyAppScreen({super.key});

  @override
  State<MyAppScreen> createState() => _MyAppScreenState();
}

class _MyAppScreenState extends State<MyAppScreen> {
  String _inputText = '';
  final TextEditingController _controller = TextEditingController();
  String? _errorText;
  Color _textColor = Colors.black;

  void _handleInputChange(String value) {
    setState(() {
      _inputText = value.trim(); 

      if (_inputText.isEmpty) {
        _errorText = null;
        _textColor = Colors.black;
      } else if (double.tryParse(_inputText) != null) {
        _errorText = null;
        _textColor = Colors.green;
      } else {
        _errorText = 'Будь ласка, введіть число!';
        _textColor = Colors.red;
      }
    });
  }

  void _clearText() {
    _controller.clear();
    _handleInputChange(''); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Перевірка введеного тексту'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Введіть число:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _controller,
              onChanged: _handleInputChange,
              keyboardType: TextInputType.text, 
              autofocus: true, 
              decoration: InputDecoration(
                labelText: 'Введіть тут...',
                border: const OutlineInputBorder(),
                errorText: _errorText,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Ви ввели: $_inputText',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearText,
              child: const Text('Очистити'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const TempConverterApp());
}

class TempConverterApp extends StatelessWidget {
  const TempConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Normal to Normal Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TempConverterScreen(),
    );
  }
}

class TempConverterScreen extends StatefulWidget {
  const TempConverterScreen({super.key});

  @override
  State<TempConverterScreen> createState() => _TempConverterScreenState();
}

class _TempConverterScreenState extends State<TempConverterScreen> {
  final _fController = TextEditingController();
  final _cController = TextEditingController();
  final _ozController = TextEditingController();
  final _gController = TextEditingController();

  void _convertValues() {
    setState(() {
      // Temperature conversion
      if (_fController.text.isNotEmpty && _cController.text.isNotEmpty) {
        _fController.clear();
        _cController.clear();
      } else if (_fController.text.isNotEmpty) {
        double fahrenheit = double.tryParse(_fController.text) ?? 0;
        double celsius = (fahrenheit - 32) * 5 / 9;
        _cController.text = celsius.toStringAsFixed(2);
      } else if (_cController.text.isNotEmpty) {
        double celsius = double.tryParse(_cController.text) ?? 0;
        double fahrenheit = (celsius * 9 / 5) + 32;
        _fController.text = fahrenheit.toStringAsFixed(2);
      }

      // Weight conversion
      if (_ozController.text.isNotEmpty && _gController.text.isNotEmpty) {
        _ozController.clear();
        _gController.clear();
      } else if (_ozController.text.isNotEmpty) {
        double ounces = double.tryParse(_ozController.text) ?? 0;
        double grams = ounces * 28.3495;
        _gController.text = grams.toStringAsFixed(2);
      } else if (_gController.text.isNotEmpty) {
        double grams = double.tryParse(_gController.text) ?? 0;
        double ounces = grams / 28.3495;
        _ozController.text = ounces.toStringAsFixed(2);
      }
    });
  }

  void _clearFields() {
    setState(() {
      _fController.clear();
      _cController.clear();
      _ozController.clear();
      _gController.clear();
    });
  }

  @override
  void dispose() {
    _fController.dispose();
    _cController.dispose();
    _ozController.dispose();
    _gController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header
              const Text(
                'Temperature',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Temperature Fields Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _fController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'F',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _cController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'C',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Weight Fields Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _ozController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'OZ',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _gController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'G',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _convertValues,
                    child: const Text('Enter'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _clearFields,
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

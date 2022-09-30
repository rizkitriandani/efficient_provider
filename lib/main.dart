import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCounter with ChangeNotifier {
  int _num = 0;

  int get num => _num;

  set num(int n) {
    _num = n;
    notifyListeners();
  }

  void increment() {
    _num = _num + 1;
    notifyListeners();
  }

  void decrement() {
    _num = _num - 1;
    notifyListeners();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('root build called');
    return ChangeNotifierProvider(
        create: (context) => MyCounter(),
        child: MaterialApp(
          title: 'MyAppJan',
          home: Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: const AllWidget(),
          ),
          theme: ThemeData(primarySwatch: Colors.orange),
        ));
  }
}

class AllWidget extends StatelessWidget {
  const AllWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('state build called');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          MyCounterText(),
          SizedBox(height: 10),
          MyIncreaseButton(),
          SizedBox(height: 10),
          MyDecreaseButton(),
        ],
      ),
    );
  }
}

class MyCounterText extends StatelessWidget {
  const MyCounterText({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('MyCounterText');
    return Consumer<MyCounter>(
      builder: (context, myCounter, _) {
        return Text(myCounter.num.toString());
      },
    );
  }
}

class MyIncreaseButton extends StatelessWidget {
  const MyIncreaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<MyCounter>(context, listen: false);
    debugPrint('MyIncreaseButton');
    return ElevatedButton(
      child: const Text('Increase ++'),
      onPressed: () => items.increment(),
    );
  }
}

class MyDecreaseButton extends StatelessWidget {
  const MyDecreaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<MyCounter>(context, listen: false);
    debugPrint('MyDecreaseButton');
    return ElevatedButton(
      child: const Text('Decrease --'),
      onPressed: () => items.decrement(),
    );
  }
}

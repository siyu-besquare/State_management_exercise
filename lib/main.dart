import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_exercise/counter_cubit.dart';

import 'operation_page.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter",
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int count = 0;
  late CounterCubit cubit;
  final inputController = TextEditingController();

  void navigateToMultiply(BuildContext context, int input, int state) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Multiply(
            input: input,
            state: state,
          );
        },
      ),
    );
  }

  void navigateToDivide(BuildContext context, int input, int state) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Divide(
            input: input,
            state: state,
          );
        },
      ),
    );
  }

  @override
  void didChangeDependencies() {
    cubit = BlocProvider.of<CounterCubit>(context);
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: BlocConsumer<CounterCubit, int>(
        bloc: cubit,
        listener: (context, state) {
          const snackbar = SnackBar(content: Text('State is reached'));
          if (state == 5) {
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: inputController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter number'),
                ),
                Text('$state', textScaleFactor: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          cubit.increment();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: Text('Increment')),
                    ElevatedButton(
                      onPressed: () {
                        cubit.decrement();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      child: Text('Decrement'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit.reset();
                      },
                      child: Text('Reset'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    int input = int.parse(inputController.text);
                    navigateToMultiply(context, input, state);
                  },
                  child: Text('X'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int input = int.parse(inputController.text);
                    navigateToDivide(context, input, state);
                  },
                  child: Text('/'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

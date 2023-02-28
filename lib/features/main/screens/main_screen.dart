import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/poke_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _offset = 0;

  @override
  Widget build(BuildContext context) {
    final prov = context.read<PokeBloc>().fetchData(offset: _offset);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke List'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_offset <= 1259) {
                  _offset += 20;
                } else {
                  _offset = 1279;
                }
              });
              prov;
            },
            child: const Text('Next'),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (_offset >= 20) {
                  _offset -= 20;
                } else {
                  _offset = 0;
                }
              });
              prov;
            },
            child: const Text('Previous'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<PokeBloc>().fetchData(offset: _offset),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: context.read<PokeBloc>().state.pokeResult!.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Text(
                    context.read<PokeBloc>().state.pokeResult![index].name),
              ),
      ),
    );
  }
}

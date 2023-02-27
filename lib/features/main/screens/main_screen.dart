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
  late PokeBloc _pokeBloc;
  int _offset = 0;

  @override
  void initState() {
    super.initState();
    _pokeBloc = context.read<PokeBloc>();
    _pokeBloc.fetchData(offset: _offset);
  }

  @override
  Widget build(BuildContext context) {
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
                _offset += 20;
              });
              context.read<PokeBloc>().fetchData(offset: _offset);
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
              context.read<PokeBloc>().fetchData(offset: _offset);
            },
            child: const Text('Previous'),
          ),
        ],
      ),
      body: BlocBuilder<PokeBloc, PokeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.pokeResult!.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
                Text(state.pokeResult![index].name),
          );
        },
      ),
    );
  }
}

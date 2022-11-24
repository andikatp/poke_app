import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_outline.dart';
import 'package:poke_app/widgets/container_with_logo.dart';
import 'dart:math' as math;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            Positioned(
              right: -80,
              top: -50,
              child: Transform.rotate(
                angle: math.pi / 1.05,
                child: Image.asset(
                  'assets/pokeball.png',
                  height: size.height * 0.60,
                  width: size.width * 0.60,
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                //AppBar
                SliverAppBar(
                  leadingWidth: 80,
                  centerTitle: false,
                  leading: IconButton(
                    onPressed: () {
                      debugPrint('Menu Clicked');
                    },
                    icon: const Iconify(
                      HeroiconsOutline.menu_alt_2,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  floating: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  expandedHeight: 90,
                ),
                //ListView below AppBar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchBar(),
                        const SizedBox(height: 40),
                        const CategoryMenu(),
                        const SizedBox(height: 20),
                        Column(
                          children: const [Text('Watch')],
                        ),
                        const CategoryMenu(),
                        const CategoryMenu(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

//gridview of the 4 category
class CategoryMenu extends StatelessWidget {
  const CategoryMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 2 / 1.2,
      crossAxisSpacing: 23,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: const [
        ContainerWithLogo(
          label: 'Pokédex',
          logo: 'assets/pokeballReal.png',
          color: Colors.red,
        ),
        ContainerWithLogo(
          label: 'Moves',
          logo: 'assets/pokeballReal.png',
          color: Colors.orange,
        ),
        ContainerWithLogo(
          label: 'Evolution',
          logo: 'assets/pokeballReal.png',
          color: Colors.green,
        ),
        ContainerWithLogo(
          label: 'Location',
          logo: 'assets/pokeballReal.png',
          color: Colors.blue,
        )
      ],
    );
  }
}

//text what pokemon and the search bar
class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchNode = FocusNode();

  @override
  void dispose() {
    searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'What Pokémon are you looking for?',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 40,
        ),
        TextField(
          onTapOutside: (event) => searchNode.unfocus(),
          focusNode: searchNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50)),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search Pokémon',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
          ),
        ),
      ],
    );
  }
}

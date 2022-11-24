import 'package:flutter/material.dart';

class ContainerWithLogo extends StatelessWidget {
  const ContainerWithLogo({
    Key? key,
    required this.label,
    required this.logo,
    required this.color,
  }) : super(key: key);

  final String label;
  final String logo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: size.height * 0.11,
          width: size.width * 0.50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              const SizedBox(
                width: 70,
              )
            ],
          ),
        ),
        Positioned(
          right: 15,
          top: -10,
          child: Image.asset(
            logo,
            height: 60,
            width: 60,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grock/grock.dart';

class CustomHomeCategories extends StatelessWidget {
  const CustomHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {},
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Expanded(
            child: GrockRotateAnimation(
              child: Container(
                width: context.height * 0.082,
                decoration: BoxDecoration(
                  color: Grock.randomColor(),
                  borderRadius: 30.borderRadius,
                ),
                child: const Center(
                  child: GrockRotateAnimation(
                    begin: 1,
                    end: -1,
                    child: FaIcon(
                      FontAwesomeIcons.car,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            "ARABA",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}

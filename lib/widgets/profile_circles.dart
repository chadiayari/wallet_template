import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../constants.dart' as constants;

class ProfileCircle extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onPressed;

  const ProfileCircle({
    Key? key,
    required this.name,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 0.0,
        fillColor: isSelected
            ? HexColor(constants.secondaryColor)
            : Colors.transparent,
        padding: EdgeInsets.all(size.width * 0.03),
        shape: (RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.03),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

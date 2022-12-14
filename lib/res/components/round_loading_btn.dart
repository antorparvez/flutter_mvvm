import 'package:flutter/material.dart';
import '../colors.dart';



class RoundButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  const RoundButton({Key? key ,
    required this.title,
    this.loading = false ,
    required this.onPress ,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.colorPrimary,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
            child:loading ? const SizedBox(
              height: 25,
                width: 25,
                child: CircularProgressIndicator(color: Colors.white,)) :  Text(title ,
              style: const TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}

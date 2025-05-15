
import 'package:flutter/material.dart';
import 'package:notesapp/widgets/constants.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading= false });

  final void Function()? onTap;

  final bool isLoading ;
  //لغيت المودل بروجرس هاد من الادد بوتوم شيت عشان كانت لما بتظهر بيبقى فيه  فاصل لون بينها وبين الشيت
  //فلاتر مش لازم تحل كل مشكله قدامك ممكن تبدل اللي مضايقك بغيره وف حالتنا دي بدلناها ب اذ لودينج
  //هتظهر مكان زرار ادد لما ادوس عليه
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: MediaQuery.of(context).size.width,
      //كده بقوله خد الويدس بتاع الشاشه كلها
      height: 55,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: isLoading ?
            SizedBox(
              height: 24,
             width: 24,
       child:  CircularProgressIndicator(
          color: Colors.black,
        )
            ) : const Text('Add',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      )
    );
  }
}

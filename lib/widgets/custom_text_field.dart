
  import 'package:flutter/material.dart';
import 'package:notesapp/widgets/constants.dart';

class CustomTextField extends StatelessWidget {
    const CustomTextField (
        {super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged  });

    final String hint ;
    final int maxLines;
    //ضفت الماكس لاينز عشان التيكست فيلد اللي تحت بتاع الكونتنت اكبر من اللي فوقه بتاع التايتل
 final void Function(String?)? onSaved ;
    final void Function(String?)? onChanged ;

    @override
    Widget build(BuildContext context) {
      return TextFormField(
        onChanged: onChanged,
        //هبتدي استقبل البيانات
        onSaved: onSaved,
        //لو هتشتغل ع اكتر من تيكست فيلد فلازم تستقبله ف الفاليديتور هنا()
        validator: (value) {
          if (value?.isEmpty ?? true) {
            //هنا بقوله لو الفاليو مش بنل شوفهالي ايمبتي ولا لأ ولو كانت بنل ف كده مش هيأكسز الايمبتي , ولو كان اللي قبل علامتين الاستفهام بنل يبقى ترو تمام
            return 'Field is required' ;
          }else {
            return null ;
          }
        },
          cursorColor: kPrimaryColor,
    maxLines: maxLines,
   decoration: InputDecoration(
    hintText: hint,
  // hintStyle: TextStyle(color: kPrimaryColor),
    border: buildBorder(),
    enabledBorder: buildBorder(),
    focusedBorder: buildBorder( kPrimaryColor ),

  ),
      );
    }

    OutlineInputBorder buildBorder([color]) {
      return OutlineInputBorder(
  borderRadius: BorderRadius.circular(8),
  borderSide: BorderSide(color: color ?? Colors.white),
        //لو الكالر بنل خد الابيض لو مكانش يبقى اللي عامله
  );
    }
  }



 import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/color_list_view.dart';
import 'package:notesapp/widgets/constants.dart';

class EditNoteColorList extends StatefulWidget {
   const EditNoteColorList({super.key, required this.note});

 final NoteModel note ;
   @override
   State<EditNoteColorList> createState() => _EditNoteColorListState();
}

 class _EditNoteColorListState extends State<EditNoteColorList> {

   // int currentIndex = 0;
   //ودلوقتي مش هحتاجها لاني هستقبل الانشيال كالر اللي جيالي من النوت يعني كالر النوت اللي ف الموديل هو الانشيل كالر بتاعي
 late int currentIndex;
 //ليت بتضمنلي ان المتعير ده يفضل نن نلابل وبتقول خلي بالك المتغير ده هياخد قيمته قبل مايتم استخدامه
   //بس طبيغس هحتاجه للانه اللي هيحخدد الكارنت دي اكتيف ولا لا بس لازم اديله فاليو والفاليو ده يساوي الانديكس كالر بتاع النوت
   //وعشان كده هروح ع الانيت استيت وهكتب اللوجيك بتاعي فيها وده عشان الانيت استيت بتتنادى قبل ما الويدجت بيلد الاساسبه تتبنى
 @override
  void initState() {
     currentIndex = kColors.indexOf(Color(widget.note.color)) ;
  // وهنا باكدله ان الكارنت انديكس هياخد قيمته قبل البيلد ويدجت والانديكس اوف انت بتديها الايليمنت وهى بترد عليك بالانديكس بتاعه ع طول
   //وهنا قلت كالر الاول عشان انا عايزه كالر عادي مش انت
    //وكل الهري ده عشان لما اجي اعدل ف نوت لون او اي حاجه يكون متظلل اللون القديم بتاعها
     super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return SizedBox(
         height: 38 * 2,
         //وطبعا يضرب معايا ايرور قبل ما احط السايزد بوكس لان الليست لازم تحددلها مساحتها طب وانا احددها ازاي ؟؟
         //اتعامل مع فلاتر بذكاء انت حاطط ف الليست دي دواير والدايره الرديس بتاعها اللي هو نص القطر برقم معين ف انت اضرب الرقم ده ف اتنين يطلعلك حجمها
         child: ListView.builder(
             itemCount: kColors.length,
             scrollDirection: Axis.horizontal,
             itemBuilder: (context, index) {
               return Padding(
                   padding: EdgeInsets.symmetric(horizontal: 6),
                   child: GestureDetector(
                     onTap: () {
                       currentIndex = index;
                       //وهنا بقوله الكارنت انديكس هيساوي الانديكس بتاع الايتم اللي ضغطت عليها وجيالي من الليست فيو دي
                       //وبكده اللي ضغطت عليها هى اللي قيمتها هتبقى بترو ولونها هيتغير
                       // BlocProvider.of<AddNoteCubit>(context).selectedColor = kColors[index];
                       widget.note.color = kColors[index].toARGB32();
                       setState(() {});
                       //وهنا بعمل سيت استيت عشان يغير اليو ايي
                     },
                     child: ColorsItem(
                       color: kColors[index],
                       //وهنا بقوله خد كالرز من الليست بتاعتي عن طريق الانديكس
                       isActive: currentIndex == index,
                       //وهنا بقوله لو الكارنت انديكس بيساوي الانديكس يبقى ترو واعرضها
                     ),
                   )
               );
             }
         )
     );
   }
 }



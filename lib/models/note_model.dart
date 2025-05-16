
 import 'package:hive/hive.dart';

 part 'note_model.g.dart';
 //وده اللي بيجنريت الفايل والجي اختصار لكلمة جينراتيد وطبعا دارت يعني عايزه لغة دارت ولو حرف غلط ف الاسم نوت موديل يبقى غلط
//flutter packages pub run build_runner build ده اللي بكتبه ف التيرمنال عشان يجنريت
@HiveType(typeId: 0)
//ده ماينفعش يتكرر الزيرو تاني ف اي كلاس جوه البروجيكت لكن اللي هيبقى جوه الكلاس من زيرو لتلاته ممكن يتكرر ف كلاسات تاني
  class NoteModel extends HiveObject {
  //وبكده خليته اوبجيكت جاهز انه يتخزن ف هايف
  //لو لاحظت فايدة هايف اوبجيكت ضافتلك ميزة انك تعمل ديليت للنوت من نوت دوت ديليت ع طول ف النوت ايتم
   @HiveField(0)
   String title;
   //المفروض انهم ب فاينال بس ممكن اغيره لو ممكن يتغير زي النوت ممكن نعملها ايديت
   @HiveField(1)
    String subTitle;
   @HiveField(2)
   final String date;
   @HiveField(3)
    int color;

  NoteModel ({
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
  });

  }
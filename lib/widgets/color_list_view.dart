

import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive, required this.color});

  final bool isActive ;
  //وده اسم احنا عاطيناه عشان نستقبله ونعرف اللون ده اللي اختارناه ولا لا
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return isActive
        ?  CircleAvatar(
      radius: 38,
      backgroundColor: Colors.white,
    child: CircleAvatar(
      radius: 34,
      backgroundColor: color,)
    )
        :  CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {


  int currentIndex = 0 ;

  List<Color> colors = const [
    Color(0xffFFC482),
    Color(0xffB3AF8F),
    Color(0xff66999B),
    Color(0xff496A81),
    Color(0xff2B3A67),
  ];
  //وهنا عادة لما بختار كالرز بروح ع جوجل اكتب colors palette generator وابيك منها الفاليو بتاع مجموعة الكالرز اللي تعجبني وبعمل ريفريش
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38*2,
        //وطبعا يضرب معايا ايرور قبل ما احط السايزد بوكس لان الليست لازم تحددلها مساحتها طب وانا احددها ازاي ؟؟
        //اتعامل مع فلاتر بذكاء انت حاطط ف الليست دي دواير والدايره الرديس بتاعها اللي هو نص القطر برقم معين ف انت اضرب الرقم ده ف اتنين يطلعلك حجمها
        child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
               child: GestureDetector(
                 onTap: () {
                   currentIndex = index ;
                   //وهنا بقوله الكارنت انديكس هيساوي الانديكس بتاع الايتم اللي ضغطت عليها وجيالي من الليست فيو دي
                 //وبكده اللي ضغطت عليها هى اللي قيمتها هتبقى بترو ولونها هيتغير
                   setState(() {

                 });
                   //وهنا بعمل سيت استيت عشان يغير اليو ايي
                 },
              child:  ColorsItem(
                color: colors[index],
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

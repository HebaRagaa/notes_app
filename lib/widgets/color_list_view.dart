

import 'package:flutter/material.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 38,
      backgroundColor: Colors.blue,
    );
  }
}

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38*2,
        //وطبعا يضرب معايا ايرور قبل ما احط السايزد بوكس لان الليست لازم تحددلها مساحتها طب وانا احددها ازاي ؟؟
        //اتعامل مع فلاتر بذكاء انت حاطط ف الليست دي دواير والدايره الرديس بتاعها اللي هو نص القطر برقم معين ف انت اضرب الرقم ده ف اتنين يطلعلك حجمها
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index) {
              return ColorsItem();
            }
        )
    );
  }
}

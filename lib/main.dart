import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/cubits/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/notes_view.dart';
import 'package:notesapp/widgets/constants.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized(); // دي كمان كويس تحطها قبل أي async
  debugPrintRebuildDirtyWidgets = true;

  Bloc.observer = SimpleBlocObserver() ;
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter()); // الأول تعرف الـ Adapter
  //وبعرف الادابتر اللي هحطه بين القوسين من الموديل نوت جنريت اللي هو اسم الكلاس فيها
  await Hive.openBox<NoteModel>(kNotesBox); // بعدين تفتح الـ box واحدد نوعه النوت موديل
  // لاحظ هنا إنك فتحت الـ box قبل ما تسجل الـ Adapter // وده ممكن يعمل مشاكل أو warning في بعض الحالات
  // ، لأن المفروض تسجل الـ Adapter الأول وبعدين تفتح الـ box.
  //وهنا بقولها يا هايف افتحي بوكس خزني فيه البيانات زي الكوليكشن ف البوست مان

  runApp(const NotesApp());
}

  class NotesApp extends StatelessWidget {
    const NotesApp({super.key});

    @override
    Widget build(BuildContext context) {
      //بنستخدم مالتي بلوك بروفايدرز لو عايز اضيف اكتر من كيوبت
    //وعايز الريسورس ده يفضل مفتوح طول الابلكيشن حتى لو مش محتاجه ف الوقت الحالي
     //وده استهلاك للريسورس لو حطيته ف المين دارت لكن الافضل ابعته للاسكرين اللي محتاجاه بس

      // return MultiBlocProvider(
      //   //ليه بستخدم الروفايدر؟ عشان ابروفيد الادد نوت كيوبت لكل التطبيق بتاعي
      //     providers: [
      //       //وبمجرد كده بيشغل الكيوبت وبيكون جاهز لاستعماله مع كل الشاشات
      //       //وده ليه؟ عشان فوق الماتريال ااب
      //       BlocProvider (create: (context) => AddNoteCubit()),
      //       //كده الكيوبت هيفضل مفتوح دايما ويستهلك ريسورسس وانا ف الابلكيشن ده مش محتاجه كده
      //     ] ,
        return MaterialApp(
          debugShowCheckedModeBanner: false,
        theme: ThemeData( brightness: Brightness.dark ,
        fontFamily: 'Poppins'
        ),
         // theme: ThemeData.dark(), = theme: ThemeData(brightness: Brightness.dark, ) = theme: ThemeData(scaffoldBackgroundColor: Colors.black)
        home: const NotesView(),

      );
    }
  }


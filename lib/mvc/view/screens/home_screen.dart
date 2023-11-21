import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/mvc/controller/map_controller.dart';
import 'package:flutter_application_1/mvc/view/widgets/loation_widget.dart';
import 'package:flutter_application_1/mvc/view/widgets/main_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  // final controller = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    
      // controller.getCurrentLocation();
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "تواصل معنا",
              style: TextStyle(color: primaryColor),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const MainWidget(icon: Icons.call, title: "اتصل بنا"),
                  const Text(
                    "رقم المتجر    0919900224",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "رقم خدمه العملاء    0928225378",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    "جاهزين لإستقبال مكالماتكم من الساعة 11 صباحاً حتى الساعة 4 مساءاً",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const MainWidget(
                      icon: Icons.language, title: "حساباتنا على السوشل ميديا"),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 15),
                      itemCount: 4,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const MainWidget(
                      icon: Icons.messenger_rounded, title: "بريدنا"),
                  const Text("magazine@beautyqueen.ly"),
                  const SizedBox(height: 50),
                  const MainWidget(
                      icon: Icons.sign_language_sharp,
                      title: "أقتراحاتكم و أستفساراتكم"),
                  Container(
                    height: 300,
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(border: Border.all(color: primaryColor)),
                  ),
                  const Text(
                    "يرجى إدخال 50 كلمة كحد أقصى*",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    "رقم الهاتف",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.width * 0.3),
                    child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor)),
                    child: const Text("ارسال"),
                  ),
                  const SizedBox(height: 30),
                  const MainWidget(
                      icon: Icons.history_rounded, title: "ساعات العمل"),
                  const Text(
                    "كل أيام الأسبوع من الساعة 10 صباحاً إلى الساعة 8:30 مساءاًيوم الجمعة من الساعة 4 بعد الظهر إلى الساعة 8:30 مساءاً",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(height: 30),
                  const MainWidget(
                      icon: Icons.location_on_outlined,
                      title: "موقعنا على خرائط قوقل"),
                  const LocationWidget(),
                ],
              ),
            ),
          ),
        );
      
  }
}

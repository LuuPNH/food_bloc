import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phannhuhailuu_17dh110419/view/home/home_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Exam App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: const Color(0xEAEAEAFF),
          appBar: AppBar(
            title: Container(
              height: 30.0,
              width: 180.0,
              decoration: BoxDecoration(
                color: const Color(0xEAEAEAFF),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(FontAwesomeIcons.mapLocationDot,
                      color: Colors.redAccent, size: 10.0),
                  SizedBox(width: 5.0),
                  Text(
                    '155 Su Van Hanh, HCM',
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    FontAwesomeIcons.angleDown,
                    color: Colors.redAccent,
                    size: 10.0,
                  ),
                ],
              ),
            ),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 5.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: const Color(0xEAEAEAFF),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/247469207_1844936579026451_2833597105913512429_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=FxaXepsj4I4AX-41wUf&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT8ns6__8qM8ereAwlpvtPTqIth33q1hhhssJxValeFVcA&oe=629192D2",
                      fit: BoxFit.cover,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: const HomeWidget(),
        ));
  }
}

// Row(
// children: [
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// children: [
// Text(state.listPizza?[index].name ?? '',
// style: const TextStyle(
// fontSize: 18.0,
// color: Colors.black,
// fontWeight: FontWeight.bold)),
// const SizedBox(
// height: 5.0,
// ),
// Text(
// 'Price: ${state.listPizza?[index].price != null ? state.listPizza![index].price!.toString() : 0} ' +
// AppStrings.usd,
// style: const TextStyle(
// fontSize: 14.0,
// color: Colors.orangeAccent,
// fontWeight: FontWeight.bold)),
// ],
// ),
// )),
// Container(
// height: 161.0,
// width: 150.0,
// padding: const EdgeInsets.all(16.0),
// decoration: const BoxDecoration(color: Colors.white),
// child: FadeInImage.assetNetwork(
// placeholder: 'assets/gif/loading.gif',
// image: state.listPizza![index].img!,
// fit: BoxFit.cover,
// ),
// )
// ],
// ),

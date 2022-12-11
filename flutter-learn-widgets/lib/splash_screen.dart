import 'package:flutter/material.dart';
import 'package:flutter_app/assets_constant.dart';
import 'package:flutter_app/text_constants.dart';

import 'bottom_naw_bar.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          //stack üst üste gelmesini sağlar
          children: [
            _backgroundImageAsset(size),
            //alt bar
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    // column alt alta sırala
                    crossAxisAlignment:
                        CrossAxisAlignment.start, //yazıların sola dayalı
                    children: [
                      _skipButton(TextConstants().skipButtonText),
                      const SizedBox(
                        height: 20,
                      ), //boşluk bırakmak
                      _splashTitleText(),
                      const SizedBox(height: 20),
                      _splashSubtitleText(size),
                    ],
                  ),
                ),
                _bottomWhiteContainer(size, context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _splashSubtitleText(Size size) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: size.width *
              0.6), //yazının kapladığı genişlik ne kadar olacağını belirledik
      child: const Text(
        TextConstants.splashSubtitleText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Text _splashTitleText() {
    return Text(
      TextConstants().splashTitleText,
      style: const TextStyle(color: Colors.white, fontSize: 55),
    );
  }

  Expanded _bottomWhiteContainer(Size size, BuildContext context) {
    return Expanded(
      //yer kaplayacak yeri ayarlamamızı sağlamak
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: size.width,
          height: size.height * 0.25,

          //decoration verirsek renk bunun içinde olmalı
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), //koşeleri yuvarlama
                  topRight: Radius.circular(30))),
          child: Column(
            children: [
              const SizedBox(height: 25),
              _startedButton(size, context),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Row _loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(TextConstants.alreadyHave),
        SizedBox(height: 50),
        Text(
          TextConstants.login,
          style: TextStyle(color: Colors.blue),
        ),

        /* TextButton(
                                onPressed: () {},
                                child: Text(TextConstants.login))*/
      ],
    );
  }

  Widget _startedButton(Size size, BuildContext context) {
    return GestureDetector(
      //butona basıldığında yönlendirilen sayfaya git
      onTap: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const BottomNavBarWidget()),
            (route) => false);
      },
      child: Card(
        elevation: 5,
        //elevation sarmaladığımız şeyin etrafına gölge ekler
        color: const Color(0xff292f3b),
        child: SizedBox(
          height: 60,
          width: size.width * 0.7,
          child: Center(
            child: Wrap(
              spacing: 10,
              children: [
                Text(
                  TextConstants.letsStarted,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _skipButton(String text) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: const EdgeInsets.all(8), // içindeki boşluk
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Image _backgroundImageAsset(Size size) {
    return Image.asset(
      AssetPathConstants().loginAssestPath,
      height: size.height,
      width: size.width,
      fit: BoxFit.cover, //ekranın tamamına sığdırma
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/assets_constant.dart';
import 'package:flutter_app/text_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _headlineRow(TextConstants.popular),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),//kaymasını sağlar
                itemCount: 5,
                scrollDirection: Axis.horizontal, //yatayda kayması
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _popularPlaceCard(size),
                  );
                },
              ),
            ),
            _headlineRow(TextConstants.recommendation),
            ListView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), //kaymasını sağlar
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: _recommendationPlacesCard(),
                  );
                })
          ],
        ),
      ),
    );
  }

  Container _recommendationPlacesCard() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _cardImage(),
            //  const SizedBox(width: 10),
            _cardLocationInfoText(),
            _locationPrice()
          ],
        ),
      ),
    );
  }

  RichText _locationPrice() {
    return RichText(
        text: const TextSpan(
            text: "\$22 ",
            style: TextStyle(color: Colors.blue, fontSize: 18),
            children: <TextSpan>[
          TextSpan(
            text: '/Person',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          )
        ]));
  }

  Column _cardLocationInfoText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Mountain Bromo'),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [
            Icon(FontAwesomeIcons.locationDot, color: Colors.grey, size: 20),
            Text('Konum Detayı')
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const [Icon(Icons.star, color: Colors.orange), Text('4.7')],
        ),
      ],
    );
  }

  ClipRRect _cardImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        AssetPathConstants().popularImage,
        height: 80,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Row _headlineRow(String text1) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, //iki row birbirinden uzak olsun
      children: [
        Text(text1),
        TextButton(
          onPressed: () {},
          child: const Text(TextConstants.seeAll),
        ),
      ],
    );
  }

  Container _popularPlaceCard(Size size) {
    return Container(
      height: 200,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: NetworkImage(AssetPathConstants().popularImage),
              fit: BoxFit.cover)),
      child: Align(
        alignment:
            Alignment.bottomCenter, // container içindekileri alta almaı sağladı
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: ListTile(
            title: const Text(
              'Amsterdam',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Row(
              children: const [
                Icon(
                  FontAwesomeIcons.locationDot,
                  size: 15,
                  color: Colors.white,
                ),
                Text('Konum Detayı', style: TextStyle(color: Colors.white)),
              ],
            ),
            //trailing arka tarafa yazı yazmayı sağlar (örneğin aynı satırda sola yaslı )
            trailing: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                Text('4.7', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      //leading ilk oluşacak widget
      leading: Icon(
        FontAwesomeIcons.locationDot,
        color: Colors.black.withOpacity(0.8),
      ),
      title: Text(
        TextConstants.appbarTitle,
        style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 15,
            letterSpacing: 0.7
            // letterSpacing: 0.7 arasındaki boşluk
            ),
      ),
      // centerTitle: true, yazıyı ortala
      //actions->appbarın sonunda gözükmesini sağlar
      actions: [
        _notificationIcon(),
      ],
    );
  }

  Padding _notificationIcon() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.topRight, //yön belirler
        children: [
          Icon(
            FontAwesomeIcons.bell,
            color: Colors.black.withOpacity(0.8),
          ),
          Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: const Text('.'),
          )
        ],
      ),
    );
  }
}

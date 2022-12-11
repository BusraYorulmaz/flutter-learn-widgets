import 'package:flutter/material.dart';
import 'package:flutter_app/list_tab.dart';

import 'form_tab.dart';

class Widgetlar2 extends StatefulWidget {
  const Widgetlar2({Key? key}) : super(key: key);

  @override
  State<Widgetlar2> createState() => _Widgetlar2State();
}

class _Widgetlar2State extends State<Widgetlar2> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //SliverAppBar-> kaydırılabilir appbar
                title: Text("widgetler2"),
                expandedHeight: 200, //kaydırılabilir appbar genişliği
                pinned: true, //tamamen kaybolmaması için
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    'https://gaiadergi.com/wp-content/uploads/2015/01/hayat-a%C4%9Fac%C4%B1-bilgeli%C4%9Fi-kapak-.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: TabBar(
                  labelColor: Colors.black, //seçili olan taba renk verme
                  unselectedLabelColor:
                      Colors.orange, //seçili olmayan taba renk verme
                  indicatorColor:
                      Colors.indigo, //seçili olan kısmın alt kısmına renk verme
                  tabs: [
                    Tab(
                      icon: Icon(Icons.edit),
                      text: 'Form',
                    ),
                    Tab(
                      icon: Icon(Icons.list),
                      child: Text('List'),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [FormTab(), ListTab()],
          ),
        )));
  }
}

import 'package:flutter/material.dart';

class ListTab extends StatefulWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 20, //yanyana containerin arasını açar
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          itemCount: 5,
          itemBuilder: (context, int index) {
            return InkWell(
              //alttan container açılması
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Column(
                          children: [
                            ElevatedButton(
                              child: const Text('close bottom'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.black45 : Colors.black26,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(child: Text("$index")),
              ),
            );
          }),
    );
  }
}

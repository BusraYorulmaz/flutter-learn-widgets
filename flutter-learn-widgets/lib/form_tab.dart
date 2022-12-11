import 'package:flutter/material.dart';

class FormTab extends StatefulWidget {
  const FormTab({Key? key}) : super(key: key);

  @override
  State<FormTab> createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isOkey = false;
  String dropdownValue = 'Ataşehir';
  var items = ['Ataşehir', 'Maltepe', 'Bostancı'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          // vertical dikey ynde kaydırma , horizontal yatay yönde kaydırma
          children: [
            Column(
              children: [
                _customTextFormField(),
                const SizedBox(height: 15),
                _customCheckBoxy(),
                const SizedBox(height: 15),
                _dropdownButton(),
                Opacity(opacity: 0.5, child: _customElevatedButton(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _dropdownButton() {
    return DropdownButton<String>(
        value: dropdownValue,
        items: items.map((String item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        });
  }

  Visibility _customCheckBoxy() {
    return Visibility(
      //Visibility -> istediğimiz durumlarda görünür istemediğimiz durumlarda görünmez olmasını sağlar.
      visible: true,
      child: CheckboxListTile(
        value: isOkey,
        onChanged: (newWalue) {
          setState(() {
            isOkey = !isOkey;
          });
        },
        title: const Text(
          "bilgilerimin kaydedilmesini istiyorum",
        ),
        controlAffinity:
            ListTileControlAffinity.leading, // leading->kutuyu başa alma
      ),
    );
  }

  ElevatedButton _customElevatedButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Bu işlem Başarılı')));
        }
      },
      icon: const Icon(Icons.check),
      label: const Text("onayla"),
    );
  }

  Form _customTextFormField() {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.abc),
          //labelText: 'isim', //label üstte kalır
          hintText: 'Name',
          contentPadding: EdgeInsets.all(10), //inputlarda yazarken kaybolur
        ),
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return ' Bu kısım boş bırakılamaz';
          }
        },
        //keyboardType->açılan klavyede nelel gözükeceğini ayarlarız
      ),
    );
  }
}

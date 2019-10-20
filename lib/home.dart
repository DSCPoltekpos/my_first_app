import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_first_app/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final panjang = TextEditingController();
  final tinggi = TextEditingController();
  final lebar = TextEditingController();
  double hasil;

  void calculate() {
    setState(() {
      hasil = (double.parse(panjang.text) * double.parse(tinggi.text) * double.parse(lebar.text));
    });
  }

  @override
  void dispose() {
    panjang.dispose();
    tinggi.dispose();
    lebar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[0-9]")),
            ],
            controller: panjang,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Panjang",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[0-9]")),
            ],
            controller: tinggi,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Lebar",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[0-9]")),
            ],
            controller: lebar,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Tinggi",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[200],
                ),
              ),
            ),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              hasil == null ? "Hasil = " : "Hasil = $hasil",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          calculateButton(),
        ],
      ),
    );
  }

  Widget calculateButton() {
    return Center(
      child: RaisedGradientButton(
        width: MediaQuery.of(context).size.width / 1.5,
        text: 'Calculate',
        gradient: LinearGradient(
          colors: <Color>[Colors.blue, Colors.green],
        ),
        onPressed: () {
          calculate();
        },
      ),
    );
  }
}
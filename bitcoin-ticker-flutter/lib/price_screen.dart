import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String selectedCurrency;



  @override
  Widget build(BuildContext context) {

    DropdownButton<String> getDropDownButton(){
      List<DropdownMenuItem<String>> menuItems = [];
      for(String s in currenciesList){
        menuItems.add(DropdownMenuItem<String>(value: s, child: Text(s)));
      }
      return DropdownButton<String>(
        value: selectedCurrency,
        items: menuItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
          });
        },
      );
    }

    CupertinoPicker getIOSPicker(){
      return CupertinoPicker();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? getDropDownButton() : getIOSPicker(),
          ),
        ],
      ),
    );
  }
}

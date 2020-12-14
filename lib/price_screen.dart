import 'dart:ffi';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;


class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  String coinValue;

  String selectedCurrency = currenciesList.isNotEmpty? currenciesList[0] : "";

  List<DropdownMenuItem<String>> getCurrencies(){
    List<DropdownMenuItem<String>> list = List();
    for(String s in currenciesList){
      list.add(new DropdownMenuItem(child: Text(s), value: s));
    }
    return list;
  }

  void getCoinValue(String currency) async{
    CoinData coinData = CoinData();
    var cd = await coinData.getCoinData(currency);
    print(cd);
    setState(() {
      double cv = cd['rate'];
      this.coinValue = cv!=null ? cv.toStringAsFixed(2) : "";
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoinValue('USD');
  }

  @override
  Widget build(BuildContext context) {
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
                  '1 BTC = $coinValue USD',
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
            child: Platform.isIOS ? CupertinoPicker :  DropdownButton<String>(
              value: selectedCurrency,
              items: getCurrencies(),
              onChanged: (value){
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

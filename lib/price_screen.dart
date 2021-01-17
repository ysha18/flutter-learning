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
  List<CryptoCard> cards = [];

  String selectedCurrency = currenciesList.isNotEmpty ? currenciesList[0] : "";

  List<DropdownMenuItem<String>> getCurrencies(){
    List<DropdownMenuItem<String>> list = List();
    for(String s in currenciesList){
      list.add(new DropdownMenuItem(child: Text(s), value: s));
    }
    return list;
  }

  void getCoinValue(String currency) async{
    CoinData coinData = CoinData();
    for(String cryptoCurr in cryptoList){
      var cd = await coinData.getCoinData(currency,cryptoCurr);
      double cv = cd['rate'];
      this.coinValue = cv!=null ? cv.toStringAsFixed(0) : '?';
      setState(() {
        cards.add(CryptoCard(
            coinValue: this.coinValue,
            selectedCurrency: selectedCurrency,
            cryptoCurr: cryptoCurr));
      });

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCoinValue(selectedCurrency);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cards,
            )
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
                cards=[];
                setState(() {
                  selectedCurrency = value;
                  getCoinValue(selectedCurrency);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    @required this.coinValue,
    @required this.selectedCurrency,
    @required this.cryptoCurr
  });

  final String coinValue;
  final String selectedCurrency;
  final String cryptoCurr;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $cryptoCurr = $coinValue $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

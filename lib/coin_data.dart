import 'networkHelper.dart';

const urlBase = 'https://rest.coinapi.io/v1/exchangerate/BTC/';
const apiKey = '?apikey=09ED88AC-FDD9-492F-BF6D-1154977C8366';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {

  Future getCoinData(String currency) async{
    NetworkHelper helper = NetworkHelper(urlBase+currency+apiKey);
    print(urlBase+currency+apiKey);
    return await helper.getData();
  }
}

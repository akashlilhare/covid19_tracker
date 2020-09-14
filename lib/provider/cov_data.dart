
import 'casesChat.dart';

class CovData {
  List<Cases> confirmed;
  List<Cases> death;
  List<Cases> recovered;
  List<Cases> active;

  CovData({
    this.active,
    this.death,
    this.recovered,
    this.confirmed,
  });
}


enum Country {
  kenya,
  ghana,
  nigeria,
  egypt,
  other,
}

extension CountryExtension on Country{

  // 国际区号
  String get phoneCode {
    return ["+254","+233","+234","+20",""][index];
  }
  // 国家码
  String get countryCode{
    return ["KE","GH","NG","EG",""][index];
  }

  // 币种
  String get currency{
    return ["KES","GHS","NGN","EGP",""][index];
  }

  // 货币符号
  String get symbol{
    return ["KSh","₵","₦","EGP",""][index];
  }

}
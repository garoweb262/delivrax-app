class Endpoints {
  Endpoints._();

  // ALL PRODUCTION BASEURL
  static const String baseUrl = "https://baseurl/v1";

//___________________________ORDER____________________
  static const String checkOutOrder = '/user/orders';

  // receiveTimeout
  static const int receiveTimeout = 20000;

  // connectTimeout
  static const int connectionTimeout = 20000;
//_________________________________________AUTH_____________________________________________
  static const String register = '/auth/sign-up';
  static const String verifyEmailOTP = '/auth/verify-otp';
  static const String logout = '/auth/logout';

// ______________________________Transactions______________________________
  static const String getWalletBal = '/account/me';
  static const String wallet2Wallet = '/account/transfer';

  static const String addAddress = '/user/addresses';

  //---------------------Refresh Token--------------------------
  static const String refreshToken = '/api/v1/auth/refresh/token';
//---------------------------Merchant Onboarding Process-----------------------------

  //________________________________PRODUCT______________________________________


  static String categoryProduct(String id) {
    return "/products?categoryId=$id";
  }
 static String deleteFavorite(String id) {
    return "/user/products/favourites/$id";
  }
  
  static String requestAction(String id) {
    return "/account/fund-request/$id";
  }

  //____________________________SECURED STORAGE KEY_______________________
  static const String oneSignalAppID = 'fdf7d570-e151-4eaa-846a-e8de76765438';
  static const String access_token = 'access_token';
  static const String whatsappFilePath = 'whatsappFilePath';
  static const String refresh_token = 'refresh_token';
  static const String firstTime = '0';
  static const String userDataMap = 'userDataMap';
  static const String userStore = 'userStore';
  static const String userName = 'userName';
  static const String showBalance = 'showBalance';
  static const String biometric = 'biometric';
  static const String transactionPin = 'transactionPin';
  static const String deviceNotiId = 'deviceNotiId';
}

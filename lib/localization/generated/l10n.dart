// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login Successfully`
  String get loginSuccessfully {
    return Intl.message(
      'Login Successfully',
      name: 'loginSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Login to continue process`
  String get loginToContinueProcess {
    return Intl.message(
      'Login to continue process',
      name: 'loginToContinueProcess',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'please enter your Password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Click Here`
  String get clickHere {
    return Intl.message(
      'Click Here',
      name: 'clickHere',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Register now to browse our hot offers`
  String get registerNowToBrowseOurHotOffers {
    return Intl.message(
      'Register now to browse our hot offers',
      name: 'registerNowToBrowseOurHotOffers',
      desc: '',
      args: [],
    );
  }

  /// `please enter your name`
  String get pleaseEnterYourName {
    return Intl.message(
      'please enter your name',
      name: 'pleaseEnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `please enter your phone`
  String get pleaseEnterYourPhone {
    return Intl.message(
      'please enter your phone',
      name: 'pleaseEnterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `password is too short`
  String get passwordIsTooShort {
    return Intl.message(
      'password is too short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `login in`
  String get loginIn {
    return Intl.message(
      'login in',
      name: 'loginIn',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `No Result`
  String get noResult {
    return Intl.message(
      'No Result',
      name: 'noResult',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `DISCOUNT`
  String get discount {
    return Intl.message(
      'DISCOUNT',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Go To Cart`
  String get goToCart {
    return Intl.message(
      'Go To Cart',
      name: 'goToCart',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addToCart {
    return Intl.message(
      'Add To Cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add Your New Address`
  String get addYourNewAddress {
    return Intl.message(
      'Add Your New Address',
      name: 'addYourNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `your name`
  String get yourName {
    return Intl.message(
      'your name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `name is required`
  String get nameIsRequired {
    return Intl.message(
      'name is required',
      name: 'nameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `name of your city`
  String get nameOfYourCity {
    return Intl.message(
      'name of your city',
      name: 'nameOfYourCity',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `this field must not be empty`
  String get thisFieldMustNotBeEmpty {
    return Intl.message(
      'this field must not be empty',
      name: 'thisFieldMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `name of your region`
  String get nameOfYourRegion {
    return Intl.message(
      'name of your region',
      name: 'nameOfYourRegion',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get region {
    return Intl.message(
      'Region',
      name: 'region',
      desc: '',
      args: [],
    );
  }

  /// `details of your region`
  String get detailsOfYourRegion {
    return Intl.message(
      'details of your region',
      name: 'detailsOfYourRegion',
      desc: '',
      args: [],
    );
  }

  /// `your notes (optional)`
  String get yourNotes {
    return Intl.message(
      'your notes (optional)',
      name: 'yourNotes',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Total :  `
  String get total {
    return Intl.message(
      'Total :  ',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get buyNow {
    return Intl.message(
      'Buy Now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Change Your Address`
  String get changeYourAddress {
    return Intl.message(
      'Change Your Address',
      name: 'changeYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Address`
  String get chooseYourAddress {
    return Intl.message(
      'Choose Your Address',
      name: 'chooseYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `New Address`
  String get newAddress {
    return Intl.message(
      'New Address',
      name: 'newAddress',
      desc: '',
      args: [],
    );
  }

  /// `Note: \n address you chose will receive\n your order,So be sure to choose \nthe address accurately `
  String get warningInChooseAddress {
    return Intl.message(
      'Note: \n address you chose will receive\n your order,So be sure to choose \nthe address accurately ',
      name: 'warningInChooseAddress',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to pay online or  in\ncash?`
  String get howToPay {
    return Intl.message(
      'Do you want to pay online or  in\ncash?',
      name: 'howToPay',
      desc: '',
      args: [],
    );
  }

  /// `The order has been successfully added to the order list. You will \n receive the order within two days `
  String get successOrderCache {
    return Intl.message(
      'The order has been successfully added to the order list. You will \n receive the order within two days ',
      name: 'successOrderCache',
      desc: '',
      args: [],
    );
  }

  /// `The order was placed successfully`
  String get successOrderOnline {
    return Intl.message(
      'The order was placed successfully',
      name: 'successOrderOnline',
      desc: '',
      args: [],
    );
  }

  /// `Client Name :`
  String get clientName {
    return Intl.message(
      'Client Name :',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `City Name :  `
  String get cityName {
    return Intl.message(
      'City Name :  ',
      name: 'cityName',
      desc: '',
      args: [],
    );
  }

  /// `cash`
  String get cash {
    return Intl.message(
      'cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `online`
  String get online {
    return Intl.message(
      'online',
      name: 'online',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `old password`
  String get oldPassword {
    return Intl.message(
      'old password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `new password Must Not Be Empty `
  String get newPasswordMustNotBeEmpty {
    return Intl.message(
      'new password Must Not Be Empty ',
      name: 'newPasswordMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `password must be at least 6 character`
  String get passwordMustBeAtLeast6Character {
    return Intl.message(
      'password must be at least 6 character',
      name: 'passwordMustBeAtLeast6Character',
      desc: '',
      args: [],
    );
  }

  /// `please, verify old password and try again`
  String get verifyOldPasswordAndTryAgain {
    return Intl.message(
      'please, verify old password and try again',
      name: 'verifyOldPasswordAndTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `old password Must Not Be Empty`
  String get oldPasswordMustNotBeEmpty {
    return Intl.message(
      'old password Must Not Be Empty',
      name: 'oldPasswordMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Name Must Not Be Empty `
  String get nameMustNotBeEmpty {
    return Intl.message(
      'Name Must Not Be Empty ',
      name: 'nameMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email Must Not Be Empty `
  String get emailMustNotBeEmpty {
    return Intl.message(
      'Email Must Not Be Empty ',
      name: 'emailMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `EmailAddress`
  String get emailAddress {
    return Intl.message(
      'EmailAddress',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Phone Must Not Be Empty `
  String get phoneMustNotBeEmpty {
    return Intl.message(
      'Phone Must Not Be Empty ',
      name: 'phoneMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `address`
  String get address {
    return Intl.message(
      'address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `payment-method:`
  String get paymentMethod {
    return Intl.message(
      'payment-method:',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get quantity {
    return Intl.message(
      'quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `cost/one`
  String get costPerOne {
    return Intl.message(
      'cost/one',
      name: 'costPerOne',
      desc: '',
      args: [],
    );
  }

  /// `Cost :`
  String get cost {
    return Intl.message(
      'Cost :',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `points :`
  String get points {
    return Intl.message(
      'points :',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `vat :`
  String get vat {
    return Intl.message(
      'vat :',
      name: 'vat',
      desc: '',
      args: [],
    );
  }

  /// `go to home`
  String get goToHome {
    return Intl.message(
      'go to home',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `This order is already cancelled`
  String get thisOrderIsAlreadyCancelled {
    return Intl.message(
      'This order is already cancelled',
      name: 'thisOrderIsAlreadyCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Do You want cancel this order?`
  String get doYouWantCancelThisOrder {
    return Intl.message(
      'Do You want cancel this order?',
      name: 'doYouWantCancelThisOrder',
      desc: '',
      args: [],
    );
  }

  /// `The order has been successfully canceled `
  String get theOrderHasBeenSuccessfullyCanceled {
    return Intl.message(
      'The order has been successfully canceled ',
      name: 'theOrderHasBeenSuccessfullyCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Your Order`
  String get yourOrder {
    return Intl.message(
      'Your Order',
      name: 'yourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your message `
  String get pleaseEnterYourMessage {
    return Intl.message(
      'Please enter your message ',
      name: 'pleaseEnterYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Message`
  String get enterYourMessage {
    return Intl.message(
      'Enter your Message',
      name: 'enterYourMessage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

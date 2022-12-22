import 'package:flutter/cupertino.dart';
import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';
import 'package:flutter_loyalty_point/src/models/faq/response_get_faq_list_model.dart';
import 'package:flutter_loyalty_point/src/services/api/faq_api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/types/view_state_type.dart';

class FAQViewModel extends ChangeNotifier {
  FAQViewModel() {
    getFAQList();
    getGeneralFAQList();
    getPaymentFAQList();
    getTransactionStatusFAQList();
  }

  ViewStateType get faqListState => _faqListState;
  ViewStateType _faqListState = ViewStateType.loading;

  List<FaqModel> _dataFAQ = [];
  List<FaqModel> get dataFAQ => _dataFAQ;

  List<FaqModel> _dataFAQGeneral = [];
  List<FaqModel> get dataFAQGeneral => _dataFAQGeneral;

  List<FaqModel> _dataFAQTransactionStatus = [];
  List<FaqModel> get dataFAQTransactionStatus => _dataFAQTransactionStatus;

  List<FaqModel> _dataFAQPayment = [];
  List<FaqModel> get dataFAQPayment => _dataFAQPayment;

  void _changeFAQListState(ViewStateType state) {
    _faqListState = state;
    notifyListeners();
  }

  void toCustomerService() async {
    await launchUrlString(
      "https://wa.me/6288287112431",
      mode: LaunchMode.externalNonBrowserApplication,
    );
  }

  Future<void> getFAQList() async {
    _changeFAQListState(ViewStateType.loading);
    try {
      final result = await FAQApiService().getFAQListFromAPI();
      _dataFAQ = result;
      _changeFAQListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeFAQListState(ViewStateType.error);
    }
  }

  Future<void> getGeneralFAQList() async {
    _changeFAQListState(ViewStateType.loading);
    try {
      final result = await FAQApiService().getGeneralFAQListFromAPI();
      _dataFAQGeneral = result;
      _changeFAQListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeFAQListState(ViewStateType.error);
    }
  }

  Future<void> getTransactionStatusFAQList() async {
    _changeFAQListState(ViewStateType.loading);
    try {
      final result = await FAQApiService().getTransactionStatusFAQListFromAPI();
      _dataFAQTransactionStatus = result;
      _changeFAQListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeFAQListState(ViewStateType.error);
    }
  }

  Future<void> getPaymentFAQList() async {
    _changeFAQListState(ViewStateType.loading);
    try {
      final result = await FAQApiService().getPaymentFAQListFromAPI();
      _dataFAQPayment = result;
      _changeFAQListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeFAQListState(ViewStateType.error);
    }
  }
}

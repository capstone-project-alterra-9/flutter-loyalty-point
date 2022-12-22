import 'package:flutter/cupertino.dart';
import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';
import 'package:flutter_loyalty_point/src/models/faq/response_get_faq_list_model.dart';
import 'package:flutter_loyalty_point/src/services/api/faq_api_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/types/view_state_type.dart';

class GeneralFAQViewModel extends ChangeNotifier {
  GeneralFAQViewModel() {
    getGeneralFAQList();
  }

  ViewStateType get faqListState => _faqListState;
  ViewStateType _faqListState = ViewStateType.loading;

  List<FaqModel> _dataFAQ = [];
  List<FaqModel> get dataFAQ => _dataFAQ;

  void _changeFAQListState(ViewStateType state) {
    _faqListState = state;
    notifyListeners();
  }

  Future<void> getGeneralFAQList() async {
    _changeFAQListState(ViewStateType.loading);
    try {
      final result = await FAQApiService().getGeneralFAQListFromAPI();
      _dataFAQ = result;
      _changeFAQListState(ViewStateType.none);
      notifyListeners();
    } catch (e) {
      _changeFAQListState(ViewStateType.error);
    }
  }
}

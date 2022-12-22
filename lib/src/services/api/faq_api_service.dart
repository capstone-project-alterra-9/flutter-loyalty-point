import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';
import 'package:flutter_loyalty_point/src/models/faq/response_get_faq_list_model.dart';

import '../../configs/api/api_config.dart';
import '../../utils/urls.dart';

class FAQApiService {
  final APIConfig _apiConfig = APIConfig();
  Future<List<FaqModel>> getFAQListFromAPI() async {
    try {
      Response response = await _apiConfig.dio.get(
        Urls.FAQPath,
      );

      List<FaqModel> faqList = [];
      faqList.add(FaqModel.fromJson(response.data));

      return faqList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FaqModel>> getGeneralFAQListFromAPI() async {
    final response = await _apiConfig.dio.get(
      Urls.FAQPath,
    );
    List<FaqModel> faqModelList = [];

    if (response.data != null) {
      if (response.data["category"] == "general") {
        faqModelList.add(FaqModel.fromJson(response.data));
        return faqModelList;
      }
    }
    return [];
  }

  Future<List<FaqModel>> getTransactionStatusFAQListFromAPI() async {
    final response = await _apiConfig.dio.get(
      Urls.FAQPath,
    );
    List<FaqModel> faqModelList = [];

    if (response.data != null) {
      if (response.data["category"] == "transaction") {
        faqModelList.add(FaqModel.fromJson(response.data));
        return faqModelList;
      }
    }
    return [];
  }

  Future<List<FaqModel>> getPaymentFAQListFromAPI() async {
    final response = await _apiConfig.dio.get(
      Urls.FAQPath,
    );
    List<FaqModel> faqModelList = [];

    if (response.data != null) {
      if (response.data["category"] == "payment") {
        faqModelList.add(FaqModel.fromJson(response.data));
        return faqModelList;
      }
    }
    return [];
  }
}

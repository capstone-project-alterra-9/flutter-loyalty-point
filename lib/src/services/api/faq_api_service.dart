import 'package:dio/dio.dart';
import 'package:flutter_loyalty_point/src/models/faq/faq_model.dart';

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
    try {
      final response = await _apiConfig.dio.get(
        Urls.FAQPath,
      );
      List<FaqModel> faqModelList = [];

      if (response.data != null) {
        response.data['data'].forEach((x) {
          if (x["category"] == "general") {
            faqModelList.add(FaqModel.fromJson(x));
          }
        });
      }

      return faqModelList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FaqModel>> getTransactionStatusFAQListFromAPI() async {
    try {
      final response = await _apiConfig.dio.get(
        Urls.FAQPath,
      );
      List<FaqModel> faqModelList = [];

      if (response.data != null) {
        response.data['data'].forEach((x) {
          if (x["category"] == "transaction") {
            faqModelList.add(FaqModel.fromJson(x));
          }
        });
      }

      return faqModelList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FaqModel>> getPaymentFAQListFromAPI() async {
    try {
      final response = await _apiConfig.dio.get(
        Urls.FAQPath,
      );
      List<FaqModel> faqModelList = [];

      if (response.data != null) {
        response.data['data'].forEach((x) {
          if (x["category"] == "payment") {
            faqModelList.add(FaqModel.fromJson(x));
          }
        });
      }

      return faqModelList;
    } catch (e) {
      rethrow;
    }
  }
}

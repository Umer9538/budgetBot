import 'category_values.dart';

/// Group extension for CategoryType
extension CategoryTypeGroupExtension on CategoryType {
  CategoryGroup get group {
    switch (this) {
      case CategoryType.salary:
      case CategoryType.freelance:
      case CategoryType.investments:
      case CategoryType.otherIncome:
        return CategoryGroup.income;

      case CategoryType.rentMortgage:
      case CategoryType.utilities:
      case CategoryType.maintenance:
      case CategoryType.phoneAndInternet:
        return CategoryGroup.housing;

      case CategoryType.fuel:
      case CategoryType.publicTransit:
      case CategoryType.rideShare:
      case CategoryType.carPayment:
        return CategoryGroup.transportation;

      case CategoryType.groceries:
      case CategoryType.restaurants:
      case CategoryType.coffeeShops:
      case CategoryType.foodDelivery:
        return CategoryGroup.foodAndDining;

      case CategoryType.clothing:
      case CategoryType.electronics:
      case CategoryType.homeGoods:
      case CategoryType.onlineShopping:
        return CategoryGroup.shopping;

      case CategoryType.streamingServices:
      case CategoryType.gaming:
      case CategoryType.eventsAndConcerts:
      case CategoryType.hobbies:
        return CategoryGroup.entertainment;

      case CategoryType.medical:
      case CategoryType.pharmacy:
      case CategoryType.fitness:
      case CategoryType.mentalHealth:
      case CategoryType.personalCare:
        return CategoryGroup.health;

      case CategoryType.investmentContributions:
      case CategoryType.fees:
      case CategoryType.insurance:
      case CategoryType.taxes:
      case CategoryType.savings:
        return CategoryGroup.financial;

      case CategoryType.gifts:
      case CategoryType.charity:
      case CategoryType.education:
      case CategoryType.miscellaneous:
        return CategoryGroup.other;
    }
  }

  bool get isIncome => group == CategoryGroup.income;

  bool get isExpense => !isIncome;
}

/// Categories list extension for CategoryGroup
extension CategoryGroupCategoriesExtension on CategoryGroup {
  List<CategoryType> get categories {
    return CategoryType.values.where((c) => c.group == this).toList();
  }
}

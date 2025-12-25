import 'category_values.dart';

/// Icon extension for CategoryType
extension CategoryTypeIconExtension on CategoryType {
  String get icon {
    switch (this) {
      // Income
      case CategoryType.salary:
        return '💼';
      case CategoryType.freelance:
        return '💻';
      case CategoryType.investments:
        return '📈';
      case CategoryType.otherIncome:
        return '💵';

      // Housing
      case CategoryType.rentMortgage:
        return '🏠';
      case CategoryType.utilities:
        return '💡';
      case CategoryType.maintenance:
        return '🔧';
      case CategoryType.phoneAndInternet:
        return '📶';

      // Transportation
      case CategoryType.fuel:
        return '⛽';
      case CategoryType.publicTransit:
        return '🚇';
      case CategoryType.rideShare:
        return '🚗';
      case CategoryType.carPayment:
        return '🚙';

      // Food & Dining
      case CategoryType.groceries:
        return '🛒';
      case CategoryType.restaurants:
        return '🍽️';
      case CategoryType.coffeeShops:
        return '☕';
      case CategoryType.foodDelivery:
        return '🛵';

      // Shopping
      case CategoryType.clothing:
        return '👕';
      case CategoryType.electronics:
        return '📱';
      case CategoryType.homeGoods:
        return '🛋️';
      case CategoryType.onlineShopping:
        return '📦';

      // Entertainment
      case CategoryType.streamingServices:
        return '📺';
      case CategoryType.gaming:
        return '🎮';
      case CategoryType.eventsAndConcerts:
        return '🎫';
      case CategoryType.hobbies:
        return '🎨';

      // Health & Personal Care
      case CategoryType.medical:
        return '🏥';
      case CategoryType.pharmacy:
        return '💊';
      case CategoryType.fitness:
        return '🏋️';
      case CategoryType.mentalHealth:
        return '🧘';
      case CategoryType.personalCare:
        return '💆';

      // Financial
      case CategoryType.investmentContributions:
        return '💹';
      case CategoryType.fees:
        return '🏦';
      case CategoryType.insurance:
        return '🛡️';
      case CategoryType.taxes:
        return '📋';
      case CategoryType.savings:
        return '🏧';

      // Other
      case CategoryType.gifts:
        return '🎁';
      case CategoryType.charity:
        return '❤️';
      case CategoryType.education:
        return '📚';
      case CategoryType.miscellaneous:
        return '📌';
    }
  }
}

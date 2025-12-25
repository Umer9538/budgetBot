import 'category_values.dart';

/// Display name extension for CategoryType
extension CategoryTypeDisplayExtension on CategoryType {
  String get displayName {
    switch (this) {
      // Income
      case CategoryType.salary:
        return 'Salary';
      case CategoryType.freelance:
        return 'Freelance';
      case CategoryType.investments:
        return 'Investments';
      case CategoryType.otherIncome:
        return 'Other Income';

      // Housing
      case CategoryType.rentMortgage:
        return 'Rent/Mortgage';
      case CategoryType.utilities:
        return 'Utilities';
      case CategoryType.maintenance:
        return 'Maintenance';
      case CategoryType.phoneAndInternet:
        return 'Phone & Internet';

      // Transportation
      case CategoryType.fuel:
        return 'Fuel';
      case CategoryType.publicTransit:
        return 'Public Transit';
      case CategoryType.rideShare:
        return 'Ride Share';
      case CategoryType.carPayment:
        return 'Car Payment';

      // Food & Dining
      case CategoryType.groceries:
        return 'Groceries';
      case CategoryType.restaurants:
        return 'Restaurants';
      case CategoryType.coffeeShops:
        return 'Coffee Shops';
      case CategoryType.foodDelivery:
        return 'Food Delivery';

      // Shopping
      case CategoryType.clothing:
        return 'Clothing';
      case CategoryType.electronics:
        return 'Electronics';
      case CategoryType.homeGoods:
        return 'Home Goods';
      case CategoryType.onlineShopping:
        return 'Online Shopping';

      // Entertainment
      case CategoryType.streamingServices:
        return 'Streaming Services';
      case CategoryType.gaming:
        return 'Gaming';
      case CategoryType.eventsAndConcerts:
        return 'Events & Concerts';
      case CategoryType.hobbies:
        return 'Hobbies';

      // Health & Personal Care
      case CategoryType.medical:
        return 'Medical';
      case CategoryType.pharmacy:
        return 'Pharmacy';
      case CategoryType.fitness:
        return 'Fitness';
      case CategoryType.mentalHealth:
        return 'Mental Health';
      case CategoryType.personalCare:
        return 'Personal Care';

      // Financial
      case CategoryType.investmentContributions:
        return 'Investment Contributions';
      case CategoryType.fees:
        return 'Fees';
      case CategoryType.insurance:
        return 'Insurance';
      case CategoryType.taxes:
        return 'Taxes';
      case CategoryType.savings:
        return 'Savings';

      // Other
      case CategoryType.gifts:
        return 'Gifts';
      case CategoryType.charity:
        return 'Charity';
      case CategoryType.education:
        return 'Education';
      case CategoryType.miscellaneous:
        return 'Miscellaneous';
    }
  }
}

/// Display name extension for CategoryGroup
extension CategoryGroupDisplayExtension on CategoryGroup {
  String get displayName {
    switch (this) {
      case CategoryGroup.income:
        return 'Income';
      case CategoryGroup.housing:
        return 'Housing';
      case CategoryGroup.transportation:
        return 'Transportation';
      case CategoryGroup.foodAndDining:
        return 'Food & Dining';
      case CategoryGroup.shopping:
        return 'Shopping';
      case CategoryGroup.entertainment:
        return 'Entertainment';
      case CategoryGroup.health:
        return 'Health';
      case CategoryGroup.healthAndWellness:
        return 'Health & Wellness';
      case CategoryGroup.financial:
        return 'Financial';
      case CategoryGroup.other:
        return 'Other';
    }
  }
}

import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'category_values.dart';
import 'category_groups.dart';

/// UI helper extensions for CategoryType
extension CategoryTypeUIExtension on CategoryType {
  /// Get Material icon for the category
  IconData get iconData {
    switch (this) {
      // Income
      case CategoryType.salary:
        return Icons.work;
      case CategoryType.freelance:
        return Icons.laptop_mac;
      case CategoryType.investments:
        return Icons.trending_up;
      case CategoryType.otherIncome:
        return Icons.attach_money;

      // Housing
      case CategoryType.rentMortgage:
        return Icons.home;
      case CategoryType.utilities:
        return Icons.lightbulb;
      case CategoryType.maintenance:
        return Icons.build;
      case CategoryType.phoneAndInternet:
        return Icons.wifi;

      // Transportation
      case CategoryType.fuel:
        return Icons.local_gas_station;
      case CategoryType.publicTransit:
        return Icons.directions_bus;
      case CategoryType.rideShare:
        return Icons.directions_car;
      case CategoryType.carPayment:
        return Icons.car_rental;

      // Food & Dining
      case CategoryType.groceries:
        return Icons.shopping_cart;
      case CategoryType.restaurants:
        return Icons.restaurant;
      case CategoryType.coffeeShops:
        return Icons.coffee;
      case CategoryType.foodDelivery:
        return Icons.delivery_dining;

      // Shopping
      case CategoryType.clothing:
        return Icons.checkroom;
      case CategoryType.electronics:
        return Icons.smartphone;
      case CategoryType.homeGoods:
        return Icons.weekend;
      case CategoryType.onlineShopping:
        return Icons.inventory_2;

      // Entertainment
      case CategoryType.streamingServices:
        return Icons.subscriptions;
      case CategoryType.gaming:
        return Icons.sports_esports;
      case CategoryType.eventsAndConcerts:
        return Icons.confirmation_number;
      case CategoryType.hobbies:
        return Icons.palette;

      // Health & Personal Care
      case CategoryType.medical:
        return Icons.local_hospital;
      case CategoryType.pharmacy:
        return Icons.medication;
      case CategoryType.fitness:
        return Icons.fitness_center;
      case CategoryType.mentalHealth:
        return Icons.self_improvement;
      case CategoryType.personalCare:
        return Icons.spa;

      // Financial
      case CategoryType.investmentContributions:
        return Icons.savings;
      case CategoryType.fees:
        return Icons.account_balance;
      case CategoryType.insurance:
        return Icons.security;
      case CategoryType.taxes:
        return Icons.receipt_long;
      case CategoryType.savings:
        return Icons.account_balance_wallet;

      // Other
      case CategoryType.gifts:
        return Icons.card_giftcard;
      case CategoryType.charity:
        return Icons.volunteer_activism;
      case CategoryType.education:
        return Icons.school;
      case CategoryType.miscellaneous:
        return Icons.more_horiz;
    }
  }

  /// Get color for the category based on group
  Color get color {
    switch (group) {
      case CategoryGroup.income:
        return AppColors.categoryIncome;
      case CategoryGroup.housing:
        return AppColors.categoryHousing;
      case CategoryGroup.transportation:
        return AppColors.categoryTransportation;
      case CategoryGroup.foodAndDining:
        return AppColors.categoryFood;
      case CategoryGroup.shopping:
        return AppColors.categoryShopping;
      case CategoryGroup.entertainment:
        return AppColors.categoryEntertainment;
      case CategoryGroup.health:
      case CategoryGroup.healthAndWellness:
        return AppColors.categoryHealth;
      case CategoryGroup.financial:
        return AppColors.categoryFinancial;
      case CategoryGroup.other:
        return AppColors.categoryOther;
    }
  }
}

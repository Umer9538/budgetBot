/// Enum representing spending/income categories
enum CategoryType {
  // Income Categories
  salary,
  freelance,
  investments,
  otherIncome,

  // Housing
  rentMortgage,
  utilities,
  maintenance,
  phoneAndInternet,

  // Transportation
  fuel,
  publicTransit,
  rideShare,
  carPayment,

  // Food & Dining
  groceries,
  restaurants,
  coffeeShops,
  foodDelivery,

  // Shopping
  clothing,
  electronics,
  homeGoods,
  onlineShopping,

  // Entertainment
  streamingServices,
  gaming,
  eventsAndConcerts,
  hobbies,

  // Health & Personal Care
  medical,
  pharmacy,
  fitness,
  mentalHealth,
  personalCare,

  // Financial
  investmentContributions,
  fees,
  insurance,
  taxes,
  savings,

  // Other
  gifts,
  charity,
  education,
  miscellaneous,
}

/// Grouping for categories
enum CategoryGroup {
  income,
  housing,
  transportation,
  foodAndDining,
  shopping,
  entertainment,
  health,
  healthAndWellness, // Alias for health
  financial,
  other,
}

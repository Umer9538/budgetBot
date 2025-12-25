// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  accountId: json['accountId'] as String?,
  plaidTransactionId: json['plaidTransactionId'] as String?,
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String? ?? 'USD',
  date: _timestampFromJsonRequired(json['date']),
  merchantName: json['merchantName'] as String,
  category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
  subcategory: $enumDecodeNullable(_$CategoryTypeEnumMap, json['subcategory']),
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  isManual: json['isManual'] as bool? ?? false,
  location: json['location'] == null
      ? null
      : TransactionLocation.fromJson(json['location'] as Map<String, dynamic>),
  receipt: json['receipt'] == null
      ? null
      : TransactionReceipt.fromJson(json['receipt'] as Map<String, dynamic>),
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  notes: json['notes'] as String?,
  carbonFootprint: (json['carbonFootprint'] as num?)?.toDouble(),
  emotionalContext: json['emotionalContext'] == null
      ? null
      : EmotionalContext.fromJson(
          json['emotionalContext'] as Map<String, dynamic>,
        ),
  isRecurring: json['isRecurring'] as bool? ?? false,
  recurringGroupId: json['recurringGroupId'] as String?,
  isPending: json['isPending'] as bool? ?? false,
  createdAt: _timestampFromJson(json['createdAt']),
  updatedAt: _timestampFromJson(json['updatedAt']),
);

Map<String, dynamic> _$$TransactionModelImplToJson(
  _$TransactionModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'accountId': instance.accountId,
  'plaidTransactionId': instance.plaidTransactionId,
  'amount': instance.amount,
  'currency': instance.currency,
  'date': _timestampToJson(instance.date),
  'merchantName': instance.merchantName,
  'category': _$CategoryTypeEnumMap[instance.category]!,
  'subcategory': _$CategoryTypeEnumMap[instance.subcategory],
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'isManual': instance.isManual,
  'location': instance.location,
  'receipt': instance.receipt,
  'tags': instance.tags,
  'notes': instance.notes,
  'carbonFootprint': instance.carbonFootprint,
  'emotionalContext': instance.emotionalContext,
  'isRecurring': instance.isRecurring,
  'recurringGroupId': instance.recurringGroupId,
  'isPending': instance.isPending,
  'createdAt': _timestampToJson(instance.createdAt),
  'updatedAt': _timestampToJson(instance.updatedAt),
};

const _$CategoryTypeEnumMap = {
  CategoryType.salary: 'salary',
  CategoryType.freelance: 'freelance',
  CategoryType.investments: 'investments',
  CategoryType.otherIncome: 'otherIncome',
  CategoryType.rentMortgage: 'rentMortgage',
  CategoryType.utilities: 'utilities',
  CategoryType.maintenance: 'maintenance',
  CategoryType.phoneAndInternet: 'phoneAndInternet',
  CategoryType.fuel: 'fuel',
  CategoryType.publicTransit: 'publicTransit',
  CategoryType.rideShare: 'rideShare',
  CategoryType.carPayment: 'carPayment',
  CategoryType.groceries: 'groceries',
  CategoryType.restaurants: 'restaurants',
  CategoryType.coffeeShops: 'coffeeShops',
  CategoryType.foodDelivery: 'foodDelivery',
  CategoryType.clothing: 'clothing',
  CategoryType.electronics: 'electronics',
  CategoryType.homeGoods: 'homeGoods',
  CategoryType.onlineShopping: 'onlineShopping',
  CategoryType.streamingServices: 'streamingServices',
  CategoryType.gaming: 'gaming',
  CategoryType.eventsAndConcerts: 'eventsAndConcerts',
  CategoryType.hobbies: 'hobbies',
  CategoryType.medical: 'medical',
  CategoryType.pharmacy: 'pharmacy',
  CategoryType.fitness: 'fitness',
  CategoryType.mentalHealth: 'mentalHealth',
  CategoryType.personalCare: 'personalCare',
  CategoryType.investmentContributions: 'investmentContributions',
  CategoryType.fees: 'fees',
  CategoryType.insurance: 'insurance',
  CategoryType.taxes: 'taxes',
  CategoryType.savings: 'savings',
  CategoryType.gifts: 'gifts',
  CategoryType.charity: 'charity',
  CategoryType.education: 'education',
  CategoryType.miscellaneous: 'miscellaneous',
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
  TransactionType.transfer: 'transfer',
};

_$TransactionLocationImpl _$$TransactionLocationImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionLocationImpl(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  address: json['address'] as String?,
  city: json['city'] as String?,
  country: json['country'] as String?,
);

Map<String, dynamic> _$$TransactionLocationImplToJson(
  _$TransactionLocationImpl instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'address': instance.address,
  'city': instance.city,
  'country': instance.country,
};

_$TransactionReceiptImpl _$$TransactionReceiptImplFromJson(
  Map<String, dynamic> json,
) => _$TransactionReceiptImpl(
  imageUrl: json['imageUrl'] as String?,
  ocrData: json['ocrData'] as Map<String, dynamic>?,
  uploadedAt: _timestampFromJson(json['uploadedAt']),
);

Map<String, dynamic> _$$TransactionReceiptImplToJson(
  _$TransactionReceiptImpl instance,
) => <String, dynamic>{
  'imageUrl': instance.imageUrl,
  'ocrData': instance.ocrData,
  'uploadedAt': _timestampToJson(instance.uploadedAt),
};

_$EmotionalContextImpl _$$EmotionalContextImplFromJson(
  Map<String, dynamic> json,
) => _$EmotionalContextImpl(
  mood: $enumDecodeNullable(_$MoodTypeEnumMap, json['mood']),
  stressLevel: (json['stressLevel'] as num?)?.toInt() ?? 0,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$$EmotionalContextImplToJson(
  _$EmotionalContextImpl instance,
) => <String, dynamic>{
  'mood': _$MoodTypeEnumMap[instance.mood],
  'stressLevel': instance.stressLevel,
  'notes': instance.notes,
};

const _$MoodTypeEnumMap = {
  MoodType.happy: 'happy',
  MoodType.calm: 'calm',
  MoodType.neutral: 'neutral',
  MoodType.stressed: 'stressed',
  MoodType.anxious: 'anxious',
  MoodType.sad: 'sad',
  MoodType.excited: 'excited',
  MoodType.tired: 'tired',
  MoodType.frustrated: 'frustrated',
};

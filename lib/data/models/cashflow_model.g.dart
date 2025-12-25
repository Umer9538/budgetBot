// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CashflowPredictionImpl _$$CashflowPredictionImplFromJson(
  Map<String, dynamic> json,
) => _$CashflowPredictionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  currentBalance: (json['currentBalance'] as num).toDouble(),
  predictedBalance: (json['predictedBalance'] as num).toDouble(),
  predictionDate: DateTime.parse(json['predictionDate'] as String),
  status: $enumDecode(_$CashflowStatusEnumMap, json['status']),
  confidence: $enumDecode(_$PredictionConfidenceEnumMap, json['confidence']),
  upcomingEvents:
      (json['upcomingEvents'] as List<dynamic>?)
          ?.map((e) => CashflowEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  dailyProjections:
      (json['dailyProjections'] as List<dynamic>?)
          ?.map((e) => DailyBalance.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  crisisDate: json['crisisDate'] == null
      ? null
      : DateTime.parse(json['crisisDate'] as String),
  crisisAmount: (json['crisisAmount'] as num?)?.toDouble(),
  crisisReason: json['crisisReason'] as String?,
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: _timestampFromJson(json['createdAt']),
  updatedAt: _timestampFromJson(json['updatedAt']),
);

Map<String, dynamic> _$$CashflowPredictionImplToJson(
  _$CashflowPredictionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'currentBalance': instance.currentBalance,
  'predictedBalance': instance.predictedBalance,
  'predictionDate': instance.predictionDate.toIso8601String(),
  'status': _$CashflowStatusEnumMap[instance.status]!,
  'confidence': _$PredictionConfidenceEnumMap[instance.confidence]!,
  'upcomingEvents': instance.upcomingEvents,
  'dailyProjections': instance.dailyProjections,
  'crisisDate': instance.crisisDate?.toIso8601String(),
  'crisisAmount': instance.crisisAmount,
  'crisisReason': instance.crisisReason,
  'recommendations': instance.recommendations,
  'createdAt': _timestampToJson(instance.createdAt),
  'updatedAt': _timestampToJson(instance.updatedAt),
};

const _$CashflowStatusEnumMap = {
  CashflowStatus.healthy: 'healthy',
  CashflowStatus.watch: 'watch',
  CashflowStatus.warning: 'warning',
  CashflowStatus.critical: 'critical',
  CashflowStatus.crisis: 'crisis',
};

const _$PredictionConfidenceEnumMap = {
  PredictionConfidence.veryHigh: 'veryHigh',
  PredictionConfidence.high: 'high',
  PredictionConfidence.medium: 'medium',
  PredictionConfidence.low: 'low',
  PredictionConfidence.veryLow: 'veryLow',
};

_$CashflowEventImpl _$$CashflowEventImplFromJson(Map<String, dynamic> json) =>
    _$CashflowEventImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      type: $enumDecode(_$CashflowEventTypeEnumMap, json['type']),
      isRecurring: json['isRecurring'] as bool,
      recurringPattern: json['recurringPattern'] as String?,
      category: $enumDecodeNullable(_$CategoryTypeEnumMap, json['category']),
      confidence: $enumDecodeNullable(
        _$PredictionConfidenceEnumMap,
        json['confidence'],
      ),
      merchantName: json['merchantName'] as String?,
      isConfirmed: json['isConfirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$$CashflowEventImplToJson(_$CashflowEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
      'type': _$CashflowEventTypeEnumMap[instance.type]!,
      'isRecurring': instance.isRecurring,
      'recurringPattern': instance.recurringPattern,
      'category': _$CategoryTypeEnumMap[instance.category],
      'confidence': _$PredictionConfidenceEnumMap[instance.confidence],
      'merchantName': instance.merchantName,
      'isConfirmed': instance.isConfirmed,
    };

const _$CashflowEventTypeEnumMap = {
  CashflowEventType.income: 'income',
  CashflowEventType.expense: 'expense',
  CashflowEventType.transfer: 'transfer',
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

_$DailyBalanceImpl _$$DailyBalanceImplFromJson(Map<String, dynamic> json) =>
    _$DailyBalanceImpl(
      date: DateTime.parse(json['date'] as String),
      balance: (json['balance'] as num).toDouble(),
      inflow: (json['inflow'] as num).toDouble(),
      outflow: (json['outflow'] as num).toDouble(),
      eventIds:
          (json['eventIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DailyBalanceImplToJson(_$DailyBalanceImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'balance': instance.balance,
      'inflow': instance.inflow,
      'outflow': instance.outflow,
      'eventIds': instance.eventIds,
    };

_$RecurringTransactionImpl _$$RecurringTransactionImplFromJson(
  Map<String, dynamic> json,
) => _$RecurringTransactionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  name: json['name'] as String,
  amount: (json['amount'] as num).toDouble(),
  frequency: $enumDecode(_$RecurringFrequencyEnumMap, json['frequency']),
  nextDate: DateTime.parse(json['nextDate'] as String),
  type: $enumDecode(_$CashflowEventTypeEnumMap, json['type']),
  category: $enumDecodeNullable(_$CategoryTypeEnumMap, json['category']),
  merchantName: json['merchantName'] as String?,
  history:
      (json['history'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList() ??
      const [],
  isActive: json['isActive'] as bool? ?? true,
  confidence: $enumDecodeNullable(
    _$PredictionConfidenceEnumMap,
    json['confidence'],
  ),
  createdAt: _timestampFromJson(json['createdAt']),
);

Map<String, dynamic> _$$RecurringTransactionImplToJson(
  _$RecurringTransactionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'amount': instance.amount,
  'frequency': _$RecurringFrequencyEnumMap[instance.frequency]!,
  'nextDate': instance.nextDate.toIso8601String(),
  'type': _$CashflowEventTypeEnumMap[instance.type]!,
  'category': _$CategoryTypeEnumMap[instance.category],
  'merchantName': instance.merchantName,
  'history': instance.history.map((e) => e.toIso8601String()).toList(),
  'isActive': instance.isActive,
  'confidence': _$PredictionConfidenceEnumMap[instance.confidence],
  'createdAt': _timestampToJson(instance.createdAt),
};

const _$RecurringFrequencyEnumMap = {
  RecurringFrequency.daily: 'daily',
  RecurringFrequency.weekly: 'weekly',
  RecurringFrequency.biWeekly: 'biWeekly',
  RecurringFrequency.monthly: 'monthly',
  RecurringFrequency.quarterly: 'quarterly',
  RecurringFrequency.yearly: 'yearly',
};

_$CashflowAlertImpl _$$CashflowAlertImplFromJson(Map<String, dynamic> json) =>
    _$CashflowAlertImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$AlertTypeEnumMap, json['type']),
      title: json['title'] as String,
      message: json['message'] as String,
      severity: $enumDecode(_$CashflowStatusEnumMap, json['severity']),
      alertDate: DateTime.parse(json['alertDate'] as String),
      crisisDate: json['crisisDate'] == null
          ? null
          : DateTime.parse(json['crisisDate'] as String),
      projectedShortfall: (json['projectedShortfall'] as num?)?.toDouble(),
      suggestedActions:
          (json['suggestedActions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isRead: json['isRead'] as bool? ?? false,
      isDismissed: json['isDismissed'] as bool? ?? false,
      createdAt: _timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$CashflowAlertImplToJson(_$CashflowAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$AlertTypeEnumMap[instance.type]!,
      'title': instance.title,
      'message': instance.message,
      'severity': _$CashflowStatusEnumMap[instance.severity]!,
      'alertDate': instance.alertDate.toIso8601String(),
      'crisisDate': instance.crisisDate?.toIso8601String(),
      'projectedShortfall': instance.projectedShortfall,
      'suggestedActions': instance.suggestedActions,
      'isRead': instance.isRead,
      'isDismissed': instance.isDismissed,
      'createdAt': _timestampToJson(instance.createdAt),
    };

const _$AlertTypeEnumMap = {
  AlertType.budgetWarning: 'budgetWarning',
  AlertType.budgetExceeded: 'budgetExceeded',
  AlertType.budgetApproaching: 'budgetApproaching',
  AlertType.cashflowCrisis: 'cashflowCrisis',
  AlertType.cashflowWarning: 'cashflowWarning',
  AlertType.subscriptionDecay: 'subscriptionDecay',
  AlertType.unusualSpending: 'unusualSpending',
  AlertType.savingsOpportunity: 'savingsOpportunity',
  AlertType.billDue: 'billDue',
  AlertType.goalAchieved: 'goalAchieved',
  AlertType.streakMilestone: 'streakMilestone',
  AlertType.insightAvailable: 'insightAvailable',
  AlertType.emotionalSpendingAlert: 'emotionalSpendingAlert',
  AlertType.negotiationComplete: 'negotiationComplete',
};

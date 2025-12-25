// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountModelImpl _$$AccountModelImplFromJson(Map<String, dynamic> json) =>
    _$AccountModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      plaidAccountId: json['plaidAccountId'] as String?,
      institutionName: json['institutionName'] as String,
      accountType: $enumDecode(_$AccountTypeEnumMap, json['accountType']),
      accountName: json['accountName'] as String,
      mask: json['mask'] as String?,
      currentBalance: (json['currentBalance'] as num?)?.toDouble() ?? 0.0,
      availableBalance: (json['availableBalance'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] as String? ?? 'USD',
      lastSynced: _timestampFromJson(json['lastSynced']),
      isActive: json['isActive'] as bool? ?? true,
      isManual: json['isManual'] as bool? ?? false,
      isLinked: json['isLinked'] as bool? ?? false,
      institutionLogo: json['institutionLogo'] as String?,
      institutionId: json['institutionId'] as String?,
      providerAccountId: json['providerAccountId'] as String?,
      providerType: json['providerType'] as String?,
      accessToken: json['accessToken'] as String?,
      createdAt: _timestampFromJson(json['createdAt']),
    );

Map<String, dynamic> _$$AccountModelImplToJson(_$AccountModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'plaidAccountId': instance.plaidAccountId,
      'institutionName': instance.institutionName,
      'accountType': _$AccountTypeEnumMap[instance.accountType]!,
      'accountName': instance.accountName,
      'mask': instance.mask,
      'currentBalance': instance.currentBalance,
      'availableBalance': instance.availableBalance,
      'currency': instance.currency,
      'lastSynced': _timestampToJson(instance.lastSynced),
      'isActive': instance.isActive,
      'isManual': instance.isManual,
      'isLinked': instance.isLinked,
      'institutionLogo': instance.institutionLogo,
      'institutionId': instance.institutionId,
      'providerAccountId': instance.providerAccountId,
      'providerType': instance.providerType,
      'accessToken': instance.accessToken,
      'createdAt': _timestampToJson(instance.createdAt),
    };

const _$AccountTypeEnumMap = {
  AccountType.checking: 'checking',
  AccountType.savings: 'savings',
  AccountType.creditCard: 'creditCard',
  AccountType.investment: 'investment',
  AccountType.loan: 'loan',
  AccountType.cash: 'cash',
  AccountType.crypto: 'crypto',
  AccountType.other: 'other',
};

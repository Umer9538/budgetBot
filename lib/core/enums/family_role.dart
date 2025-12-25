/// Enum representing family member roles
enum FamilyRole {
  admin,
  adult,
  teen,
  child,
  viewer,
}

extension FamilyRoleExtension on FamilyRole {
  String get displayName {
    switch (this) {
      case FamilyRole.admin:
        return 'Admin';
      case FamilyRole.adult:
        return 'Adult';
      case FamilyRole.teen:
        return 'Teen';
      case FamilyRole.child:
        return 'Child';
      case FamilyRole.viewer:
        return 'View Only';
    }
  }

  String get description {
    switch (this) {
      case FamilyRole.admin:
        return 'Full access, manage members, see all data';
      case FamilyRole.adult:
        return 'Own data + shared budgets, limited view of others';
      case FamilyRole.teen:
        return 'Own data + allowance, educational content';
      case FamilyRole.child:
        return 'Allowance only, gamified savings';
      case FamilyRole.viewer:
        return 'See shared data only';
    }
  }

  bool get canManageMembers {
    return this == FamilyRole.admin;
  }

  bool get canSeeAllData {
    return this == FamilyRole.admin;
  }

  bool get canCreateBudgets {
    return this == FamilyRole.admin || this == FamilyRole.adult;
  }

  bool get canMakeTransactions {
    return this != FamilyRole.viewer;
  }

  bool get hasAllowance {
    return this == FamilyRole.teen || this == FamilyRole.child;
  }

  int get permissionLevel {
    switch (this) {
      case FamilyRole.admin:
        return 100;
      case FamilyRole.adult:
        return 75;
      case FamilyRole.teen:
        return 50;
      case FamilyRole.child:
        return 25;
      case FamilyRole.viewer:
        return 10;
    }
  }
}

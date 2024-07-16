class User {
  const User({
    required this.name,
    required this.uid,
    required this.profile,
    required this.phone,
    required this.isOnline,
    required this.groupIDs,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      uid: map['uid'] as String,
      profile: map['profile'] as String,
      phone: map['phone'] as String?,
      isOnline: map['is_online'] as bool,
      groupIDs: map['group_ids'] as List<dynamic>,
    );
  }

  final String name;
  final String uid;
  final String profile;
  final String? phone;
  final bool isOnline;
  final List<dynamic> groupIDs;

  User copyWith({
    String? name,
    String? uid,
    String? profile,
    String? phone,
    bool? isOnline,
    List<String>? groupIDs,
  }) {
    return User(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      profile: profile ?? this.profile,
      phone: profile ?? this.phone,
      isOnline: isOnline ?? this.isOnline,
      groupIDs: groupIDs ?? this.groupIDs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'profile': profile,
      'phone': phone,
      'is_online': isOnline,
      'group_ids': groupIDs,
    };
  }
}

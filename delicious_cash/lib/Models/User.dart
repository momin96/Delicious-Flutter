class User {
  String userId;
  String fullName;
  String email;
  String phoneNo;

  static User createTestUser() {
    User user = new User();
    user.fullName = 'Nasir Ahmed Momin';
    user.email = 'momin96@gmail.com';
    return user;
  }
}

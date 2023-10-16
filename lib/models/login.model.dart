class LoginResponse {
  // late String username;
  // late String profileImageUrl;
  late String token;
  // late String expires;
  // late int expiresIn;

  LoginResponse({
    // required this.username,
    // required this.profileImageUrl,
    required this.token,
    // required this.expires,
    // required this.expiresIn,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> data) {
    return LoginResponse(
      // username: data['username'],
      // profileImageUrl: data['profile_image_url'],
      token: data['token'],
      // expires: data['expires'],
      // expiresIn: data['expires_in'],
    );
  }
}

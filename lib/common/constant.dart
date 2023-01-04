import 'package:responsive_drawer/common/const_string.dart';

const baseUrl = "https://ishine.liveyourpassion.in/strapi";

final constString = ConstString();
Map<String, String> getHeader(String token) => {
      'Authorization': 'Bearer $token',
    };
Map<String, String> getHeader1(String token) => {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

final RegExp emailRegex = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

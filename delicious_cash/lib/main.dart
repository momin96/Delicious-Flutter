import 'package:flutter/material.dart';

import 'LandingPage.dart';

void main() {
  runApp(EntryPoint());
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return androidApp();
  }

  Widget androidApp() {
    return MaterialApp(
      title: 'Deliciuos Cash',
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


/**
 * ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDNYnV3ifwhT8WJoOCbsnTEySynkajZDcsW9I+rxo+++sI5KL8cGH6bLvGyU+CPyNO8PE42OPX9KPwIpzfZYRk5nKfmUjsno/SoeTF1J3a8jMe7pqvwG45jKgPQ2apzHHfY+96svxVEiTbvjvAVcNnwt3ya/SczJUfZFmuYtGwO+EkJCwF8lW0IkhAtnFotgrGDYQJSA7yGHq83u1OTqF8XA42guRK06k85MU+vplxZhpDFTEI4eq5nnv0hphuu9VbKp+4uwWGOlo6VB5uuUEPfi9Mwl1EaICunYmiLZCkTgRWos6K8vHlrAyXRuyZkdZWt9oSAPPKcQDEWSNIITwoBss63xMDbC2crkoKMzX+g3z9FJxVBhppES5ekNl14NiaZL5zf0GiWUMNoDOyPvrI+VlWCPmp9EtkNDKX09zTLuqT4dgfucXPH4pmZ3ZnWAjlc8gM0RElTo48si/Tvx5aFMQeB0YNPB5MSSGLMRc3T6Olsh3qvC0kxkjUddSCqWnlC6vhsW/qRis3EQzY0BwXoCUkxEY2qOBV01fPLgulq+GH/EOp4qtnz+X57z8BU5WBK1RJfrdkKaSRjX6Oh+1CO8TpN0Nd00Tf2MYRnbv/L6yqXEIVQ8Pa8AYB3/JZxDBP9DfC6fnPVCOs/xOOJ6WG6uWTfgWLbZZeDM7hbbYrEGQ==
 */

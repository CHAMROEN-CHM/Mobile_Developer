import 'package:flutter/material.dart';
import '../model/profile_model.dart';

ProfileData chamroenProfile = ProfileData(
  name: "Chamroen Chhun",
  position: "CyberSecurity",
  avatarUrl: 'assets/aang.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "chamroenstd@gmail.com"),
    TileData(icon: Icons.hot_tub, title: "Hobbies", value: "Football"),
  ],
);

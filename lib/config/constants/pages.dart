import 'package:apple_match/features/discover/screens/discover_screen.dart';
import 'package:apple_match/features/home/screens/home_screen.dart';
import 'package:apple_match/features/matches/screens/matches_screen.dart';
import 'package:apple_match/features/messages/screens/message_screen.dart';
import 'package:apple_match/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

const List<Widget> pages = [
  HomeScreen(),
  DiscoverScreen(),
  MatchesScreen(),
  MessageScreen(),
  ProfileScreen(),
];

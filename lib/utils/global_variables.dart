import 'package:flutter/material.dart';
import 'package:produck/screens/add_post_screen.dart';
import 'package:produck/screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems=[
  FeedScreen(),
  Text('search'),
  AddPostScreen(),
  Text('favourite'),
  Text('profile'),
];
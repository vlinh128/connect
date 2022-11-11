import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

const List<FormBuilderChipOption<String>> tagsListComponents = [
  FormBuilderChipOption(
    value: 'Sport',
    avatar: CircleAvatar(child: Text('S')),
  ),
  FormBuilderChipOption(
    value: 'Shopping',
    avatar: CircleAvatar(child: Text('S')),
  ),
  FormBuilderChipOption(
    value: 'Entertainment',
    avatar: CircleAvatar(child: Text('E')),
  ),
  FormBuilderChipOption(
    value: 'F&B',
    avatar: CircleAvatar(child: Text('F')),
  ),
  FormBuilderChipOption(
    value: 'Learning',
    avatar: CircleAvatar(child: Text('L')),
  ),
  FormBuilderChipOption(
    value: 'Volunteer',
    avatar: CircleAvatar(child: Text('V')),
  ),
  FormBuilderChipOption(
    value: 'Festival',
    avatar: CircleAvatar(child: Text('F')),
  ),
];

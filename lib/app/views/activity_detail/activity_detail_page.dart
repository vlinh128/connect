import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:connect/app/views/create/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class ActivityDetailPage extends StatelessWidget {
  final ActivityEntity activity;
  const ActivityDetailPage({Key? key, required this.activity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Activity',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                      size: 50.0,
                    ),
                  ),
                  Text(
                    activity.locationDesc,
                    textAlign: TextAlign.center,
                  ),
                  FormBuilder(
                    enabled: false,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          name: "createdBy",
                          initialValue: activity.createdBy,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Owner',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "name",
                          readOnly: true,
                          initialValue: activity.name,
                          decoration: const InputDecoration(
                            labelText: 'Activity Name',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "description",
                          initialValue: activity.description,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "startTime",
                          initialValue: DateFormat("yyyy-MM-dd HH:MM a")
                              .format(activity.startTime.toLocal()),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Start Time',
                          ),
                        ),
                        activity.endTime != null
                            ? FormBuilderTextField(
                                name: "endTime",
                                initialValue: DateFormat("yyyy-MM-dd HH:MM a")
                                    .format(activity.endTime!.toLocal()),
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: 'End Time',
                                ),
                              )
                            : const SizedBox(),
                        FormBuilderDropdown<String>(
                          name: 'gender',
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Gender',
                            hintText: 'Select Gender',
                          ),
                          items: [],
                          initialValue: activity.gender,
                          valueTransformer: (val) => val?.toString(),
                        ),
                        FormBuilderFilterChip<String>(
                          decoration: const InputDecoration(labelText: 'Tags'),
                          name: 'tags',
                          enabled: false,
                          initialValue: activity.tags,
                          selectedColor: Colors.green,
                          options: tagsListComponents
                              .where((element) =>
                                  activity.tags.contains(element.value))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CupertinoButton(
                  color: Colors.green,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: const Text(
                    'Check In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CupertinoButton(
                  color: Colors.amberAccent,
                  onPressed: () {},
                  child: const Text('Share'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }
}

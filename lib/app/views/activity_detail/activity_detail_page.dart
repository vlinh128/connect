import 'package:connect/app/domains/activity/activity_entity.dart';
import 'package:connect/app/domains/activity/activity_use_case.dart';
import 'package:connect/app/views/activity_detail/acitivity_detail_controller.dart';
import 'package:connect/app/views/create/components/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActivityDetailPage extends StatelessWidget {
  final ActivityEntity activity;
  final ActivityDetailController _ =
      ActivityDetailController(Get.find<ActivityUseCase>());

  ActivityDetailPage({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _.activity = activity;
    _.getActivity(activity.id ?? '');
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
                    _.activity.locationDesc,
                    textAlign: TextAlign.center,
                  ),
                  FormBuilder(
                    enabled: false,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          name: "createdBy",
                          initialValue: _.activity.createdBy,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Owner',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "name",
                          readOnly: true,
                          initialValue: _.activity.name,
                          decoration: const InputDecoration(
                            labelText: 'Activity Name',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "description",
                          initialValue: _.activity.description,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Description',
                          ),
                        ),
                        FormBuilderTextField(
                          name: "startTime",
                          initialValue: DateFormat("yyyy-MM-dd HH:MM a")
                              .format(_.activity.startTime.toLocal()),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Start Time',
                          ),
                        ),
                        activity.endTime != null
                            ? FormBuilderTextField(
                                name: "endTime",
                                initialValue: DateFormat("yyyy-MM-dd HH:MM a")
                                    .format(_.activity.endTime!.toLocal()),
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
                          initialValue: _.activity.gender,
                          valueTransformer: (val) => val?.toString(),
                        ),
                        FormBuilderFilterChip<String>(
                          decoration: const InputDecoration(labelText: 'Tags'),
                          name: 'tags',
                          enabled: false,
                          initialValue: _.activity.tags,
                          selectedColor: Colors.green,
                          options: tagsListComponents
                              .where((element) =>
                                  _.activity.tags.contains(element.value))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Gallery',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<ActivityDetailController>(
                      init: _,
                      builder: (controller) {
                        print(controller.activity.images!.length.toString());
                        return GalleryPage(activityEntity: controller.activity);
                      })
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
                  onPressed: () async {
                    await _.checkIn(context, activity);
                  },
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

class GalleryPage extends StatefulWidget {
  GalleryPage({Key? key, required this.activityEntity}) : super(key: key);

  ActivityEntity activityEntity;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return (widget.activityEntity.images ?? []).isNotEmpty
        ? GalleryImage(
            numOfShowImages: widget.activityEntity.images == null
                ? 0
                : widget.activityEntity.images!.length,
            imageUrls: widget.activityEntity.images ?? [],
          )
        : const SizedBox();
  }
}

import 'package:connect/app/views/create/components/tags.dart';
import 'package:connect/app/views/create/created_acitivity_controller.dart';
import 'package:connect/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../../../core/values/constants.dart';

class CreateActivityPage extends StatefulWidget {
  const CreateActivityPage({Key? key}) : super(key: key);

  @override
  State<CreateActivityPage> createState() {
    return _CreateActivityPageState();
  }
}

class _CreateActivityPageState extends State<CreateActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Your Activity',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
      )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child:
            SingleChildScrollView(child: GetBuilder<CreateActivityController>(
          builder: (_) {
            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: IconButton(
                    iconSize: 50.0,
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: _.selectedLocation == null
                          ? Colors.red
                          : Colors.green,
                      size: 50.0,
                    ),
                    onPressed: () async {
                      final location = await Get.toNamed(AppRoutes.map);
                      _.updateSelectedLocation(location);
                    },
                  ),
                ),
                Text(
                  _.selectedLocation?.desc ?? "Choose activity location",
                  textAlign: TextAlign.center,
                ),
                FormBuilder(
                  key: _.formKey,
                  onChanged: () {
                    _.formKey.currentState!.save();
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  initialValue: _.initialValue,
                  skipDisabled: true,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 15),
                      FormBuilderTextField(
                        name: "createdBy",
                        validator: FormBuilderValidators.notEqual("",
                            errorText: "Must not empty"),
                        decoration: const InputDecoration(
                          labelText: 'Owner',
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      FormBuilderTextField(
                        name: "name",
                        validator: FormBuilderValidators.notEqual("",
                            errorText: "Must not empty"),
                        decoration: const InputDecoration(
                          labelText: 'Activity Name',
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      FormBuilderTextField(
                        name: "description",
                        decoration: const InputDecoration(
                          labelText: 'Description',
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      // FormBuilderTextField(
                      //   name: "limit",
                      //   decoration: const InputDecoration(
                      //     labelText: 'Limit Participant',
                      //   ),
                      //   keyboardType: TextInputType.number,
                      // ),
                      FormBuilderDateTimePicker(
                        name: 'startTime',
                        initialEntryMode: DatePickerEntryMode.calendar,
                        inputType: InputType.both,
                        decoration: InputDecoration(
                          labelText: 'Start Time',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _.formKey.currentState!.fields['startTime']
                                  ?.didChange(null);
                            },
                          ),
                        ),
                      ),
                      FormBuilderDateTimePicker(
                        name: 'endTime',
                        initialEntryMode: DatePickerEntryMode.calendar,
                        inputType: InputType.both,
                        decoration: InputDecoration(
                          labelText: 'End Time',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _.formKey.currentState!.fields['endTime']
                                  ?.didChange(null);
                            },
                          ),
                        ),
                      ),
                      FormBuilderDropdown<String>(
                        name: 'gender',
                        decoration: const InputDecoration(
                          labelText: 'Gender',
                          hintText: 'Select Gender',
                        ),
                        items: genderOptions
                            .map((gender) => DropdownMenuItem(
                                  alignment: AlignmentDirectional.centerStart,
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (val) {},
                        valueTransformer: (val) => val?.toString(),
                      ),
                      FormBuilderFilterChip<String>(
                        decoration: const InputDecoration(labelText: 'Tags'),
                        name: 'tags',
                        selectedColor: Colors.green,
                        options: tagsListComponents,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.minLength(1),
                          FormBuilderValidators.maxLength(3),
                        ]),
                      ),
                      FormBuilderCheckbox(
                        name: 'acceptTerms',
                        initialValue: false,
                        title: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'I have read and agree to the ',
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Terms and Conditions',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                        validator: FormBuilderValidators.equal(
                          true,
                          errorText:
                              'You must accept terms and conditions to continue',
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CupertinoButton(
                        color: Colors.green,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          _.createActivity(context);
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CupertinoButton(
                        color: Colors.red,
                        onPressed: () {
                          _.resetForm();
                        },
                        child: const Text('Reset'),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )),
      ),
    );
  }
}

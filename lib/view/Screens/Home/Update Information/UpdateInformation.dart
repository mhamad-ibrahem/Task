import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Core/constant/Size.dart';
import 'package:task/view/Screens/Home/Update%20Information/CustomUpdateForm.dart';
import 'package:task/view/widgets/CustomButton.dart';
import 'package:task/view/widgets/CustomScaffold.dart';

import '../../../../Controller/Home/UpdateController.dart';
import '../../../../Core/classes/HandilingData.dart';
import '../../../../Core/functions/warningAuthDialog.dart';

class UpdateInformation extends StatelessWidget {
  UpdateInformation({super.key});
  UpdateImplement controller = Get.put(UpdateImplement());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        title: "Update Information",
        widget: GetBuilder<UpdateImplement>(
            builder: (controller) => HandilingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CustomUpdateForm(),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      title: "Save",
                      width: AppSize.screenWidth * 0.75,
                      isPurple: true,
                      onPressed: () {
                        controller.updateInformation();

                      },
                    ),
                  ],
                ))));
  }
}

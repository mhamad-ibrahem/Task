import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/Controller/Auth/SignUp/SignUpController.dart';
import 'package:task/Core/constant/Colors.dart';

import '../../data/model/countryModel.dart';
import '../constant/Size.dart';

RegisterImplement controller = Get.find();
showCountryDialog(List<CountryModel> countryList, VoidCallback onTap) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.only(top: 20),
      height: AppSize.screenHight * 0.6,
      width: AppSize.screenWidth,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: ListView.separated(
        itemCount: countryList.length,
        itemBuilder: (context, index) => ListTile(
          leading: SizedBox(
              height: 30,
              width: 40,
              child: Image.asset(countryList[index].image)),
          title: Text(
            countryList[index].name,
            style: Theme.of(context).textTheme.headline1,
          ),
          trailing: Text(
            countryList[index].code,
            style: Theme.of(context).textTheme.headline1,
          ),
          onTap: () {
            controller.changeCounty(countryList, index);
          },
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      ),
    ),
  );
}

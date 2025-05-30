import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obesity_dashboard/helpers/app_colors.dart';
import 'package:obesity_dashboard/helpers/screen_config.dart';
import 'package:obesity_dashboard/helpers/size_extension.dart';
import 'package:obesity_dashboard/helpers/sizedbox.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/controller/obesity_dashboard_controller.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/widgets/lifestyle_behavior_card.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/widgets/meter_container.dart';
import 'package:obesity_dashboard/screens/obesity_dashboard/widgets/optional_behavioral_card.dart';
import 'package:provider/provider.dart';

class ObesityDashboard extends StatefulWidget {
  const ObesityDashboard({super.key});

  @override
  State<ObesityDashboard> createState() => _ObesityDashboardState();
}

class _ObesityDashboardState extends State<ObesityDashboard> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    final Anthropometricscontroller =
        context.watch<ObesityDashboardController>().Anthropometrics;
    final MetabolicLabscontroller =
        context.watch<ObesityDashboardController>().MetabolicLabs;
    // final statuscontroller =
    //     context.watch<HypertensionDashboardController>().getStatusData(0.8);
    final Lifestylebehaviorcontroller =
        context.watch<ObesityDashboardController>().Lifestylebehavior;
    final OptionalBehavioralInsightscontroller =
        context.watch<ObesityDashboardController>().OptionalBehavioralInsights;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            )),
        title: Center(
            child: Text(
          "Dashboard",
          style: GoogleFonts.roboto(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    child: const Image(
                      image: AssetImage("assets/images/obesity_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  sizedBoxWithWidth(20),
                  Text(
                    "Obesity / Metabolic Syndrome",
                    style: GoogleFonts.roboto(
                        color: AppColors.maincolor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Anthropometrics",
                      style: GoogleFonts.roboto(
                          color: AppColors.secondtitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(5),
                    Column(
                        children: List.generate(
                      Anthropometricscontroller.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {},
                            child: MeterContainer(
                              title: Anthropometricscontroller[index]
                                      ["title"] ??
                                  "",
                              rating: Anthropometricscontroller[index]
                                      ["rating"] ??
                                  "",
                              status: Anthropometricscontroller[index]
                                      ["status"] ??
                                  "",
                              statusColor: Anthropometricscontroller[index]
                                      ["color"] ??
                                  "",
                              statusimage: Anthropometricscontroller[index]
                                      ["icon"] ??
                                  "",
                            )),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            sizedBoxWithHeight(50),
            Container(
              width: double.infinity,
              color: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Metabolic Labs",
                      style: GoogleFonts.roboto(
                          color: AppColors.secondtitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(5),
                    Column(
                        children: List.generate(
                      MetabolicLabscontroller.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {},
                            child: MeterContainer(
                              title:
                                  MetabolicLabscontroller[index]["title"] ?? "",
                              rating: MetabolicLabscontroller[index]
                                      ["rating"] ??
                                  "",
                              status: MetabolicLabscontroller[index]
                                      ["status"] ??
                                  "",
                              statusColor:
                                  MetabolicLabscontroller[index]["color"] ?? "",
                              statusimage:
                                  MetabolicLabscontroller[index]["icon"] ?? "",
                            )),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            sizedBoxWithHeight(50),
            Container(
              width: double.infinity,
              color: AppColors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lifestyle & Behavior",
                      style: GoogleFonts.roboto(
                          color: AppColors.secondtitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(5),
                    Column(
                        children: List.generate(
                            Lifestylebehaviorcontroller.length, (index) {
                      final item = Lifestylebehaviorcontroller[index];
                      final double percentage = item["percentage"] ?? 0.0;

                      final statuscontroller = context
                          .read<ObesityDashboardController>()
                          .getStatusData(percentage);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {},
                            child: LifestylebehaviorCard(
                              title: Lifestylebehaviorcontroller[index]
                                      ["title"] ??
                                  "",
                              value: Lifestylebehaviorcontroller[index]
                                      ["rating"] ??
                                  "",
                              percentage: percentage,
                              status: statuscontroller["status"],
                              statusColor: statuscontroller["color"],
                              statusimage: statuscontroller["icon"],
                            )),
                      );
                    })),
                  ],
                ),
              ),
            ),
            sizedBoxWithHeight(50),
            Container(
              width: double.infinity,
              color: AppColors.lightblue,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Optional Behavioral Insights",
                      style: GoogleFonts.roboto(
                          color: AppColors.secondtitle,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    sizedBoxWithHeight(5),
                    Column(
                        children: List.generate(
                      OptionalBehavioralInsightscontroller.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: InkWell(
                            onTap: () {},
                            child: OptionalBehavioralCard(
                              title: OptionalBehavioralInsightscontroller[index]
                                      ["title"] ??
                                  "",
                              rating:
                                  OptionalBehavioralInsightscontroller[index]
                                          ["rating"] ??
                                      "",
                              status:
                                  OptionalBehavioralInsightscontroller[index]
                                          ["status"] ??
                                      "",
                              statusColor:
                                  OptionalBehavioralInsightscontroller[index]
                                          ["color"] ??
                                      "",
                              statusimage:
                                  OptionalBehavioralInsightscontroller[index]
                                          ["icon"] ??
                                      "",
                            )),
                      ),
                    )),
                    sizedBoxWithHeight(10),
                  ],
                ),
              ),
            ),
            sizedBoxWithHeight(10),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:obesity_dashboard/helpers/app_colors.dart';

class ObesityDashboardController with ChangeNotifier {
  List<Map<String, dynamic>> Anthropometrics = [
    {
      "title": "Weight",
      "rating": "70 kg",
      "status": "Normal",
      "color": AppColors.maincolor,
      "icon": "assets/images/normal.png",
    },
    {
      "title": "BMI",
      "rating": "23.5",
      "status": "Normal",
      "color": AppColors.maincolor,
      "icon": "assets/images/normal.png",
    },
    {
      "title": "Waist Circumference",
      "rating": "85 cm",
      "status": "Normal",
      "color": AppColors.maincolor,
      "icon": "assets/images/normal.png",
    },
    {
      "title": "Body Fat%",
      "rating": "22%",
      "status": "Normal",
      "color": AppColors.maincolor,
      "icon": "assets/images/normal.png",
    },
    {
      "title": "Waist-to-Hip Ratio",
      "rating": "0.95 cm",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
  ];
  List<Map<String, dynamic>> MetabolicLabs = [
    {
      "title": "Fasting Glucose",
      "rating": "105 mg/dL",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "HbA1c",
      "rating": "6.1%",
      "status": "Moderate",
      "color": AppColors.orange,
      "icon": "assets/images/moderate.png"
    },
    {
      "title": "Insulin (Fasting)",
      "rating": "18 µIU/mL",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "Triglycerides",
      "rating": "170 mg/dL",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "HDL",
      "rating": "38 mg/dL",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "Blood Pressure",
      "rating": "135/88 mmHg",
      "status": "Moderate",
      "color": AppColors.orange,
      "icon": "assets/images/moderate.png"
    },
  ];
  List<Map<String, dynamic>> Lifestylebehavior = [
    {
      "title": "Physical Activity (Steps/Mins)",
      "rating": "5,000 steps / 60 mins",
      "percentage": 0.7,
    },
    {
      "title": "Calorie Intake (Daily)",
      "rating": "2,500 kcal",
      "percentage": 1.0,
    },
    {
      "title": "Macronutrient Distribution",
      "rating": "Carbs: 55%, Fat: 30%, Protein: 15%",
      "percentage": 0.3,
    },
    {
      "title": "Sleep Duration & Quality",
      "rating": "7.5 hrs (Score: 82)",
      "percentage": 0.7,
    },
    {
      "title": "Stress levels",
      "rating": "Moderate",
      "percentage": 0.3,
    },
  ];
  List<Map<String, dynamic>> OptionalBehavioralInsights = [
    {
      "title": "Food Cravings Log",
      "rating": "Frequent (Sweets)",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "Emotional Eating Triggers",
      "rating": "Stress, Boredom",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
    {
      "title": "Sleep Apnea Symptoms",
      "rating": "Snoring, Daytime Fatigue",
      "status": "High",
      "color": AppColors.red,
      "icon": "assets/images/high.png"
    },
  ];
  Map<String, dynamic> getStatusData(double percentage) {
    if (percentage < 0.4) {
      return {
        "status": "Moderate",
        "color": AppColors.orange,
        "icon": "assets/images/moderate.png"
      };
    } else if (percentage < 0.8) {
      return {
        "status": "Normal",
        "color": AppColors.maincolor,
        "icon": "assets/images/normal.png",
      };
    } else {
      return {
        "status": "High",
        "color": AppColors.red,
        "icon": "assets/images/high.png"
      };
    }
  }
}

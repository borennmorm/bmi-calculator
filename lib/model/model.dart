// ignore_for_file: non_constant_identifier_names

class BMICalcu {
  final String bmiCategory;
  final String bmiDescription;

  BMICalcu(this.bmiCategory, this.bmiDescription);

  static final List<BMICalcu> BMICategories = [
    BMICalcu('underweight',
        'Individuals with a BMI under 18.5 are considered underweight, indicating they may not have enough body fat and could be at risk for nutritional deficiencies and health issues related to low body weight.'),
    BMICalcu('normal weight',
        'A BMI between 18.5 and 24.9 is classified as normal weight. This range suggests a healthy balance of body weight for height, typically associated with a lower risk of chronic diseases.'),
    BMICalcu('overweight',
        'Those with a BMI from 25 to 29.9 are considered overweight. This category signals a higher body weight than ideal, which can increase the risk of health problems such as cardiovascular disease and type 2 diabetes.'),
    BMICalcu('obesity Class 1',
        'A BMI between 30 and 34.9 falls into Class 1 obesity. Individuals in this range have excess body fat, posing significant health risks including hypertension and metabolic syndrome.'),
    BMICalcu('obesity Class 2',
        'Class 2 obesity is marked by a BMI of 35 to 39.9. This level of obesity is associated with severe health risks, including an increased likelihood of developing serious conditions like heart disease and stroke.'),
    BMICalcu('obesity Class 3',
        'A BMI of 40 or higher is categorized as Class 3 obesity, also known as morbid or extreme obesity. This category signifies a very high level of body fat, leading to critical health risks and potential life-threatening conditions.')
  ];
}

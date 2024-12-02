enum AiAnalysisResults {

  // 만성신장질환
  kidneys(
    'kidneys',
    'kidneys_symptoms',
    'kidneys_guide',
  ),

  // 방광염
  bladder(
    'bladder',
    'bladder_symptoms',
    'bladder_guide',
  ),

  // 췌장염
  pancreas(
    'pancreas',
    'pancreas_symptoms',
    'pancreas_guide',
  ),

  // 빈혈
  anemia(
    'pancreas',
    'anemia_symptoms',
    'anemia_guide',
  ),

  // 당뇨
  diabetes(
    'pancreas',
    'diabetes_symptoms',
    'diabetes_guide',
  ),

  // 신장염
  nephritis(
    'nephritis',
    'nephritis_symptoms',
    'nephritis_guide',
  ),

  // 다낭성신장염- new
  polycysticnephritis(
    'polycysticnephritis',
    'polycysticnephritis_symptoms',
    'polycysticnephritis_guide',
  ),

  // 급성간염- new
  acutehepatitis(
    'acutehepatitis',
    'acutehepatitis_symptoms',
    'acutehepatitis_guide',
  ),

  // 갑상선기능항진증- new
  hyperthyroidism(
    'hyperthyroidism',
    'hyperthyroidism_symptoms',
    'hyperthyroidism_guide',
  ),

  // 간염(A형)- new
  hepatitis(
    'hepatitis',
    'hepatitis_symptoms',
    'hepatitis_guide',
  ),

  // 신장질환, 신우염, 신부전- new
  kidneydisease(
    'kidneydisease',
    'kidneydisease_symptoms',
    'kidneydisease_guide',
  ),
  
  health(
    'health',
    'health_symptoms',
    'health_guide',
  );


  const AiAnalysisResults(this.name, this.symptomContent,  this.diseaseContent);
  final String name;

  // 예상증상
  final String symptomContent;

  // 예상질병
  final String diseaseContent;
}
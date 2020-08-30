import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPChoice> timeChoices = [
  RPChoice.withParams("All of the time", "someId", 5),
  RPChoice.withParams("Most of the time", "someId", 4),
  RPChoice.withParams("More than half of the time", "someId", 3),
  RPChoice.withParams("Less than half of the time", "someId", 2),
  RPChoice.withParams("Some of the time", "someId", 1),
  RPChoice.withParams("At no time", "someId", 0),
];

List<RPChoice> joyfulActivities = [
  RPChoice.withParams("Playing games", "someId", 6, true),
  RPChoice.withParams("Jogging", "someId", 5),
  RPChoice.withParams("Playing an instrument", "someId", 4),
  RPChoice.withParams("Family and friends", "someId", 3),
  RPChoice.withParams("Doing sports", "someId", 2),
  RPChoice.withParams("Reading", "someId", 1),
  RPChoice.withParams("Being productive", "someId", 0),
];

List<RPChoice> instruments = [
  RPChoice.withParams("Guitar", "someId", 3),
  RPChoice.withParams("Piano", "someId", 2),
  RPChoice.withParams("Saxophone", "someId", 1),
];

List<RPImageChoice> images = [
  RPImageChoice.withParams(
      Image.asset('assets/images/very-sad.png'), 0, 'Feeling very sad'),
  RPImageChoice.withParams(
      Image.asset('assets/images/sad.png'), 0, 'Feeling sad'),
  RPImageChoice.withParams(
      Image.asset('assets/images/ok.png'), 0, 'Feeling ok'),
  RPImageChoice.withParams(
      Image.asset('assets/images/happy.png'), 0, 'Feeling happy'),
  RPImageChoice.withParams(
      Image.asset('assets/images/very-happy.png'), 0, 'Feeling very happy'),
];

RPChoiceAnswerFormat timeAnswerFormat = RPChoiceAnswerFormat.withParams(
    ChoiceAnswerStyle.SingleChoice, timeChoices);
// All types of DateTime answer formats
RPDateTimeAnswerFormat timeOfDayAnswerFormat =
    RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.TimeOfDay);
RPDateTimeAnswerFormat dateAndTimeAnswerFormat =
    RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.DateAndTime);
RPDateTimeAnswerFormat dateAnswerFormat =
    RPDateTimeAnswerFormat.withParams(DateTimeAnswerStyle.Date);

// Slider
RPSliderAnswerFormat sliderAnswerFormat = RPSliderAnswerFormat.withParams(
    0, 100,
    divisions: 10, prefix: "\$", suffix: " paid");

RPChoiceAnswerFormat joyfulActivitiesAnswerFormat =
    RPChoiceAnswerFormat.withParams(
        ChoiceAnswerStyle.MultipleChoice, joyfulActivities);

RPChoiceAnswerFormat instrumentsAnswerFormat = RPChoiceAnswerFormat.withParams(
    ChoiceAnswerStyle.MultipleChoice, instruments);

RPIntegerAnswerFormat weightIntegerAnswerFormat =
    RPIntegerAnswerFormat.withParams(0, 200, "KG");

RPBooleanAnswerFormat smokingBooleanAnswerFormat =
    RPBooleanAnswerFormat.withParams("Yes, absolutely", "No, never");

RPIntegerAnswerFormat minutesIntegerAnswerFormat =
    RPIntegerAnswerFormat.withParams(0, 10000, "minutes");

RPImageChoiceAnswerFormat imageChoiceAnswerFormat =
    RPImageChoiceAnswerFormat.withParams(images);

RPQuestionStep timeOfDayQuestionStep = RPQuestionStep.withAnswerFormat(
    'timeOfDayQuestionStepID', 'When did you wake up?', timeOfDayAnswerFormat);

RPQuestionStep dateAndTimeQuestionStep = RPQuestionStep.withAnswerFormat(
    'dateAndTimeQuestionStepID',
    'When did you last eat unhealthy food?',
    dateAndTimeAnswerFormat);

RPQuestionStep dateQuestionStep = RPQuestionStep.withAnswerFormat(
    'dateQuestionStepID', 'When did you last drink alcohol?', dateAnswerFormat);

// Slider
RPQuestionStep sliderQuestionStep = RPQuestionStep.withAnswerFormat(
  "sliderQuestionsStepID",
  "What did you pay for insulin?",
  sliderAnswerFormat,
  optional: true,
);

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormat,
);

RPQuestionStep smokingQuestionStep = RPQuestionStep.withAnswerFormat(
  "booleanQuestionStepID",
  "Do you smoke?",
  smokingBooleanAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "instrumentChoiceQuestionStepID",
    "Which instrument are you playing?",
    instrumentsAnswerFormat);

RPQuestionStep happinessChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "happinessChoiceQuestionStepID",
    "What makes you happy?",
    joyfulActivitiesAnswerFormat);

RPQuestionStep weightQuestionStep = RPQuestionStep.withAnswerFormat(
    "weightQuestionStepID", "What is your weight?", weightIntegerAnswerFormat);

RPQuestionStep minutesQuestionStep = RPQuestionStep.withAnswerFormat(
    "minutesQuestionStepID",
    "How many minutes do you spend practicing a week?",
    minutesIntegerAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "imageStepID",
  "Indicate you mood by selecting a picture!",
  imageChoiceAnswerFormat,
);

RPFormStep formStep = RPFormStep.withTitle(
  "formstepID",
  [instrumentChoiceQuestionStep, minutesQuestionStep, dateQuestionStep],
  "Questions about music",
  optional: true,
);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
    identifier: "instructionID",
    title: "Welcome!",
    detailText: "For the sake of science of course...")
  ..text =
      "Please fill out this questionnaire!\n\nIn this questionnaire the questions will come after each other in a given order. You still have the chance to skip a some of them though.";

RPOrderedTask linearSurveyTask = RPOrderedTask(
  "surveyTaskID",
  [
    instructionStep,
    formStep,
    smokingQuestionStep,
    sliderQuestionStep,
    timeOfDayQuestionStep,
    dateAndTimeQuestionStep,
    dateQuestionStep,
    imageChoiceQuestionStep,
    singleChoiceQuestionStep,
    happinessChoiceQuestionStep,
    weightQuestionStep,
    completionStep
  ],
);

/// The UI library of Research Package.
///
/// Normally you don't need to use these widgets directly. After creating the model objects from [research_package_model]
/// and adding them to an [RPTask] you can present the different elements by passing it to an [RPUITask].
///
/// This library contains various UI representations (Widgets) of the objects declared in [research_package_model].
/// Many of these Widgets are responsible for making the collected results accessible to others.
/// Also contains general styles, UI statics used in Research Package UI in [RPStyles].

library research_package_ui;

// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:signature/signature.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:research_package/model.dart';

//Local Imports
import 'research_package.dart';
import 'src/ui/custom_card.dart';
import 'src/ui/velmio_material_color.dart';

// Library elements
part 'src/localization/RPLocalization.dart';
part 'src/loggers/RPActivityEventLogger.dart';
part 'src/ui/ActivityBody/RPUICorsiBlockTappingActivityBody.dart';
part 'src/ui/ActivityBody/RPUILetterTappingActivityBody.dart';
part 'src/ui/ActivityBody/RPUIPairedAssociatesLearningActivityBody.dart';
part 'src/ui/ActivityBody/RPUIRapidVisualInfoProcessingActivityBody.dart';
part 'src/ui/ActivityBody/RPUIReactionTimeActivityBody.dart';
part 'src/ui/ActivityBody/RPUIStroopEffectActivityBody.dart';
part 'src/ui/ActivityBody/RPUITappingActivityBody.dart';
part 'src/ui/ActivityBody/RPUITrailMakingActivityBody.dart';
part 'src/ui/QuestionBody/RPUIBooleanQuestionBody.dart';
part 'src/ui/QuestionBody/RPUIChoiceQuestionBody.dart';
part 'src/ui/QuestionBody/RPUIDateTimeQuestionBody.dart';
part 'src/ui/QuestionBody/RPUIImageChoiceQuestionBody.dart';
part 'src/ui/QuestionBody/RPUIIntegerQuestionBody.dart';
part 'src/ui/QuestionBody/RPUISliderQuestionBody.dart';
part 'src/ui/RPStyles.dart';
part 'src/ui/RPUIActivityStep.dart';
part 'src/ui/RPUICompletionStep.dart';
part 'src/ui/RPUIConsentReviewStep.dart';
part 'src/ui/RPUIFormStep.dart';
part 'src/ui/RPUIInstructionStep.dart';
part 'src/ui/RPUIQuestionStep.dart';
part 'src/ui/RPUITask.dart';

part 'src/ui/RPUIVisualConsentStep.dart';

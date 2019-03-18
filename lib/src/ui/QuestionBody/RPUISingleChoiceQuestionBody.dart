part of research_package_ui;

class RPUIChoiceQuestionBody extends StatefulWidget {
  final RPChoiceAnswerFormat answerFormat;
  RPUIChoiceQuestionBody(this.answerFormat);

  @override
  _RPUIChoiceQuestionBodyState createState() => _RPUIChoiceQuestionBodyState();
}

class _RPUIChoiceQuestionBodyState extends State<RPUIChoiceQuestionBody> {
  int selectedIndex;

  @override
  void initState() {
    selectedIndex = null;
    super.initState();
  }

  Function buttonCallBack(int index) {
    // Setting the state here is calling the build method so the checkmarks can be rendered.
    // Only one choice can be selected.
    if (selectedIndex == index) {
      setState(() {
        selectedIndex = null;
      });
    } else {
      setState(() {
        selectedIndex = index;
      });
    }

    selectedIndex != null
        ? blocQuestion.sendStatus(QuestionStatus.Ready)
        : blocQuestion.sendStatus(QuestionStatus.NotReady);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.answerFormat.choices.length,
      itemBuilder: _choiceCellBuilder,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _choiceButton(
      widget.answerFormat.choices[index],
      buttonCallBack,
      selectedIndex == index ? true : false,
      index,
    );
  }
}

class _choiceButton extends StatefulWidget {
  RPChoice choice;
  Function selectedCallBack;
  bool selected;
  int index;

  _choiceButton(this.choice, this.selectedCallBack, this.selected, this.index);

  @override
  _choiceButtonState createState() => _choiceButtonState();
}

class _choiceButtonState extends State<_choiceButton> {
  @override
  void initState() {
//    selected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlineButton(
        splashColor: RPStyles.cachetBlue,
        padding: EdgeInsets.all(14),
        highlightElevation: 2,
        onPressed: () {
//          setState(() {
//            selected = !selected;
//          });
          print("The value of the choice: ${widget.choice.value}");
          widget.selectedCallBack(widget.index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.choice.text, style: RPStyles.choiceAnswerText),
            Icon(widget.selected ? Icons.check : null, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

part of research_package_ui;

/// The UI representation of [RPChoiceAnswerFormat]. This UI part appears embedded in a [RPUIQuestionStep].
/// Depending on the [RPChoiceAnswerFormat]'s [ChoiceAnswerStyle] property, the user can select only one or multiple options.
class RPUIChoiceQuestionBody extends StatefulWidget {
  final RPChoiceAnswerFormat _answerFormat;
  final Function(dynamic) onResultChange;

  RPUIChoiceQuestionBody(this._answerFormat, this.onResultChange);

  @override
  _RPUIChoiceQuestionBodyState createState() => _RPUIChoiceQuestionBodyState();
}

class _RPUIChoiceQuestionBodyState extends State<RPUIChoiceQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUIChoiceQuestionBody> {
  List<RPChoice> selectedChoices;

  @override
  void initState() {
    selectedChoices = [];
    super.initState();
  }

  void _buttonCallBack(RPChoice selectedChoice) {
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.SingleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Only one choice can be selected.
      if (selectedChoices.contains(selectedChoice)) {
        setState(() {
          selectedChoices.remove(selectedChoice);
        });
      } else {
        setState(() {
          selectedChoices = [];
          selectedChoices.add(selectedChoice);
        });
      }
    }
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.MultipleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Multiple choice can be selected.
      if (selectedChoices.contains(selectedChoice)) {
        setState(() {
          selectedChoices.remove(selectedChoice);
        });
      } else {
        setState(() {
          selectedChoices.add(selectedChoice);
        });
      }
    }

    selectedChoices.length != 0
        ? widget.onResultChange(selectedChoices)
        : widget.onResultChange(null);
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _ChoiceButton(
      choice: widget._answerFormat.choices[index],
      selectedCallBack: _buttonCallBack,
      selected: selectedChoices.contains(widget._answerFormat.choices[index])
          ? true
          : false,
      index: index,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations locale = RPLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Text(widget._answerFormat.answerStyle ==
                  ChoiceAnswerStyle.MultipleChoice
              ? (locale?.translate('(Choose one or more options)') ??
                  "(Choose one or more options)")
              : (locale?.translate('(Choose one option)') ??
                  "(Choose one option)")),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget._answerFormat.choices.length,
          itemBuilder: _choiceCellBuilder,
          physics: NeverScrollableScrollPhysics(),
        ),
        Container(height: 24),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ChoiceButton extends StatefulWidget {
  final RPChoice choice;
  final Function selectedCallBack;
  final bool selected;
  final int index;

  _ChoiceButton(
      {this.choice, this.selectedCallBack, this.selected, this.index});

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<_ChoiceButton> {
  RPChoice choice;

  @override
  void initState() {
    choice = widget.choice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        padding: EdgeInsets.all(14),
        onPressed: () {
          widget.selectedCallBack(choice);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: widget.choice.isFreeText
                  ? Container(
                      child: TextField(
                        onChanged: (newText) => choice.text = newText,
                        decoration: InputDecoration(
                            border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
 
                            hintText:
                                RPLocalizations.of(context).translate("Other")),
                      ),
                    )
                  : Text(
                      locale?.translate(widget.choice.text) ??
                          widget.choice.text,
                      style: widget.selected
                          ? RPStyles.choiceAnswerText
                              .copyWith(fontWeight: FontWeight.w500)
                          : RPStyles.choiceAnswerText,
                      softWrap: true,
                    ),
            ),
            Flexible(
              flex: 1,
              child: Icon(widget.selected ? Icons.check : null,
                  color: Theme.of(context).accentColor),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/others/services.dart';
import 'package:flutter_demo/others/colors.dart';
import 'package:flutter_demo/widgets/DialogView.dart';
import 'package:flutter_demo/widgets/PageContainer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class FlutterHooks extends HookWidget {
  const FlutterHooks({Key? key}) : super(key: key);

  String getTimeString(int limit, int value) {
    int minute = ((limit - value) / 60).floor();
    int second = (limit - value) - (minute * 60);

    return '0${second < 60 ? minute : (minute + 1)}:${second < 60 ? second < 10 ? '0$second' : '$second' : '00'}';
  }

  @override
  Widget build(BuildContext context) {
    final Services services = Services(context);
    const _limit = 90;

    // Limit in second time
    final _timer = useState<Timer?>(null);
    final _timerValue = useState(0);
    final _timeout = useState(false);
    final _inputA = useState("");
    final _inputB = useState("");
    final _filled = useState(false);
    final _finish = useState(false);

    final _controllerA = useTextEditingController();
    final _controllerB = useTextEditingController();

    final _isMounted = useIsMounted();

    startQuiz() {
      // General Function
      FocusManager.instance.primaryFocus?.unfocus();

      _controllerA.text = "";
      _controllerB.text = "";

      _finish.value = false;
      _filled.value = false;
      _inputA.value = "";
      _inputB.value = "";
      _timeout.value = false;
      _timerValue.value = 0;
      _timer.value = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_isMounted()) {
          _timerValue.value = _.tick;
          if (_.tick == _limit) {
            _.cancel();
          }
        } else {
          _.cancel();
        }
      });
    }

    useEffect(() {
      // InitState
      startQuiz();

      // Dispose
      return _timer.value != null && _isMounted() ? _timer.value!.cancel : null;
    }, []);

    // Listener when the value of the single variable changes
    useValueChanged(_timerValue.value, (_, __) {
      if (_timerValue.value == _limit) {
        _timeout.value = true;
      }
      return __;
    });

    // Listener when the value of the multiple variable changes >> use logical or
    useEffect(() {
      if (_inputA.value.isNotEmpty && _inputB.value.isNotEmpty) {
        _filled.value = true;
      } else {
        _filled.value = false;
      }

      return null;
    }, [_inputA.value, _inputB.value]);

    return PageContainer(
      title: 'Flutter Hooks',
      withBackButton: true,
      dialogs: [
        DialogView(
          isActive: _timeout.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Session Timeout !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Folks',
                  fontWeight: FontWeight.bold,
                  fontSize: services.getSize(48),
                ),
              ),
              SizedBox(height: services.getSize(100)),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: AspectRatio(
                  aspectRatio: 675.67004 / 631.94692,
                  child: SvgPicture.asset(
                    'assets/illustrations/TimeoutSession.svg',
                  ),
                ),
              ),
              SizedBox(height: services.getSize(50)),
              Text(
                "The time allotted to do the quiz has been completed.\nplease restart the quiz again or move to the previous page.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Folks',
                  fontSize: services.getSize(38),
                ),
              ),
              SizedBox(height: services.getSize(100)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    shadowColor: Colors.transparent,
                    elevation: 0,
                  ),
                  child: Text(
                    "Back to Previous Page",
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Folks',
                      fontWeight: FontWeight.bold,
                      fontSize: services.getSize(42),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    startQuiz();
                  },
                  child: Text(
                    "Restart the Quiz Again",
                    style: TextStyle(
                      fontFamily: 'Folks',
                      fontWeight: FontWeight.bold,
                      fontSize: services.getSize(42),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.only(
            top: services.getSize(100),
            bottom: services.getSize(200),
            left: services.getSize(100),
            right: services.getSize(100),
          ),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.6,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: services.getSize(40),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.deepBlack,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: services.getSize(70),
                            bottom: services.getSize(50),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                              color: AppColors.deepBlack,
                              width: 3,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  getTimeString(_limit, _timerValue.value),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Folks',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    fontSize: services.getSize(72),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: services.getSize(20),
                          horizontal: services.getSize(50),
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.deepBlack,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          "Quiz Timer",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Folks',
                            fontWeight: FontWeight.bold,
                            fontSize: services.getSize(36),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: services.getSize(100)),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Question : 5 + 5 ?",
                  style: TextStyle(
                    fontFamily: 'Folks',
                    fontSize: services.getSize(42),
                  ),
                ),
              ),
              SizedBox(height: services.getSize(20)),
              TextField(
                readOnly: _finish.value,
                controller: _controllerA,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Answer',
                ),
                style: TextStyle(
                  fontFamily: 'Folks',
                  fontSize: services.getSize(42),
                ),
                onChanged: (value) => _inputA.value = value,
              ),
              SizedBox(height: services.getSize(60)),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Question : 10 + 10 ?",
                  style: TextStyle(
                    fontFamily: 'Folks',
                    fontSize: services.getSize(42),
                  ),
                ),
              ),
              SizedBox(height: services.getSize(20)),
              TextField(
                readOnly: _finish.value,
                controller: _controllerB,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Answer',
                ),
                style: TextStyle(
                  fontFamily: 'Folks',
                  fontSize: services.getSize(42),
                ),
                onChanged: (value) => _inputB.value = value,
              ),
              SizedBox(height: services.getSize(40)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _finish.value
                      ? () => startQuiz()
                      : _filled.value
                          ? () {
                              if (_inputA.value == "10" &&
                                  _inputB.value == "20") {
                                FocusManager.instance.primaryFocus?.unfocus();
                                services.showSnackBar(
                                  "Congratulations, your answer is correct !",
                                );
                                if (_timer.value!.isActive) {
                                  _timer.value!.cancel();
                                }
                                _finish.value = true;
                              } else {
                                services.showSnackBar(
                                  "Please check the answer correctly !",
                                );
                              }
                            }
                          : null,
                  child: Text(
                    _finish.value ? "Restart" : "Submit",
                    style: TextStyle(
                      fontFamily: 'Folks',
                      fontWeight: FontWeight.bold,
                      fontSize: services.getSize(42),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

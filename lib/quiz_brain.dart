import 'question.dart';

class QuizBrain {
  int questionNumber = -1;
  List<Question> _questions = [
    Question(
        questionText: "İnsan DNA'sı %50 oranında salatalık DNA'sı ile aynıdır.",
        questionAnswer: false),
    Question(questionText: "3 + 5 = 7", questionAnswer: false),
    Question(questionText: "Altın en iyi iletkendir.", questionAnswer: true),
    Question(
        questionText: "Ahtapotların 3 tane kalbi vardır.",
        questionAnswer: true),
    Question(
        questionText:
            "Sihirli bir sözcük olarak lanse edilen ''Abrakadabra'', ilk olarak yüksek ateşli hastaların, ateşlerini düşürmek için söylenmiştir",
        questionAnswer: true),
    Question(questionText: "16 + 21 = 37", questionAnswer: true),
    Question(
        questionText:
            " Kanımızın vücudumuzu dolaşmasi yalnızca 22-23 saniye sürüyor.",
        questionAnswer: true),
    Question(
        questionText:
            "Fransa'da giyotinle en son idam 1977 yılında yapılmıştır.",
        questionAnswer: true),
    Question(questionText: "6 + 11 = 17", questionAnswer: true),
    Question(
        questionText: "Dünyadaki en kısa savaş 2 saat sürmüştür.",
        questionAnswer: false),
    Question(
        questionText:
            "İran ordusu, 2007 yılında 14 sincabı ajan oldukları gerekçesiyle tutukladı.",
        questionAnswer: true),
    Question(
        questionText: "İran'ın yüzölçümü Türkiye'nin yüzölçümünden büyüktür.",
        questionAnswer: true),
    Question(
        questionText:
            "Chicago, Barcelona, Roma ve İstanbul, aynı enlem üzerindedir.",
        questionAnswer: true),
    Question(
        questionText: "Avrupa'nın en kalabalık şehri İstanbul'dur.",
        questionAnswer: true),
    Question(
        questionText: " Dinozorlar olmasaydı kuşlar olmazdı.",
        questionAnswer: true)
  ];

  String getQuestionText(int questionNumber) {
    return _questions[questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questions[questionNumber].questionAnswer;
  }

  int getQuestionsSize() {
    return _questions.length;
  }

  String getQuestion() {
    questionNumber++;
    if (getQuestionsSize() > questionNumber) {
      return getQuestionText(questionNumber);
    }
    return "Finished";
  }

  bool isQuizFinished() {
    return questionNumber == getQuestionsSize() - 1;
  }

  void reset() {
    questionNumber = -1;
  }
}

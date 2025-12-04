import '../model/quiz.dart';

class QuizData {
  static Quiz getQuiz() {
    return const Quiz(
      id: 'quiz_1',
      title: 'Teacher & Colors Quiz',
      questions: [
        Question(
          id: 'q1',
          text: 'Who is the best teacher?',
          choices: [
            Choice(id: 'c1_1', text: 'Him'),
            Choice(id: 'c1_2', text: 'Ronan'),
            Choice(id: 'c1_3', text: 'Sokan'),
            Choice(id: 'c1_4', text: 'Hongly'),
            Choice(id: 'c1_5', text: 'Leangsiv'),
          ],
          correctChoiceId: 'c1_2',
        ),
        Question(
          id: 'q2',
          text: 'What is the best color?',
          choices: [
            Choice(id: 'c2_1', text: 'Blue'),
            Choice(id: 'c2_2', text: 'Red'),
            Choice(id: 'c2_3', text: 'Green'),
          ],
          correctChoiceId: 'c2_3',
        ),
        Question(
          id: 'q3',
          text: 'What is the capital of France?',
          choices: [
            Choice(id: 'c3_1', text: 'London'),
            Choice(id: 'c3_2', text: 'Paris'),
            Choice(id: 'c3_3', text: 'Berlin'),
            Choice(id: 'c3_4', text: 'Madrid'),
          ],
          correctChoiceId: 'c3_2',
        ),
        Question(
          id: 'q4',
          text: 'Which programming language is Flutter based on?',
          choices: [
            Choice(id: 'c4_1', text: 'Java'),
            Choice(id: 'c4_2', text: 'Kotlin'),
            Choice(id: 'c4_3', text: 'Dart'),
            Choice(id: 'c4_4', text: 'Swift'),
          ],
          correctChoiceId: 'c4_3',
        ),
        Question(
          id: 'q5',
          text: 'What is 2 + 2?',
          choices: [
            Choice(id: 'c5_1', text: '3'),
            Choice(id: 'c5_2', text: '4'),
            Choice(id: 'c5_3', text: '5'),
            Choice(id: 'c5_4', text: '22'),
          ],
          correctChoiceId: 'c5_2',
        ),
      ],
    );
  }
}

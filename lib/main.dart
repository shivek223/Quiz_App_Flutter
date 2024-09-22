import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzy',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(230, 255, 153, 0),
        scaffoldBackgroundColor: const Color.fromARGB(255, 2, 1, 43),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          titleLarge: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 245, 245, 245),
          ),
        ),
      ),
      home: const QuizzyPage(),
    );
  }
}

class QuizzyPage extends StatelessWidget {
  const QuizzyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Help & Instructions'),
              content: const Text('Select a topic to begin the quiz.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.help),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 30), // Adjusted margin here
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text('Quizzy',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Test Your Knowledge',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/Home_pic.png',
                  width: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Divider(
                color: Color.fromARGB(255, 119, 42, 42), thickness: 2),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                children: [
                  TopicCard(
                    imagePath: 'assets/java.png',
                    title: 'Java',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const JavaQuizPage())),
                  ),
                  TopicCard(
                    imagePath: 'assets/python.png',
                    title: 'Python',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PythonQuizPage())),
                  ),
                  TopicCard(
                    imagePath: 'assets/html.png',
                    title: 'HTML/CSS',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HtmlCssQuizPage())),
                  ),
                  TopicCard(
                    imagePath: 'assets/c++.png',
                    title: 'C++',
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CppQuizPage())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  const TopicCard({
    required this.imagePath,
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(204, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 64, 218, 3),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 90, width: 90),
            const SizedBox(height: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class HtmlCssQuizPage extends StatelessWidget {
  const HtmlCssQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizPage(
      title: 'HTML/CSS Quiz',
      questions: [
        Question(
          text: 'What does CSS stand for?',
          options: [
            'Creative Style Sheets',
            'Cascading Style Sheets',
            'Colorful Style Sheets',
            'Computer Style Sheets'
          ],
          answer: 'Cascading Style Sheets',
        ),
        Question(
          text: 'Which HTML tag is used to define an internal style sheet?',
          options: ['<css>', '<style>', '<script>', '<styles>'],
          answer: '<style>',
        ),
        Question(
          text: 'What is the correct HTML element for inserting a line break?',
          options: ['<break>', '<br>', '<lb>', '<linebreak>'],
          answer: '<br>',
        ),
        Question(
          text: 'Which property is used to change the background color?',
          options: ['bgcolor', 'color', 'background-color', 'background'],
          answer: 'background-color',
        ),
      ],
    );
  }
}

class CppQuizPage extends StatelessWidget {
  const CppQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizPage(
      title: 'C++ Quiz',
      questions: [
        Question(
          text:
              'Which of the following is a correct way to declare a variable in C++?',
          options: ['int a;', 'a int;', 'int a = 5;', 'a = int 5;'],
          answer: 'int a = 5;',
        ),
        Question(
          text:
              'What is the output of the following code: cout << "Hello World";',
          options: [
            'Hello World',
            'Hello World!',
            'Hello World;',
            'None of the above'
          ],
          answer: 'Hello World',
        ),
        Question(
          text: 'Which keyword is used to define a class in C++?',
          options: ['class', 'struct', 'object', 'define'],
          answer: 'class',
        ),
        Question(
          text: 'What is the size of int in C++?',
          options: ['2 bytes', '4 bytes', '8 bytes', 'depends on the compiler'],
          answer: 'depends on the compiler',
        ),
      ],
    );
  }
}

class PythonQuizPage extends StatelessWidget {
  const PythonQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizPage(
      title: 'Python Quiz',
      questions: [
        Question(
          text: 'What is the correct file extension for Python files?',
          options: ['.pyth', '.pt', '.py', '.pyn'],
          answer: '.py',
        ),
        Question(
          text:
              'Which function is used to output data to the screen in Python?',
          options: ['echo()', 'print()', 'output()', 'write()'],
          answer: 'print()',
        ),
        Question(
          text: 'How do you insert comments in Python?',
          options: [
            '// comment',
            '# comment',
            '<!-- comment -->',
            '** comment'
          ],
          answer: '# comment',
        ),
        Question(
          text: 'Which of the following is a Python tuple?',
          options: ['[1, 2, 3]', '(1, 2, 3)', '{1, 2, 3}', '1, 2, 3'],
          answer: '(1, 2, 3)',
        ),
      ],
    );
  }
}

class JavaQuizPage extends StatelessWidget {
  const JavaQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return QuizPage(
      title: 'Java Quiz',
      questions: [
        Question(
          text: 'Which of the following is a valid declaration of a variable?',
          options: ['int 1x = 0;', 'int x = 0;', 'int x = 0 1;', 'int x;'],
          answer: 'int x = 0;',
        ),
        Question(
          text: 'Which method is used to find the length of a string in Java?',
          options: ['length()', 'getSize()', 'getLength()', 'size()'],
          answer: 'length()',
        ),
        Question(
          text: 'What is the correct way to create an object in Java?',
          options: [
            'ClassName obj = new ClassName();',
            'ClassName obj = ClassName();',
            'new ClassName obj();',
            'ClassName obj = create ClassName();'
          ],
          answer: 'ClassName obj = new ClassName();',
        ),
        Question(
          text: 'Which of the following is not a Java keyword?',
          options: ['class', 'public', 'void', 'method'],
          answer: 'method',
        ),
      ],
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  Question({required this.text, required this.options, required this.answer});
}

class QuizPage extends StatefulWidget {
  final String title;
  final List<Question> questions;

  const QuizPage({required this.title, required this.questions, super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  bool answerSelected = false;
  String? correctAnswer;
  int timer = 10; // 10 seconds timer
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    timer = 10; // reset timer for new question
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.timer > 0) {
        setState(() {
          this.timer--;
        });
      } else {
        _timer.cancel();
        _showTimeUpDialog();
      }
    });
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Time Up!'),
        content: const Text('You ran out of time.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _goToNextQuestion();
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answerSelected = false; // reset answer selection status
        selectedAnswer = null; // reset selected answer
        _timer.cancel(); // cancel the previous timer
        _startTimer(); // start timer again
      });
    } else {
      _showScoreDialog();
    }
  }

  void answerQuestion(String selectedAnswer) {
    setState(() {
      this.selectedAnswer = selectedAnswer;
      answerSelected = true;
      correctAnswer = widget.questions[currentQuestionIndex].answer;

      if (selectedAnswer == correctAnswer) {
        score++;
      }

      // Move to the next question after a short delay
      Future.delayed(const Duration(seconds: 1), () {
        _goToNextQuestion();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            constraints: const BoxConstraints(
                maxWidth: 600), // Limit max width for better readability
            margin: const EdgeInsets.only(
                top: 50), // Increased margin for lower position
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Custom Heading
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 153, 0),
                        Color.fromARGB(255, 255, 0, 0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Your Current Score: $score',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Time Left: $timer seconds',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Question Text
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    question.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // Options
                Expanded(
                  child: ListView(
                    children: question.options.map((option) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            color: answerSelected
                                ? (option == correctAnswer
                                    ? Colors.green
                                    : (selectedAnswer == option
                                        ? Colors.red
                                        : null))
                                : Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            onPressed: answerSelected
                                ? null
                                : () => answerQuestion(option),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(color: Colors.white),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 20),
                              child: Text(option,
                                  style: const TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showScoreDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your final score is $score/${widget.questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop(); // Go back to the previous screen
            },
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}

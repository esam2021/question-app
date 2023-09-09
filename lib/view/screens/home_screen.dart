import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:question_app/model/question_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  QuestionManager questionManager = QuestionManager();
  List<Widget> scoreList = [];
  int totalPoint = 0;
  int correctAnswer = 0;
  var questions;

  checkUserAnswe(bool userAnswer) {
    setState(() {
      if (questionManager.getCurrentQuestion().answer == userAnswer) {
        scoreList.add(
          const Icon(Icons.check_circle, color: Colors.green),
        );
        totalPoint += questionManager.getCurrentQuestion().point;
        correctAnswer++;
      } else {
        scoreList.add(
          const Icon(Icons.cancel, color: Colors.red),
        );
      }
      bool check = questionManager.nextQuestion();
      if (!check) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                icon: Icon(Icons.check, color: Colors.green),
                title: Text(
                    "Your Score Is ${totalPoint}% , (${correctAnswer}/${questionManager.getQuestionCount()})"),
                actions: [
                  Center(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                          questionManager.reset();
                          totalPoint = 0;
                          correctAnswer = 0;
                          scoreList = [];
                        });
                      },
                      color: Colors.blue,
                      child: Text(
                        "start Agin",
                        style: GoogleFonts.almarai(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 73, 96, 200),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  "${questionManager.getCurrentQuestion().id}",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: Text(
                  questionManager.getCurrentQuestion().questionText,
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                    questionManager.getCurrentQuestion().imageUrl,
                    fit: BoxFit.cover),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MaterialButton(
                    color: Colors.green,
                    child: Text(
                      "True",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkUserAnswe(true);
                    },
                  ),
                  MaterialButton(
                    color: Colors.red,
                    child: Text(
                      "False",
                      style: GoogleFonts.montserrat(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkUserAnswe(false);
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: scoreList.toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

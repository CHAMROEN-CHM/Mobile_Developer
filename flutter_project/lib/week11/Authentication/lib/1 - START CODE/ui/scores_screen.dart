import 'package:flutter/material.dart';
import 'package:pre_test/1%20-%20START%20CODE/data/repositories/scores_repository.dart';
import 'package:pre_test/1%20-%20START%20CODE/data/services/auth_service.dart';
import '../model/score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;
  ScoresRepository scoreRepo = ScoresRepository();
  AuthenticationService authService = AuthenticationService.instance;

  @override
  void initState() {
    super.initState();
  
    fetchSCores();
  }

  void fetchSCores() async {
    try {
      // Ask the ScoresRepository instance to fetch the scores
      final result = await scoreRepo.getSCores();
      // if succes, update the scores list and refresh
      setState(() {
        scores = result;
      });
      // If failure, update the error and refresh
    } on AuthException catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  String? get userName {
    // Ask the AuthenticationService instance the current user nale (if any)
    if (authService.isLoggedIn) {
      return authService.session?.user.name;
    }

    return null;
  }

  Widget get content {
    // If scores list => dispaly the list using the ScoreTile
    if (scores != null) {
      return ListView.builder(
        itemCount: scores!.length,
        itemBuilder: (context, index) => ScoreTile(score: scores![index]),
      );
    }
    // if error, dispaly the erro in red, centered
    if (error != null) {
      return Center(child: Text(error!, style: TextStyle(color: Colors.red),),);
    }

    // otherwise, we disaply the  CircularProgressIndicator
    return CircularProgressIndicator();
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(welcomeLabel)),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}
class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(score.title),
        trailing: Text(score.value.toString()),
      ),
    );
  }
}

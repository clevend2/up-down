
import 'dart:math';

import 'package:up_down_app/utilities/stemmer.dart';

/// This class is responsible for ingesting a string and breaking it into tokens using a TF-IDF algorithm. 
/// The algorithm operates against persisted data over time to determine the most relevant tokens.
class Tokenizer {
  final Map<String, double> tfidfScores = {};
  List<String> allDocs = []; // List of all 'talkAboutIt' entries

  // Function to tokenize a given document (i.e., split it into words)
  List<String> tokenize(String doc) {
    var tokens = doc.split(' ');
    return tokens.map((token) => Stemmer.stem(token.toLowerCase())).toList(); // Applying stemming here
  }

  // Calculate the Term Frequency (TF) of each term in a given document
  Map<String, double> termFrequency(List<String> tokens) {
    Map<String, double> tf = {};
    double totalTerms = tokens.length.toDouble();
    tokens.forEach((term) {
      tf[term] = (tf[term] ?? 0) + 1;
    });
    tf.updateAll((key, value) => value / totalTerms);
    return tf;
  }

  // Calculate the Inverse Document Frequency (IDF) of each term
  double inverseDocumentFrequency(String term, List<String> allDocs) {
    int docsWithTerm = allDocs.where((doc) => doc.contains(term)).length;
    return docsWithTerm > 0 ? log(allDocs.length / docsWithTerm) : 0;
  }

  // Add a new 'talkAboutIt' entry and update TF-IDF scores
  void addEntry(String entry) {
    List<String> tokens = tokenize(entry); // Stemming is now integrated into tokenization
    Map<String, double> tf = termFrequency(tokens);

    allDocs.add(entry); // Add the entry to the list of all documents

    tokens.forEach((term) {
      double idf = inverseDocumentFrequency(term, allDocs);
      double tfidf = tf[term]! * idf;

      tfidfScores[term] = (tfidfScores[term] ?? 0) + tfidf;
    });
  }
}
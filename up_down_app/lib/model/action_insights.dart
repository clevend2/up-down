/// A class who's constructor ingests a list of UpDownActions and generates insights using various member methods which accept filtering parameters.
/// The constructor also ingests the tokenized_what_happened from each UpDownAction, groups them by keyword, and maps them to the list of actions in which they appear.
/// This class is able to ingest chunks of input at a time and process the actions in a streaming fashion to accomodate for large amounts of data.
/// The current list of insights:
///  1. The most common keywords in the actions
///   - This is a list of the most common words in the actions, excluding the most common words in the English language.
///   - This insight's method accepts the following additional parameters:
///    - `int numWords` - The number of words to return. Defaults to 10.
///  2. The frequency of a given action keyword over time
///   - This is a list of the frequency of a given action keyword over time.
///   - This insight's method accepts the following additional parameters:
///    - `String keyword` - The keyword to search for.
///    - `int numDays` - The number of days to return. Defaults to 30.
///  3. The frequency of a given action type + level over time
///   - This is a list of the frequency of a given action type (+ optionally level) over time.
///   - This insight's method accepts the following additional parameters:
///    - `String type` - The type to search for.
///    - `String level` - The level to search for (optional)
///    - `int numDays` - The number of days to return. Defaults to 30.
///  4. The ratio between the number of actions with a given type and the total number of actions over time
///   - This is a list of the ratio between the number of actions with a given type and the total number of actions over time.
///   - This insight's method accepts the following additional parameters:
///    - `String type` - The type to search for.
///    - `int numDays` - The number of days to return. Defaults to 30.
///    - `bool includeLevel` - Whether or not to include the level in the search. Defaults to false.
import 'package:up_down_app/model/action_levels.dart';
import 'package:up_down_app/model/action_types.dart';
import 'package:up_down_app/data/up_down_action.dart';

class ActionInsights {
  final List<UpDownAction> actions;

  ActionInsights(this.actions);

}

# Actions
1. Up = good
2. Down = bad

# Action attributes
1. level
2. talk_about_it
  - 200 chars max
3. really_talk_about_it
  - full screen
  - no char max
4. timestamp
5. device
6. tokenized_talk_about_it
  - a list of tokens relating to this action which can be indexed
7. type

# Action levels
1. Little
2. "" = standard
3. Big
4. Big big

# Action triggers
1. All actions => "Wanna talk about it?" => talk_about_it = "<nope>" || input || "Wanna really talk about it?" => input
2. All Down || Big Up || Big Big Up => "Wanna talk about it?" is bigger
3. Big || Big big => "Wanna talk about it?" requires confirm prompt to supply "<nope>"

# Action UI integrations
1. autocomplete suggestions based on previous tokenized_talk_about_it
2. timestamp is close to now? => suggest previous actions from similar timestamps
3. suggestions from similar times or autocomplete are available? => allow "negating" an up or down that was not done this time

# Action insights
1. Total ups and downs with adjustable time slider
  - default is "2 weeks"
  - determines times when clusters of ups or downs began or ended and suggests timeframes for "clean slates"
  - visual relations between the attributes of the actions in aggregate (histograms, timelines, graphs, etc), with groupings by timestamp, tokenized_talk_about_it, level, and/or type.






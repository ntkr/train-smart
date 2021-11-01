# Train Smart

Train Smart is a project to describe and generate scheduled series featuring spaced-repition, and progressive overload/challenge. These series appear in athletics, education, music and more and can be applied virtually anywhere. They tend to be cumbersome to write out though the rules that guide their design are usually fairly easy to describe. The goal of this project is to examine what is possible in this domain and seek an interface that is intuitive and productive for builders of learning-schedules. I hope that by creating a toolkit that allows the description and generation of such series, the barrier to creating them will be lowered allowing more frequent use.

A few examples will help illuminate the problems at hand.

## Example 1: Weightlifting

A couple years ago I was working on a sports-training app with a friend and began exploring how common exercise patterns could be described using rules rather than schedules. For example, a common weightlifting schedule is as follows:

Day 1
Squat 5x5 @ 45lbs
Bench Press 5x5 @ 45lbs
Barbell Row 5x5 @ 65lbs

Day 2
Squat 5x5 @ 50lbs
Overhead Press 5x5 @ 45lbs
Deadlift 1x5 @ 95lbs

Day 3
Squat 5x5 @ 55lbs
Bench Press 5x5 @ 50lbs
Barbell Row 5x5 @ 70lbs

Day 4
Squat 5x5 @ 60lbs
Overhead Press 5x5 @ 50lbs
Deadlift 1x5 @ 105lbs

Day 5
Squat 5x5 @ 65lbs
Bench Press 5x5 @ 55lbs
Barbell Row 5x5 @ 75lbs

Day 6
Squat 5x5 @ 70lbs
Overhead Press 5x5 @ 55lbs
Deadlift 1x5 @ 115lbs

This series (as most workout series are) is fairly cumbersome to write out, but is easy to define in terms of a few rules. In this case those rules are:

- Workout 3x/wk
- A day workouts include Squat, Bench Press and Barbell Row
- B day workouts include Squat, Overhead Press and Deadlift
- Alternate A day and B day workouts
- Repschemes for all lifts is 5x5, except deadlift which is 1x5
- Squat, Bench Press, and Overhead Press start at 45lbs and add 5lbs every time they appear in a new workout
- Barbell Row starts at 65lbs and adds 5lbs every time it appears in a new workout
- Deadlift starts at 95lbs and adds 10lbs every time it appears in a new workout


# Train Smart, Phase 1

The problem of developing a toolkit for describing and scheduling series that progress in arbitrary ways over time is very difficult. There seem to be innumerable ways to design such a thing and each seems to come short of a perfect fit for all the problem cases. So in light of these difficulties, I'm going to attempt the most basic case of the problem, and that is a toolkit that supports series with static base entities. That is to say, the things that are being scheduled (sets in a workout, musical exercises, etc) will not change over time. They are the same on day one of the schedule as they are on the day 20. Combining them in some interesting ways should be possible, however. To simplify that as well, we will start with combinations that are purely random, and then seek to confine that randomness in various ways.

# Train Smart, Phase 2

Random approach complete, but the implementation is very rigid. I will make this implementation more configurable through a nice api.

What should be configurable? 
	- users should be able to create arbitrary exercises
	- users should be able to define a structure for their events

A tagged object approach may work here, if a user can call some function to create an exercise that allows the user to add tags to that exercise, then the event structure can also be defined in terms of those tags.

# Phase 3

Build a real interface and allow the user to pass create their own entities and define their own session structures. They should then be able to generate schedules featuring their session designs.

The session-spec I'm using to test with looks like 
```
('tune 'warmup 'technical 'technical)
```
and because the `'technical` tag is repeated, it is very common to have a session with a duplicated exercise.

Should the session-spec api allow rules to be added that modify how the sessions are assembled?
How would those rules be implemented?

# Train Smart, Phase 1

The problem of developing a toolkit for describing and scheduling series that progress in arbitrary ways over time is very difficult. There seem to be innumerable ways to design such a thing and each seems to come short of a perfect fit for all the problem cases. So in light of these difficulties, I'm going to attempt the most basic case of the problem, and that is a toolkit that supports series with static base entities. That is to say, the things that are being scheduled (sets in a workout, musical exercises, etc) will not change over time. They are the same on day one of the schedule as they are on the day 20. Combining them in some interesting ways should be possible, however. To simplify that as well, we will start with combinations that are purely random, and then seek to confine that randomness in various ways.

# Train Smart, Phase 2

Random approach complete, but the implementation is very rigid. I will make this implementation more configurable through a nice api.

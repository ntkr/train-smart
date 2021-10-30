# TrainSmart

...or don't train at all.


## Example Problem

Area a: Improve at guitar
Area b: Learn solo guitar songs
Area c: Improve right hand technique
Area d: Improve pick technique
Area e: Improve picking single note lines across strings
Area f: Improve pick strumming
Area g: Improve fingerstyle technique
Area h: Improve left hand technique
Area j: Improve chordal accompaniment

Goal i: Learn ii-V-i in pos x, all keys
Exercise i(tempo, time, key, duration): Comp time |ii V|i  | quarter=tempo, circle of fourths, starting in key, ending in key, for duration measures/minutes/whatever.
	-> produces an exercise
	-> maybe also produce a difficulty?

"<-" means "is the supergoal of"
a <- b
a <- c
c <- d
e <- d
d <- f
d <- g
h <- a
j <- i

A session has a warmup, a review (or low-difficulty), a challenge (high-difficulty), and a cooldown.
Given the association of improvement areas, produce 10 30-minute sessions which progress in difficulty.

## Simplified Example Problem 1

Given a single exercise, create a progressive schedule.

evenPickEx = (tempo) -> even picking 8th notes on one 1 open string at quarter=tempo. 32 measures.

// 
progression = linear,logarithmic...

[x = 1..10 | tempo <- linear(60,120)(x), evenPickEx(tempo)]

## Simplified Example Problem 2

Given 2 exercises, create a progressive schedule that incorporates both

cmajEx = (tempo) -> play quarter note cmaj scale at quarter=tempo.

//[i = 1..10 | evenPickEx(:tempo linear(:min 60, :max 140)(i))
//	         | cmajEx(:tempo log(:min 60, :max 200))(i)]

series of 10 evenPickExercises where tempo increases linearly from 60 to 140.
series of 10 cMajorExercises where tempo increases logarithmically from 60 to 200.
series of 10 sessions that each have an evenPickExercise and a cMajorExercise.

## Simplified Example Problem 3

pushups, pullups, squats and jumping jacks are exercises
a workout has 2 blocks
a block has an exercise
a block has between 1 and 5 sets 
a set has a number called reps 
all sets in the same block have the same reps
given a block, all reps in all sets are constant
                                    differ by no more than 1
given all the pushup sets in a series, reps increase when the workout changes.
									



generate a series of 10 random workouts 

### How to model?
```
enum Exercise { pushups, pullups, squats, jumpingjacks }
struct Workout {
	blocks: Block[]
}
struct Block {
	exercise: Exercise
	sets: Set[]
}
struct Set {
	reps: Int
}
```

### How to build?
lots of macros?

```
genworkout = () => {
	numblocks = 2
	return {
		blocks: [1..numblocks].map(genblock)
	}
}

genblock = () => {
	numsets = random(1,5);
	return {
		exercise: genexercise(),
		sets: [1..numsets].map(genset)
	}
}

genset = () => {
	return {
		reps: random(1,20)
	}
}

result = [1..10].map(genworkout)
```

### possible approach: based on the last session, build next session

```
session1 = {
	blocks: [
		{   
			exercise: squat,
			sets: [
				{ reps: 5 },
				{ reps: 5 },
				{ reps: 5 }
			]
		},
		{
			exercise: pushup,
			sets: [
				{ reps: 5 },
				{ reps: 5 },
				{ reps: 5 }
			]
		}
	]
}
next = (prev) => ({
	prev.blocks...?
})
```

### Each generator knows about many high-leve things as well as previously generated like-items
```
genset(all_prev_sets, num_sets, goals) => {}
```


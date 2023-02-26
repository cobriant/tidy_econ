# Econometrics with the Tidyverse

*A Flipped Classroom Experience*

## Overview

This repository contains all of the public course materials for EC421 *Intro to Econometrics*, which I taught at the University of Oregon as a PhD student four times between Summer 2021 and Fall 2022. I did a few things that are a little out of the ordinary, which I think helped create a really engaging and fun class:

1. I use exclusively Tidyverse (no base R) to limit the scope of what students need to learn as programmers, 
2. I teach the Tidyverse using koans as homework to get the students programming on their own at least a few times a week,
3. I flipped the class: they study the material outside of class and then *every hour of class time* (except for exam days) has them working in small groups on slightly more challenging classwork problems. This frees you up as an instructor to get to know your students on a more personal level, hearing their thought processes and asking the right questions to set them on the path to figuring it out on their own.

If you haven't experienced a flipped classroom before, there's something really special about putting your students into small groups in front of an interesting problem. At first they'll flail around: you're asking them to think on the spot which is uncomfortable! But after just a couple of classes, they start to get the hang of it and then they start *loving* it. I think it's because they start to feel 🌟empowered:🌟 they start believing that econometrics (along with programming and probability/statistics) is something THEY CAN DO, and that's a really beautiful thing.

So if you're teaching Econometrics and you're interested in using the Tidyverse and using a flipped classroom, go ahead and fork this repo and use my materials. If you like it, you can show me your appreciation by sending me pull requests whenever you change something for the better. I'd like to *collaboratively develop* this course because I think that's the best way it can continue to grow.

## Details on Class Set-up

### Group Size

Groups of 3 seem to be best: 2 or 4 is okay, but not quite as good. I begin the course by randomizing students into groups of 3 and they keep the same groups for the first 1/3 of the course. This lets them build some comfort with their group, but they know they don't have to be with the same people for too long. Then for the next 1/3 of the course, I randomize them into new groups. For the final 1/3 of the course, I let them make requests about who they want to work with: they write down names for me and I try to satisfy as many of those requests as possible. Most people end up requesting to work with the first groups they were randomized into. They became friends!

### Class Size

I've found that this class works well with 30 or fewer students. Beyond 30, you may not have enough time to work with each group every class session. One solution might be to bring TA's into class. If you experiment with this, please add your notes here!

<TODO: LARGER CLASS SIZE EXPERIENCES>

### Answering Questions during Class

As the teacher, you'll probably have the impulse to wait at the front of the room until someone raises their hand, and then you walk over and answer their question. This is not the best model I've found. Some students figure out they can be vocal and get a lot of your attention, while other students stay silent and flounder. The vocal students also never get the chance to un-stick themselves when they're stuck, because they know you'll come rushing in to help.

Instead, pick a group to start with, spend 5-10 minutes listening in on their process, offering encouragement and perhaps a small suggestion, and then move on to their neighbor, working your way around the classroom until you get back to the group you started with. 2 laps in a single class period is perfect. 

It's also important to set the right tone with your advice-giving. Teachers seem to sort of fall into two camps when it comes to giving hints: 1) they give away nothing and are vaguely mean about it, and 2) in an attempt to seem kind, they crumble and give everything away. But there's a way to avoid giving spoilers while staying kind to students: stay compassionate and get really curious about their thinking. Students will heavily imply that it's your job as the teacher to rescue them from a hard problem. You should respond with a smile and by saying, "walk me through what you're thinking about." Sometimes this is all you need to do: when they articulate their thinking to you, they see where they went wrong or they have a new idea. It's also powerful to respond to a student's reasoning by being transparent and telling them how it makes you feel: "Oh, I'm excited about that!" or, "I'm confused about what you mean by that." And even: "I'm sorry, I spaced out: can you say that again?".

Sometimes the students aren't prepared. You can sit with them a little while, suggest what section they might re-read in the workbook, and then come back a little while later.

### Classroom

The ideal classroom for this course would have whiteboards on all four walls and large tables for collaboration. I've never been so lucky to get a room like that, so I ordered 10 large 18"X24" white boards that students put at the center of 3-4 desks pushed together. When you write down your solution on a large white board in front of your group, you can collaborate. Without the white boards, students write small in their own notebooks and then, after solving the problem individually, they share their answers. This is okay, but when you let students do that, they're missing out on developing this amazing skill of talking through a hard problem together.

The whiteboards are great for the analytical math classworks, but for the programming classworks, students should bring in their laptops and the groups of 3 should sit in a little row so that everyone can see everyone else's screens.

### Teaching Online

I've taught this course in person and then also over Zoom (synchronously). I used the Zoom breakout room functionality during class and it worked well. I think it was easier for the students to collaborate on code, but a little harder for the students to collaborate with math. If students have them, ipads or a document camera setup can be helpful with this.

## Issues

Here are some areas of weakness: contributions here would be profoundly appreciated.

- Transform the workbook from casual lecture notes into a professional-feeling, super clear textbook (inspiration from [Patrick Henry Winston](https://www.youtube.com/watch?v=Unzc731iCUY)). 
  - Start each chapter with an empowerment promise: "by the end of this chapter, you will be able to do XXX." Also include a slogan, symbol, and story:
  - For each chapter, identify a slogan: "the key to understanding this topic is XXX".
  - For each chapter, create a symbol: a visual way to remember the concept.
  - For each chapter, include a story: who developed these ideas and how? Why did they decide to work on the problem? The details really sell it!
- I'm conflicted about the videos I've included. I think videos can be really useful, but I don't think I'm very good at making them. And it's incredibly time consuming! My thinking is that material should be presented to maximize clarity: if it's a story, write it in a paragraph so you can get the words right. If it's a complicated math proof, write it in LaTeX. If it's an example that you want students to try for themselves, that's where a video can come in handy: emphasize that they should pause the video to give it a shot, or even better, embed a quiz in the video so they have to pause and try it themselves.
- Chapter 7 on Time Series is too dense. Break this up into two chapters.
- Koan 12 may be too confusing: I think this needs a rewrite.
- Automatic grading for the koans: they have tests, but the tests can be a little fragile. A more robust way to automatically grade the koans would save you a lot of time while teaching the course.
- A robust way to grade the classwork would also be time well spent.
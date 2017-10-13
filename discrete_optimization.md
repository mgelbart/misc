---
layout: post
title: Lab spotlight: discrete optimization
---

Over the years I've strugged with the disconnect between "algorithms" — as a student might see
in a standard algorithms and data structures class — and optimization. Several of the algorithms taught in such courses
are in fact instances of (discrete) optimization: for example, Dijkstra's algorithm for finding the shortest path in a graph, or greedy algorithms for solving the traveling salesman problem, or dynamic programming. I like the example of dynamic programming in particular because it can often form a conceptual island in students' minds, without apparent connection to any of their other knowledge (for exmaple, in the famous [CLRS algorithms book](https://en.wikipedia.org/wiki/Introduction_to_Algorithms), dynamic programming is listed under the miscellaneous heading "Advanced Design and Analysis Techniques").
In this post I'll do a deep dive into one of our MDS assignments (or "labs" as we call them — but they're really assignments) that attempts to connect these concepts using a single application. 

I had two main goals for this lab. First, I wanted students to see that a few seemingly different algorithms are connected; in fact, so connected that they can all be used to solve the same problem. I hope that, after the lab, students will view dynamic programming as just another tool in a familiar toolbox. 

Second, I wanted students to see that there are often many ways of tackling the same problem, 
and that using the right approach can have huge implications on runtime. 
In order to choose the right algorithm, one has to consider the (admittedly ill-defined) _structure_ of the problem and
assess whether it's amenable to specialized tools like linear programming, for linear problems, or dynamic programming, for certain
sequential decision-making problems.

Towards achieving these goals, I had the students apply several approaches to [seam carving](https://en.wikipedia.org/wiki/Seam_carving), which is a clever way of resizing images. Seam carving works by assigning an energy value to each pixel (based on, say, changes in brightness) and then iteratively removing the seam (a connected path across the image) the includes the least energy. The problem of selecting the best seam is often used as an example application for
dynamic programming. And, indeed, the word "least" or "minimum" energy seam clues us in that we're dealing with an optimization problem.

The lab ([available here](https://github.com/UBC-MDS/public/blob/master/courses/512_alg-data-struct/labs/lab4/lab4.ipynb), as part of our [publicly available teaching materials](https://github.com/UBC-MDS/public)) is structured around four successively 
faster approaches to tackling the problem:

1. a brute force approach that recursively tries all possibilities.
2. treating the problem as an integer linear programming problem and solving it with [PuLP](https://pythonhosted.org/PuLP/).
3. dynamic programming.
4. improving the dynamic programming implementation to use code vectorization.

Note that (1)-(3) represent different algorithms whereas (4) is the same algorithm as (3), just with a new implementation.

One exciting aspect of this lab is that each approach is _significantly_ faster than the previous: often one or more orders of magnitude faster. This is satisfying because it really shows the consequences of using a good algorithm. (And the differences are large enough
that I don't have to worry about the unusual characteristics of one student's laptop messing up the punch line!) It's also interesting to see how a different implementation of the same algorithm can be hugely faster in many programming languages.

For the remainder of the MDS program, continuous optimization plays a much more prominent role than discrete optimization (i.e., in the machine learning and regression courses). But, hopefully this lab
equips MDS students with a bigger picture view of optimization and its applications to data science. 
For example, I hope that when they encounter decision trees in DSCI 571 (Supervised Learning I) they will
think about the training process as a discrete optimization problem that is solved approximately.

Finally, for your enjoyment, here's an image that has been (overzealously) resized with seam carving. Needless to say,
the resized image was not generated using the brute force implementation, which would take unimaginably long!

Original image:

![](jack-o-lantern-400x600.jpg)

Resized to 50%: 

![](jack-o-lantern-200x300.jpg)

The resized image somehow looks much scarier. Happy Halloween!

---------

[Mike Gelbart](http://www.cs.ubc.ca/~mgelbart/) is a Teaching Fellow in the MDS program and a Lecturer in the Department of Computer Science at UBC. 

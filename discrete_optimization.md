---
layout: post
title: Lab spotlight: discrete optimization
---

In this post I'll do a deep dive into one of our MDS assignments (or "labs" as we call them -- but they're really assignments).
I will discuss the fourth lab from DSCI 512: Algorithms and Data Structures. The lab [is
available here](https://github.com/UBC-MDS/public/blob/master/courses/512_alg-data-struct/labs/lab4/lab4.ipynb) 
as part of our recent effort to start putting some of [our teaching materials online](https://github.com/UBC-MDS/public).
As you'll see, the lab is a [Jupyter notebook](http://jupyter.org/) (.ipynb file). If you're not familiar Jupyter or don't have it set up then you'll miss out on some of its features, such as interactively running and editing the code, but that's not a big issue for this post; you should be able to see a static rendering of the
file directly on GitHub through the link above.

This lab is about discrete optimization. To provide some context, DSCI 512 comes midway through our first semester, which means
the students have just learned Python (some of our courses are all Python, some are all R, and some are a mix; this course is all Python).
The topics covered in DSCI 512 are as follows:

1. Introduction to time complexity, big O, linear and binary search
2. Space complexity, symbol tables, hashing, hash tables
3. Recursion 
4. Trees, binary trees, binary search trees
5. Introduction to graphs (directed and undirected)
6. Graph searches; breadth-first and depth-first search
7. Dynamic programming
8. More on discrete optimization

As you can see, there is a lot of material jammed into one 4-week course, which is typical given the condensed nature of our program.
The usual challenge, then, was to distill a huge amount of material into a very short list of essentials. 
With this course we also needed to cater just a little bit to tech job interviews, which
seem to focus disproportionately on algorithms and data structures.
Personally, I'm not sure the discrete optimization is truly an "essential" but I love the topic
and it's something I use all the time, 
for example to assign the MDS TAs to courses and 
lab slots each semester. Over time it will be interesting to collect feedback from our alumni and
their employers to see which parts of the program were most valuable.

Back to the lab. The lab is based around [seam carving](https://en.wikipedia.org/wiki/Seam_carving), which is a clever way of resizing images
that involves repeatedly solving an optimization problem. It is often used as an example application for
dynamic programming.

Note: If you haven't yet (and are interested), this might be a good time
to take a look at [the lab](https://github.com/UBC-MDS/public/blob/master/courses/512_alg-data-struct/labs/lab4/lab4.ipynb), 
especially the introduction to seam carving at the start.

The lab is structured around four successively 
faster approaches to tackling the problem:

1. a brute force approach that recursively tries all possibilities
2. treating the problem as an integer linear programming problem and solving it with [PuLP](https://pythonhosted.org/PuLP/)
3. solving the problem with dynamic programming
4. improving the dynamic programming implementation to use code vectorization

Note that (1)-(3) represent different algorithms whereas (4) is the same algorithm as (3), just with a new implementation.


I have two main goals for this lab. First, I want students to see that a range
of algorithms fall under the umbrella of discrete optimization. 
This can help connect some "conceptual islands" that students might have; for example, I've noticed
many students come out of their algorithms course without realizing that dynamic programming or
Dijkstra's algorithm are instances
of discrete optimization.

Second, I want students to see that there are often many ways of tackling the same problem, 
and that using the right approach can have huge implications on runtime.
One exciting aspect of this lab is that each approach is _significantly_ faster than the previous: often one or more orders of magnitude faster. This is satisfying because it really shows the consequences of using a good algorithm. And the differences are large enough
that I don't have to worry about the unusual characteristics of one student's laptop messing up the punch line.

For the remainder of the MDS program, continuous optimization plays a much more prominent role than discrete optimization (i.e., in the machine learning and regression courses). Hopefully this lab
equips MDS students with a bigger picture view of optimization and its applications to data science. 
For example, I hope that when they encounter decision trees in DSCI 571 (Supervised Learning I) they will
think about the training process as a discrete optimization problem that is solved approximately.

Finally, for your enjoyment, here's an image (overzealously) resized with seam carving. Needless to say,
the resized image was not generated using the brute force implementation, which would take unimaginably long!

Original image:

![](jack-o-lantern-400x600.jpg)

Resized to 50%: 

![](jack-o-lantern-200x300.jpg)

The resized image somehow looks much scarier. Happy Halloween!

---------

[Mike Gelbart](http://www.cs.ubc.ca/~mgelbart/) is a Teaching Fellow in the MDS program and a Lecturer in the Department of Computer Science at UBC. 

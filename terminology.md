# Confusing Terminlogy.
### NOTE: The structure of this document is evolving and is admittedly not great at present.

## Wording conventions we will use
* you can say "draw N observations", or "draw a sample of size N", but NOT "draw N samples".
* don't say "the likelihood of the data" 
* `data`: those under a certain age can pretend it's not plural [[article](https://www.theguardian.com/news/datablog/2010/jul/16/data-plural-singular)]

## Equivalence classes
* "regression coefficients" = "weights" and maybe also "parameters" 
* "residual variance" = "noise variance"
* "inputs" = "predictors" = "features" = "explanatory variables" = "regressors" = "independent variables" = "covariates"
* "outputs" = "outcomes" = "targets" = "response variables" = "dependent variables". also called a "label" if it's categorical.
* "Gaussian distribution" = "Normal distribution" = "bell curve"
* "sensitivity" = "recall" (see Error types below)
* "training" =  "learning" = "fitting" (sort of; depending on context)
* "kriging" = "Gaussian process regression"
* "Bayesian network" = "Bayes net" = "directed graphical model" = "DAG graphical model" (DAG = directed acyclic graph)
* "Markov random field" = "Markov network" = "undirected graphical model"
* "ordinary least squares" (OLS) = "linear least squares" ?= "least squares"

## Definitions

### Probability stuff
* `mean`: mean of a distribution  corresponds to the expected value of the random variable. but in practice talking about the mean of a random variable is fine too. not to be confused with the sample mean...
* words like `expected value` refer to the r.v. and NOT the sample mean
* but `variance` again can be used to refer to the r.v. or the sample variance

### Error types 
* `Type I error`: false positive, meaning it was actually negative but you said positive
* `Type II error`: false negative, meaning it was actually positive but you said negative
* `sensitivity` aka `recall` aka `power`: true positive rate. in math: 1 - (# of type II errors)/(# of true positives)
* `specificity`: true negative rate. in math: 1 - (# of type I errors)/(# of true negatives)
* `precision`: 1 - (# of type II errors)/(# reported positives)

[[relevant image](https://cloud.githubusercontent.com/assets/6865016/16235952/720f2a36-378b-11e6-9355-449be54f0729.png)]

Note: [`power`](https://en.wikipedia.org/wiki/Statistical_power) and `sensitivity` are almost the same thing. But we tend to think of power as a conditional probability (a property of a statistical test) whereas we tend to think of senitivity/recall as counts (a property of the predictions).

#### `lasso` and `ridge` regression
* `lasso regression` means using L1 regularization
* `ridge regression` means using L2 regularization


## Confusing words (Stat-ML dictionary)

#### `loss function`
  * in ML this means the function that takes the true outputs and the predicted outputs and returns a "loss" which becomes a term in your objective function. For example the 2-norm of y-yhat is a common one. Another example is the [hinge loss](https://en.wikipedia.org/wiki/Hinge_loss). Different loss functions are used for regression and classification. These are sometimes also called "cost functions".
  * in statistics, the above meaning is sometimes intended but in other contexts this is a decision theory term meaning the utility function (confirmation needed).

#### `regression`
  * to a statistician this means continuous OR categorical outputs
  * to ML regression means continuous output, classification means categorical outputs
  * to a statistician it's more about interpretation, to ML it's generally about prediction

#### `bias`
  * even within statistics this word has [a lot of meanings](https://en.wikipedia.org/wiki/Bias_(statistics)). See also [bias of an estimator](https://en.wikipedia.org/wiki/Bias_of_an_estimator)
  * in ML, we talk about the [bias-variance tradeoff](https://en.wikipedia.org/wiki/Bias%E2%80%93variance_tradeoff)
  * in ML, when we have a trasformation of the form Wx+b (especially in neural networks) we refer to b as the "bias vector" or the elements of b as the biases. In DSCI 561 we would call this the "intercept". For example, see [this Stack Overflow post](http://stackoverflow.com/questions/2480650/role-of-bias-in-neural-networks).

#### `factor` 
To statisticians, means `categorical variable` and `factorial experiments` means trying all possible combinations of two or more factors. But in math it means one of several things multiplied together. Then to make things worse there is `factor analysis` and `factor graphs`.

#### `parameter`
  * used to describe probability distributions, like "the Beta distribution has a shape parameter and a scale parameter"
  * used in machine learning to refer to the things that are getting learned
  * in the worst case, also used to refer to function arguments in a programming language, but this would be unusual

#### `shrinkage` and `borrowing strength`
 This can be thought of in terms of regularization. As an example, using L2 regularization in regression "shrinks" the coefficients. But it's best not to interpret "shink" as "make smaller"! Rather, it is more helpful to go to the Bayesian analogy, where the regularizer is viewed as a prior that the weights are near zero. But you could also have a prior that the weights are near some other value, and then "shrink to that value". So, you are shrinking your uncertainty rather than literally making the weights smaller, although both become true when you are shrinking towards zero.
 
 This is all very related to "borrowing strength". The strength does not imply a change in a particular direction, but rather that you increase the strength of your beliefs by looking at other genes/counties/etc. "Shrinkage" and "borrowing strength" are different. With shrinkage you could have a separate prior for each variable and shrink each one towards that prior, whereas borrowing strength necessarily implies an interaction between rv's via a prior that entangles them. See [this GitHub issue](https://github.com/UBC-MDS/DSCI_553_stat-inf-2/issues/15) for some nice examples of borrowing strength. 

#### `early stopping`
In machine learning, this refers to terminating an optimization routine before reaching convergence, which supposedly mitigates overfitting (see [here](https://en.wikipedia.org/wiki/Early_stopping)).  In statistics, this sometimes refers to stopping an experiment early, particularly as in early stopping of clinical trials.

#### probability notation
In statistics, it is convention to use f(x) for a probability density function and p(x) for a probability mass function, whereas in machine learning p(x) is typically used in both cases. Probability distributions are generally tricky notation-wise and variants on these conventions are not uncommon in both disciplines. 

#### `correlation`
This is a word we know and love in statistics. But, in databases (DSCI 513), two queries are correlated if they share a variable in common.

### Common acronyms:
 * `FDR`: False Discovery Rate
 * `MC`: Monte Carlo
 * `MCMC`: Markov chain Monte Carlo
 * `OOP`: object-oriented programming
 * `IID`: independent and identically distributed
 * `RV`: random variable
 * `CDF`: cumulative distribution function
 * `ROC`: receiver operating characteristic (curve) -- sort of like precision/recall
 * `MAP`: maximum a posteriori (DSCI 553), not to be confused with `map` of MapReduce (DSCI 513/525).
 * `NLP`: natural language processing
 * `PCA`: principal components analysis
 * `EM` : expectation maximization algorithm

### Acronyms that have more than one meaning:
* `S3`: is an OOP paradigm in R (DSCI 524), and a storage service offered by Amazon (DSCI 525)
* `ML`: Maximum Likelihood; Machine Learning
* `CI`: Confidence Interval (DSCI 552), Continuous Integration (DSCI 524)
* `IP`: Internet Protocol (as in IP address, DSCI 525), and Intellectual Property (as in software licenses, DSCI 524)
* `MDS`: Master of Data Science, or Multi-Dimensional Scaling (DSCI 563).
* `PDF`: Probability Density Function, or the file format, Portable Document Format. And at UBC it even has a third meaning: Post-Doctoral Fellow. So, at UBC, a PDF could save a plot of a PDF as a PDF!

### Other things that have more than one meaning
* `hypothesis` means one thing in Stats (hypothesis testing), and another in machine learning (basically, a model, or decision boundary)
* `Abstraction`: visualization meaning (what is it??) vs DSCI 524 / CS meaning of hiding away the details and building higher level constructs on top of each other ("layers of abstraction")
* `Spark`: Apache Spark (DSCI 525) and also one of our grading rubric dimensions (for creativity, going above and beyond expectations).
* `complement`: an event not happening (DSCI 551); a graph with all the edges switched on <--> off (DSCI 512).

## Compare and contrast
#### `discriminative` vs. `generative`
A [discriminative model](https://en.wikipedia.org/wiki/Discriminative_model) helps you make predictions about the output given the input. For a classifier, this could be a predicted class or a probability for each class. A [generative model](https://en.wikipedia.org/wiki/Generative_model) allows you to _generate_ new data, for example by first sampling a class and then sampling a vector x given that class. 

#### `Bayesian` vs. `frequentist`
This is a tough one. 

Cop-out answer: see DSCI 553. Note that this is related to but not the same as `discriminative` vs. `generative` above. 

Attempt at a fuller answer: It seems like Bayesian vs. frequentist is more in the domain of statistics. Then the word Bayesian is also used in ML, is does indeed often used to mean a generative approach. You probably wouldn't say an ML method is "frequentist" though. Also, when things are "Bayesian" you are typically trying to compute a posterior distribution.

#### `supervised` vs. `unsupervised`
See DSCI 571. In [supervised learning](https://en.wikipedia.org/wiki/Supervised_learning) you are given a bunch of input-output pairs and you try to model the relationship between them so that, given a new input, you can predict its output. In [unsupervised learning](https://en.wikipedia.org/wiki/Unsupervised_learning) you don't have the input-output pairs -- just a bunch of data. Your job is then to find some structure or pattern in the data. In case this is helpful: you could think of this as supervised learning except that you don't know which features are the inputs and which are the output(s). 

See also [pattern recognition](https://en.wikipedia.org/wiki/Pattern_recognition) and [semi-supervised learning](https://en.wikipedia.org/wiki/Semi-supervised_learning).

#### `parametric` vs. `non-parametric`
Parametric models have _parameters_. Linear regression is an example. Then the training of the algorithm is picking these parameters. Non-parametric models don't have a fixed set of parameters; rather, the complexity of the model is allowed to grow with the size of the data. An example is the k-NN classifier.

#### `learning` vs. `inference`
Another tough one. This relates to the discussion of Bayesian models above. One (probably flawed) definition of learning is setting your model parameters to fit your data, whereas inference is finding a posterior distribution over unknown quantities of interest. Here's some [more thoughts on this](https://www.quora.com/What-is-the-difference-between-inference-and-learning) 

## Misc
This is not really a terminology thing, but noting a connection between `collaborative filtering` in recommender systems (ML) and `data imputation` (statistics). Both are about figuring out missing values. But imputation is more of a means to an end whereas in collaborative filtering finding those values is the end itself.

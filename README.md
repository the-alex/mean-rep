EECS 398 Project
================

## TL;DR
We're going to implement three dimensionality reduction algorithms. PCA, fastICA, and, if there's time, MIF. We'll motivate these methods by talking about the difficulties of working with high dimensional data and show examples of situations where DR is useful.

Clayton's official ruling ...
> Since dimensionality reduction is not a problem we have talked about in class, a good project could just focus on very fundamental issues, such as why is dimensionality reduction useful (e.g., irrelevant dimensions, curse of dimensionality). If you can just come up with some very basic demonstrations of when and where dimensionality reduction useful, on some real data with A couple of basic methods, I think that would be great.

## TODO

* Short Term
    - Skeleton presentation
    - Implement PCA
* Long Term
    - Find data which demonstrates Curse of Dimensionality.

## Outline of Presentation
1. High Dimensional Data
    - What is it?
    - Why is it good / bad?
    - Curse of Dimensionality
        + Increase computational speed
        + Reduce memory overhead
        + Difficult to sample
    - Noisy features
1. What is Dimensionality Reduction?
    - A class of techniques which serve to transform the data into something less noisy.
    - ... or a method of figuring out which dimensions to drop.
1. Why is DR useful?
    - Minimize curse of dimensionality
    - Feature Selection
    - Visualizing high dimensions
1. Examples of DR
    - Three methods to deal with this.
    	- PCA
    	- fastICA
    	- MID
1. Analysis and Performance
    - PCA for feature selection on anonymized data
    - ICA for signal decomposition
    - MID for maximally informative features
1. Extras (if we have time)
    - t-SNE


## `/presentation/`
remarkJS will be used to create outline of presentation. I don't think we can use it- it's just too restrictive. It doesn't let me add all the visual aides I want without mucking about with CSS rules. That's dumb.

#### To Present

```bash
cd presentation/
# for python 3 ...
python -m http.server
# for python 2
python -m SimpleHTTPServer
```

Navigate to web browser and load `localhost:8000`

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

## `/presentation/`
This folder contains the presentation. We don't have to use remarkJS for the slides but I just think it'll make our lives easier. Maybe it won't and we'll switch to google slides. My only issue there is that it doesn't support latex.

#### To Present

```bash
cd presentation/
# for python 3 ...
python -m http.server
# for python 2
python -m SimpleHTTPServer
```

Navigate to web browser and load `localhost:8000`

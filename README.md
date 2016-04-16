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
        -  PCA
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



## Side notes
Things I wanted to save but didn't have a place for at the time I needed them.

PCA can be used on word embeddings as well! Gets out junk words- words that don't seem to contribute to variance or are otherwise not used enough to be thought of as significant.

## ICA

* We have a source S \in R^n. (n = number of speakers)
* s_j^i = signal from speaker j at i
* We observe x_i = As_i, where x^i \ in R^n
* Assume we have n microphnes.
    - Each mic records some linear combination of what the speakers are saying.
    - ie. x_j^i (what mic j records at time i) = \sum_k{A_{jk}S_{k}^{(i)}}
* GOAL: Find a matrix W = A^-1 such that we can recover the original signal s^{(i)}=Wx^{(i)}
* Ambiguity
    - Can't preserve the indexing.
        - We may label the speakers as s1 and s2, but the algorithm cannot tell.
    - It doesn't preserve the sign
        - Think of box of random values.
* Data Must be non-Gaussian

At time i, what microphone j is recording is some linear combination of what all of the speakers are saying at time i.

Applications
* EEG Data
* Voltage over time.
* A number of electrodes are placed on a patient.
* Each electrode is like a microphone, picking up a different linear combination of sources.
* Use ICA to separate the signals.
* Correllate each component signal to an artifact causing event (or source) like a heartbeat or an eyeblink.
* Once those are identified, you can subtract them out of the conjugate signal to get a cleaner represetntation of brain activity

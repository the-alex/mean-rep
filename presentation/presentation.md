class: center, middle

# Dimensionality Reduction Techniques

![Default-aligned image](http://scikit-learn.org/stable/_images/plot_digits_pipe_001.png)

---
# High Dimensional Data
Data with many features.
- Stock data.
- Car accident report.
- Medical records.

It is ...
- Hard to visualize.
- Difficult to sample.
- Computationally complex.
- Difficult to estimate.

![Multivariate Gaussian](https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Gaussian_2d.svg/2000px-Gaussian_2d.svg.png)

---
class: center

# So how do we deal with high dimensional data?

--

# Create representation of the data with fewer dimensions.

---

# DR in a nutshell 

- Refers to a class of techniques for creating __Low Dimensional Embeddings__.
- The goal is to create an embedding which preserves the attributes of the data we want.
- What we want to preserve from our old data in our new representation will depend on the application.

???



---
# Why is DR useful?

- Mitigate the effects of the Curse of Dimensionality.
- Create a concise representation.
- Encourage non-convex problems to converge more quickly and at more promising minima / maxima.
- Visualizing high dimensional data while preserving some structure.
- Compression

---
# Methods
- Principle Component Analysis
- Maximally Informative Dimensions
- Independent Component Analysis
---


# PCA

- We want to find the unit vector `\(u\)` to project our data onto such that the resulting vector will retain the greatest variance.

- Math version...
	- Choose `\(u\)`: <br> <br>
    `\(\max\limits_{u = \|u\| = 1}\frac{1}{m} \sum_{i=1}^{m} (x^{(i)T}u)^2\)` <br> <br>
	`\(\rightarrow u^T \Big[\frac{1}{m}\sum_{i=1}^{m}x^{(i)}x^{(i)T}\Big]u \)`

- A vector `\(x^{(i)}\)` projected onto `\(u\)` has length `\(x^{(i)T}u\)`	
- We want the sum of squared distances of the projections to be far from the origin, or in other words,  we want the projections of `\(x^{(i)}\)` onto `\(u\)` to have large variance.	

---

# PCA

## The PCA Algorithm

* Pre-processing ...
    - Normalize to zero mean 

        - `\(\mu_{i} = \frac{1}{m} \sum_{i=1}^{m}{x^{(i)}}\)`

        - set `\(x^{(i)}=x^{(i)} - \mu\)` to get means centered at 0 
    
    - Normalize the variance (if necessary) to unit variance. 

        - `\(\sigma_{j}=\frac{1}{m} \sum_{i = 1}^{m}{\left(x_{j}^{i}\right)^2}\)`

        - Set `\(x_{j}^{(i)} = \frac{{x_j}^{(i)}}{\sigma_j}\)`


```matlab
% Equivalent matlab code
X=X-mean(X(:));
X=X/std(X(:));
```

---

# PCA

Finding the principle Eigenvector

Finding principle eigenvectors of the covariance matrix.
  -There will always be a full set of eigenvectors because the covariance matrix is known to be symetric, therefore it cannot be defective.

These principle eigenvectors represent the solutions to our original maximization problem.

We arrange them in descending order based on their eigenvalues.

---

# PCA

## Implementation

```matlab
function [retA, V] = pca_prime(A, k)

    % subtract mean from each column
    A = bsxfun(@minus, A, mean(A,1));
    
    % generate covariance matrix
    C = cov(A);
    
    % get eigen values/vectors
    [V D] = eig(C);
    
    % sort eigen values
    [D order] = sort(diag(D), 'descend');
    
    % sort columns based on eigenvalues
    V = V(:,order);
    
    % return new data points with k dimensions
    retA = A*V(:,1:k);
end
```

---

# ICA

## Motivation
* Cocktail Party Problem
* EEG Data

--

These two problems are analogous.
* Estimate the source signals, given recordings of the received signals.
* We assume there are as many source signals as there are microphones.

???


---

# ICA Formulation

* Take a matrix denoting source data `\(S \in \textbf{R}^{N \times M}\)`, where N denotes the number of speakers and M denotes the number of samples taken at some time interval. Individual sources are denoted `\(s_{j}^{(i)}\in \textbf{R}^M\)` for the signal emitted by source `\(j\)` sampled at time `\(i\)`.
* We observe a matrix of the same dimensions `\(X\)`, which we use to represent our observed signals. Similarly, `\(x_{j}^{(i)}\in \textbf{R}^M\)` for the signal received by sensor `\(j\)` received at time `\(i\)`.

We assume each signal in X can be represented as some linear combination of sources in S. Because we assume the data is being modified by a linear transformation, all we need to do is find an invertible matrix `\(W\)` in order to estimate the original sources.
$$x^{(i)}=As^{(i)} \text{ and } s^{(i)}=Wx^{(i)} \text{ where } A=W^{-1}$$

---

class: center, middle

# `\(\LaTeX{}\)` in remark

---

# Display and Inline

1. This is an inline integral: `\(\int_a^bf(x)dx\)`
2. More `\(x={a \over b}\)` formulae.

Display formula:

$$e^{i\pi} + 1 = 0$$

---
class: center, middle
# _FIN_

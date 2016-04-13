class: center, middle

# Dimensionality Reduction Techniques

![Default-aligned image](http://scikit-learn.org/stable/_images/plot_digits_pipe_001.png)

---
# Outline

### High Dimensional Data
### DR in a nutshell
### Why is DR useful?
### Methods of DR
### Analysis and Performance

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

- Dimensionality reduction refers to a class of techniques which map higher dimensional data to lower dimensional approximations.
- The resulting representation is normally referred to as a _"low dimensional embedding"_.
- The goal is to create an embedding which preserves the attributes of the data we want.
- What we want to preserve from our old data in our new representation will depend on the application.

---
# Why is DR useful?

- Mitigate the effects of the Curse of Dimensionality.
- Create a concise representation.
- Encourage non-convex problems to converge more quickly and at more promising minima / maxima.
- Visualizing high dimensional data while preserving some structure.
---
# Methods
- Principle Component Analysis
- Maximally Informative Dimensions
- Independent Component Analysis

---

# PCA

1. Do it.
1. `return 0`

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

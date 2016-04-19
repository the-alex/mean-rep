Abstract:

In this report, we attempt to provide a clear motivation for dimensionality reduction as an effective preprocessing step in the machine learning pipeline for mitigating the negetive effects of high dimensional data. We then investigate the Principle Component Analysis and Inedpendent Component Analysis algorithms by applying them to a problem in their respective domains.


Introduction:

In general, the more raw data you have access to, the better. Having more access to raw data provides the investigator with more information to synthesize, potentially allowing more accurate or sophisticated predictions or insights in to the data. However, there is a necessary tradeoff between the number of dimensions (or features) and the algorithmic complexity of the model. As more dimensions are added, the machine implementing the algorithm will require more space and computational power to converge to an answer. Additionally, as the number of dimensions to the data increases, the number of samples required to model a distribution increases exponentially.

[Image -- This can be shown easily by comparing the single dimensional gaussian to a two dimensional gaussian. Given 30 data points, we can confidently model a 1D gaussian. However, in the 2D case, using just thirty data points may leave certain aspects of the distribution questionable]

Additionally, so dimensions or features of the data may not be useful. The data may be effectively noise or otherwise not worth the computational tradeoff. 

The most direct method of attacking the problems of high dimensionality is simply to reduce the number of dimensions we must use. This can be done by simply sorting the features which are most valuable to us as calculated by some target metric such as variance or mutual information, or by generating new representations of the data in a lower dimension. In many cases, the later method will result in the loss of some information. However, the goal of these algorithms is not to perfectly preserve all dimensions of the data, but rather to transform the data such that the lower dimensional embedding preserves as much of some target value as possible.

----

Principle Component Analysis: PCA is an algorithm of this later type. The goal of PCA is to find a low dimensional embedding of the data consisting of the orignial data points projected onto the space spanned by the orthogonal principle components of the data.


----


Independent Component Analysis aims to isolate the individual component signals from a mixed signal formed by a linear combination of the source signals. The applications of this are seen very clearly in two problems reducible to each other.

The Cocktail Party Problem: In the cocktail party problem, we imagine a group of persons at a cocktail party enjoying conversation. The particularly prying host has placed a number of microphones around the party venue in (for our purposes) arbitrary locations. The host intends to listen in on the conversations their guests were having later. The challenge for the host is to seperate the N source signals, given that they only have access to the mixed signals recorded by the microphones.

The EEG Noise Problem: EEG caps record the electrical activity of the brain through metal disks placed on the skalp of the patient known as electrodes. While the goal of an EEG is to record the brainwave patterns of the patient, noise from other electrical impulses is often read in the data. Oftentimes involuntary eye blinks and heartbeats generate this noise across all electrodes. In order to account for this, EEG specialists must take their data and isolate the source signals of the interference to subtract it from the mixed signals recorded on the sensors, thus "cleaning" the data.

These two problems are mathematically reducible to each other, and serve as model problems for ICA to solve. In both situations, we are faced with some number of source signals being generated, mixed, and ultimately received by some number of sensors. Symetrically, the challenge in both is to separate the mixed signals into their approximated isolated components. To frame this more rigorously, we are presented with a source matrix S \in R^{N x M}, where a row in the source matrix is the signal emitted by an individual source and the columns of N are the values over some discrete time interval. What we observe is the mixed signal matrix of the same dimensions, X \in R^{N, M} where each signal row has been transformed by a mixing matrix A. Given that we assume a linear transformation A is responsible for transforming our source matrix S into our observed matrix X, we can simply invert the matrix of A and take the resulting matrix A^{-1} = W and multiply our observed data by our W. This yeilds the following equations.

for all sources s^(i) \in S and x^(i) \in X ...
    
    x^(i)=As^(i), s^(i)=Wx^(i), A = W^{-1}

... where x^(i)_j is the sound uttered by speaker j at time i.


The concrete goal of ICA is to approximate the matrix W. This is accomplished by defining a maximum likelihood estimation problem and performing stochasitc gradient descent on the likelihood function in search of an optimal matrix W. 

We begin to form this problem by considering the probability density function p_s(s) for a random variable s \in R. Note, that in doing this we are implicitly asserting the independence of our sources s_i, which is clearly incorrect, however, it can be shown that with sufficiently corellated We then define the joint probability distribution from the marginal distribution over each source s_i.

\p(s) = \product_{i=1}^{n}p_s(s_i)



Experimental Implementation: To test the basic capabilities of ICA for estimating the inverse of a mixing matrix W, we consider the two source / two sensor configuration. This simplifies our model slightly, as we will only need to retrieve one independent component to obtain the other.

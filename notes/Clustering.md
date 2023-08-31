## Cluster / PAM

#### Levshina 2015:Chapter 15 (cluster analysis)

- **Behavioural Profiles**:
  - typically requires many instances of a construction or a word coded for a number of semantic, syntactic and other categorical variables that characterize the local **context**, which is usually defined at the level of the sentence where the word occurs.

  - Next, the data are represented as vectors of proportions of each value in a variable -- BP vectors. The numerical differences between the vectors can be transformed into **distance** between the objects (words or word senses).

  - Next, one can investigate semantic relationship between the objects by **clustering** them and exploring the common and distinctive features of clusters and individual words.

  - **Main steps of the example** (*maybe useful for the description of my work!*):
    1. **Creation** of numeric BP vectors from categorical variables

    2. **Computation of the matrix of distances** between the BP vectors
    3. **Cluster analysis** and identification of the **optimal number of clusters**
    4. **Interpretation** of the cluster solution in terms of the distinctive features of clusters
    5. **Validation** of the cluster solution

- **Computation of the matrix of distances**:
  - aggregate the information over many variables and try to find structure in the data
  - The distances reflect how (dis)similar the constructions are with regard to the proportions of value of the contextual variables that their BP vectors contain -- the more similar their vectors, the smaller the distance.
  - **distance metrics**: Manhattan; Euclidean; Maximuim; Canberra; Gower; !Levenshtein (*adist()*); Cosine
- **Hierarchical cluster analysis**
  - dendrogram
  - hclust()
  - **divisive clustering**: cluster trees grow from roots to leaves; **labelled agglomerative clustering**: from leaves to roots (implemented in hclust)
  - **average silhouette width**: shows the average well-formedness of the clusters i a given solution; < 0.2 should be interpreted as a lack of substantial cluster structure in the data.
  - preferable for detailed data analysis, as it provides more information than non-hierarchical methods
- **Partitioning methods**:
  - non-hierarchical cluster analysis groups objects into a pre-specified number of cluster.
  - convenient when the dataset is large
  - begins with a random classification of the object
  - Next, the classification if refined by an iterative algorithm by reallocating the objects from one cluster to anther until no further improvement can be made.
  - ***k*-means**: 
    - observations are clustered around cluster centroids ('mean'); 
    - These centroids are abstract "prototypes",  which are usually not identical to any particular member of their cluster. 
    - **kmeans()**
    - sensitive to outliers and often create singleton clusters.
    - the main goodness-of-fit criterion is the so-called within-cluster sum of squares (WCSS).
    - **scree plot**: help to compare different WCSS and decide on the number of clusters
    - how to interpret scree plot: the rule of thumb is to find the point where the lines 'elbows'. That means that after this point, adding new clusters does not help decrease WCSS very significantly.
  - **partitioning around medoids**: 
    - the medoid is the most centrally located exemplar of a cluster, average distance from which to all other members of the cluster is minimal; 
    - Unlike centroids, medoids are always members of their clusters. 
    - more robust than k-means
    - **pam()**: accept both numeric vectors and a distance matrix.  
- **Everitt et al. (2011) *Cluster Analysis*** -- general understanding of different clustering approaches.



### Grundlage / Theorie von PAM

----

#### Kaufman & Rousseeuw (2005):

- 2009: https://books.google.de/books?id=YeFQHiikNo0C&pg=PA1&lpg=PA1&dq=Finding+groups+in+data&source=bl&ots=5Aw9F6MzsH&sig=ACfU3U2qpnZgyjKyRLfYAGLcNqT1TRVMWA&hl=zh-CN&sa=X&ved=2ahUKEwiG9cvup_npAhXlsYsKHfpND0A4HhDoATAHegQIChAB#v=onepage&q=partitioning%20around%20medoids&f=false
- 37
  - the choice of a clustering algorithm depends on both on the type of data available and on the particular purpose.
  - cluster analysis is mostly used as a descriptive or exploratory tool [...] we do not wish to prove (or disprove) a preconceived hypothesis

- 38:
  - A partitioning method constructs *k* clusters. That is, it classifies the data into *k* groups
  - *k* ≤ *n*
  - two different clusters cannot have any objects in common.

- 40:
  - PAM: in order to obtain *k* clusters, the method selects *k* objects (which are called *representative objects*) in the dataset.
  - the average distance (or average dissimlarity) of the representative object to all the other objects of the same cluster is being minimized.
  - such an optimal representative object we call the *medoid* of its cluster.

- 41:
  - minimize the average squared distance and yield *centroids*
  - By construction, the *k*-medoid method tries to find "spherical" clusters, that is, clusters that are roughly ball-shaped. not suited to discover drawn-out clusters
  - **PAM** is especially recommended if one is also interested in the representative objects themselves, which may be very useful for data reduction or characterization purposes.

- 68

> When partitioning a set of objects into *k* clusters the main objective is to finde clusters, the objects of which show a high degree of similarity, while objects belonging to different clusters are as dissimilar as possible. 

> The algorithm used in the programm **PAM** is based on the search for *k representative objects* among the objects of the data set. As evoked by their name, these objects should represent various aspects of the structure of the data. In the cluster analysis literature such representative objects are the so-called **medoids** of the clusters. After finding a set of *k* representative objects, the *k* clusters are constructed by assigning each object of the data set to the nearest representative object.

- 71-72

> In many clustering problems one is particularly interested in a characterization of the clusters by means of **typical or representative objects**.These are objects that represent the various structural aspects of the set of objects being investigated. There can be many reasons for searching for representative objects. Not only can these objects provide a characterization of the clusters, but they can often be used for further work or research, especially when it is more economical or convenient to use a small set of *k* objects instead of the large set one started off with. **In the method used in the PAM the representative object of a cluster is its medoid, which we define as that object of the cluster for which the average dissimilarity to all the objects of the cluster is minimal.** [...] As the objective is to find *k* such objects, we call this the **k-medoid method** [...].

> Another typical aspect of PAM is that it provides a large number of statistics by which a thorough investigation of the clustering results is made possible. Particularly worth mentioning are the medoids of the clusters (with their coordinates), the diameters and separations of the clusters, and also a graphical representation of the clusters by means of so-called silhouettes.

- 95:
  - silhouettes only depends on the actual partition of the objects and not on the clustering algorithm what was used to obtained it.
- 96: 
  - **average silhouette width** is defined as the average of the s(i) for all objects *i* belonging to that cluster [...]
  - clusters with a larger average sihouette width are more pronounced.

#### Kaufman & Rousseeuw (1987)

> The **k-medoids** method offers the advantage of not requiring the actual measurement data as it can also be applied to a collection of dissimilarities. Such dissimilarites are for example subjective assessments of relationship between objects, in which case no assessment exist.



### Anwendung von PAM

-----

#### Kessler (1995) "Computational Dialectogy in Irish Gaelic"

#### Dhesi & Borja (2002)

- 243

> The statistical methods presented in this paper can be divded in two classes: tree-based methods and geometric methods. [...] their main difference are in their output.

> Tree based: [...] it will be a tree showing the different branches of the family according to a particular definition of distance between groups of languages, as in classical cluster analysis method (Anderberg 1973), or a phylogenetic tree, obtained by minimizing a functional (e.g. sum of squares) definited in terms of geometrical inequalities. 

> Geometric: yield a configuration, typically in two or three dimensions, in which the points represent the languages and the distance relations shouwn there mirror those present in the lexical dissimilarities (Cox & Cox 1994).

- 246-247

> This method starts with a fixed number of clusters and then chooses the group identity of a particular subject by identifying its nearest medoid, which is centrotype for the cluster. This implies that the optimization is done with respect to *k* objects, and PAM therefore can produce an optimal partition of the objects into *k* groups, as well as yielding the medoid objects for each group. 

> a index to determine the optimal number of cluster.

> a silhouette plot to show the partitioning of the data

> an **average silhouette width** is given, with the value ranging from -1 to 1. A silhouette width of 0 for any object indicates that it lies between two clusters, -1 implie a very badly clssified object, and 1 indictes a very well classified object. 

- 248

> **Geometric methods**: Most geometric methods can be refereed to a distance methods. These produce a configuration of points, representing in most cases a 'map' of the data objects. The nearness relationships amongst the objects in this fitted map are distances, not dissimilarities [...] . 

> Not that any distance is a dissimilarity, though the converse is not true.

> Distance-based method are often known as **metric** methods. 

> Given a dataset of *n* observations over *p* variables, a visual aid would be *n* points in *p*-dimensions, where *d* is less tha *p*. MDS attempts to find a configuration in *d*-dimensions, where *d* is less than *p*. Typically, *d* =2 or *d* = 3. **Before perfoming MDS, the data have to be transformed into dissimilarity matrix**. Distances between points in the lower dimensional configuration shoud match those of the original dissimilarity matrix, in the sense that proximity information is preserved as much as possible.

#### Wälchli (2018) "'As long as', 'until' and 'before' Clauses: Zooming in on Linguistic Diversity"

- 143-144

> [...] dissimilarity table of all paris of contextually embedded situations serves as an input for two kinds of statistical analyses: (i) A **probabilistic semantic map** of [...] is constructed with **MDS** where each dot represents a contextually embedded situation and the distance between any pair of docts reflects the probability that both are expressed by the same connector in any language (See also Wälchli & Cysouw 2012). (ii) The contextually embedded situatins are sorted into various numbers of clusters by **PAM** and the optimial numer of clusters for partitioning is determined. 

> Partitioning can used as a basis for a typological classification of the doculects of the sample. 

- 146

> **Similarity-semantics approach**: similarity is considered to be a more basic notion than identity in semantic analysis. 

> assuming that any two meanings are potentially different from each other in meaning. The relevant question in similarity semantics is how similar or dissimilar various meanings are. **Similarity semantics can be modelled in form of a multi-dimensioanl space, where the distance between any pair of exemplars reflecs the degree of (dis)similarity in meaning**. What traditional semantics considers to be one meaning typically corresponds to a dense cluster of exemplars in semantic space. Similarity semantics predicts that there can be disagreements as to whether a set of exemplars constitute one or two distinct meanings, since there is no unequivocal way to determine exactly how many clusters there are. 



- 153

  **Clear description about the MDS and Partitioning**

> Partitioning divides the cross-linguistically aligned passages into a freely selectable number of clusters such that all clusters are as dense as possibile. A smaller number of clusters corresponds to a rougher semantic analysis, where many finer distinctions relevant only for a few languages are glossed over. A larger number of clusters corresponds to a more fine-grained division of the semantic space.

- 158
- Combined usage of MDS and PAM for analysis of clusters 



#### Moisl (2015)

----

- 7:
  - cluster analysis is a tool for hypothesis generation

- 153: 
  - identification of structure in data is identification of clusters

- 155:
  - The fundamental intuition underlying cluster analysis is that data distributions contain clusters when the data objects can be partitioned into groups on the basis of their relative similarity such that the objects in any group are more similar to one another than they are to objects in other groups, given some definition of similarity.

- 156: clustering methods
  - two kinds according to the output: **hierarchical** and **nonhierarchical**

- 159: types of nonhierarchical
  - projection, proximity-based, density-based

- 180-181: proximity-based nonhierarchical methods:
  - treat clustering as a mathematical optimization proble, where ony a small subset of all possible paritions is examned in the hope of finding the optimal one
  - An initial *k*-cluster partition is defined and an **iterative** procedure is used in which, at each step, individual data points are moved from cluster to cluster to form a new partition and the result is evaluated in relation to the objective function *f* : if the value of *f* shows an improvement over the preceding one the new partition is retained, and if not it is discarded and another one is tried.
  - Ideally, the procedure will gradually converge on a partition for which no change leads to an improvement in the value of *f*, at which point the partition is taken to be optimal.
  - difficulty: must be aware of te possibility that the supposedly optimal clustering is not in fact so.

- 181-182: **k-means**
  - *k*-means is based on the idea that, for a given set of data objects *O*, each cluster is represented by a **prototype** object, and a cluster is defined as the subset of objects in *O* which are more similar to, or in distance terms closer to, the prototype than they are to the prototype of any other cluster.
  - iterative procedure
    - selecting *k* prototypes which initializes where the custer centred in the space
    - assign each of the *m* data points to whichever of the *k* prototypes it is closest to in the space using a suitable proximity measure -- yields *k* clusters
    - calculte the centroid of each of the *k* clusters resulting from the last step -- each centroid becomes a new cluster prototype
    - repeat the last two steps until the centroids stop changing their location in the space.
- 187:
  - Because *k*-means is based on centroids, it is strongly affected by the presence of **outliers** which distort the location of the centroids in the data space
  - other problems of k-means

- 191: PAM
  - using medoids instead of centroids eliminate the effect that outlier pulls the cluster centroid away.
  - **centroid**: an abstraction only coincidentally corresponds to any one of the acutal data points in the cluster
  - **medoid**: an actual data point, and more specifically the point which is closest to the centroid and therefore best represents the centre of the cluster.
  - When medoids instead of centroids are used as cluster prototypes, outliers cannot affect the prototypes because no averaging is involved

- 285: Cluster analysis in linguistic research



#### Everitt et al. (2011)

---

- not exclusive for linguistic
- Ch.1: introduction to classification and clustering
- 9: pitfall
  - the classification produced by a cluster analysis is an artefact of the method and that actually she is imposing a structure on her data rather than discovering something aobut the actual structure.

- 18: scatterplot
  - "overplotting" may hide the presence of other clusters




#### Kassambara (2017)

----

25-28:

- The classification of observations into groups requires some methods for computing the **distance** or the (dis)**similarity** between each pair of observations. The result of this computation is known as a dissimilarity or **distance matrix**.

- Classical methods: **Euclidean** and **Manhattan** distances

- **Correlation-based distances**: widely used for gene expression data analysis; defined by subtracting the correlation coefficient from 1; considers two objects to be similar if their features are highly correlated, even though the observed values may be far apart in terms of Euclidean distance.

  - **Pearson correlation distance**: measures the degree of a linear relationship between two profiles; most commonly used
  - **Eisen cosine correlation distace**
  - **Spearman correlation distance**
  - **Kendall correlation distance**

  

ab 35: **Partitioning clustering**

- Partitioning clustering: require to specify the number of clusters to be generated; goal of the algorithm is to split the data set into clusters of objects
  - **K-means clustering**: each cluster is represented by the center or means of the data points belonging to the cluster; sensitiv to anomalous data points and outliers.
  - **K-medoids clustering / PAM**: each cluster is represented by one of the objects in the cluster; less sensitive to outliers compared to k-means.
  - **CLARA algorithm (clustering large applications)**: an extension to PAM adapted for large data sets
- 45: **Principal Component Analysis (PCA)**
  - a dimensionality reduction algorithm to reduce the number of dimensions for visualizing the clusters



ab 48: **K-Medoids / PAM**

- each cluster is represented by one of the data point in the cluster, which is named **cluster medoids**.
- The term **medoid** refers to an object within a cluster for which average dissimilarity between it and all the other the members of the cluster is minimal; a representative example of the members of that cluster.
- **Silhouette method** is a useful approach to determine the optimal number of cluster (k).
- If your data contains outliers, **Manhattan distance** should give more robust results, whereas **euclidean** would be influenced by unusual values.
- ***factoextra*** package helps to create a beautiful graph of the clusters generated with the *pam* function. (P. 51-52); ***fviz_nbclust*** estimated the appropriate number of clusters; ***fviz_cluster*** visuslizes the results



ab 119: **Clustering tendency**

- Before applying any clustering method on your data, it’s important to evaluate whether the data sets contains meaningful clusters (i.e.: non-random structures) or not. If yes, then how many clusters are there.
- A big issue, in cluster analysis, is that clustering methods will return clusters even if the data does not contain any clusters.
- ***clustertend*** package for statistical assessment clustering tendency
- ***hopkins*** in ***culstertend*** package evaluates the clustering tendency statistically; If the value of Hopkins statistic is close to zero, then we can reject the null hypothesis and conclude that the data set D is significantly a clusterable data
- **VAT** algorithm evaluates the clustering tendency visually; first computing the dissimilarity matrix between observations using the function ***dist()***, then the function ***fviz_dist()*** to display



ab 128: **Determining the optional number of clusters**

- **Average silhoutte approach ** measures the quality of a clustering, i.e. it determines how well each object lies within it cluster
- other methods: **elbow**, **gap statistic method**
- functions to etermining the optimal number of clusters: ***fviz_nbclust()***, ***NbClust()*** in NbCluster R package



ab 138: **Cluster validation statistis**

- evaluating the goodness of clustering algorithm results
  - internal cluster validation
  - external cluster validation
  - relative cluster validation
- **silhouette width**:
  -  index for assessing the goodness of clustering
  -  the silhouette plot displays a measure of how close each point in one cluster is to points in the neighboring clusters.
  -  Interpretation of silhouette width:
     - almost 1: very well clustered
     - around 0: the observation lies between two clusters
     - negative: probably placed in the wrong cluster

ab 177: **DBSCAN** Density-based clustering (***try once for my data set?!***)

- identify clusters of any shape in a data set containing noise and outliers



#### Divjak & Fieller 2014 

------

- "Cluster analysis: finding structure in linguistic data" in Glynn & Robinson (eds.) 2014:405-442

- 405: exploratory technique

- 406: 

  - the term "cluster analysis" first used by Tryon 1939
  - clsuter analysis can be used to discover structures in data and it does this **without explaining why that structure exists**; not based on probability; put objects into cluster according to well-defined similarity rules; most used when we do not have any *a prior* hypotheses, but are in the **exploratory phase** of research 
    - (*may be the reason for two parts of analysis, automatic + manuel, in my Diss!*)
  - In contrast to other exploratory methods of this type such as Principal Component Analysis and MDS, cluster analysis reuqires the analyst to make choices, about dissimilarity measures, grouping algorithms, etc..

- 409-410:

  - The initial distinction [of variables] is between categorical/nominal, ordinal and numerical
  - more descriptions of categorical, ordinal and numerial variables

- 412:

  - sum 1's (same) and 0's (different) to get overall a similarity/dissimilarity score out of ten per **language-pair** -- get dissimilarity matrix
  - a distance between a pair of twons also reveals how close they are
  - if the measure of simialrity depends upon severable variables or properties it matters curcially what **relative weights** are given to the various properties.

- 417:

  - **Euclidean distance**: 
    - the ordinary geometric distance between two points; 
    - the sum of the square
  - **Mahalanobis distance**: 
    - a generalisation of the Euclidean distance
    - less weight is given to differences in values on varialbe with large variances, so the large differnces on these do not overwhelm the overall measure, and additionally to compensate for "duplication of information" when two variables are highly correlated
  - **Manhattan/City-block distance**:
    -  the sum of the absolute differences between the pairs of corresponding values for two individuals; 
    - always larger than Euclidean distance

- 419: 

  - **drawback of both distances**: it matters crucially what units are used for the individuals variables, e.g. the number of speakers is measured in millions or billions, which would lead to the changig of the relative orderings; the a "nearest neighbour" might appear to be a distant neighbour if the unis of one variable are changed. 

- 427: **k-means clustering**

  - divisive but non-hierarchical, within the optimization methods
  - specify the desired number of cluster, k say, and search for a division of the n objects into k groups which is "best" in some defined sense.
  - a common measure: requrie the average distance between objects in a cluster and their cluster centroid to be minimised in comparison to the average distance of cluster centroids from the centroid of all objects.
  - "centroid" usually indicates the mean value of the cluster, but could be some more general measure of the "center" of the cluster.
  - 

- 432:

  - **Silhoutte**
    - a graphical aid to the interpretation and validation of cluster analysis.
    - Each cluster is represented by a sp-called sihouette, which is based on the comparison of its tightness and separation. [...] shows which object le well within their cluster, and which oens are merely somewhere in between clusters. 
    - The silhouett value measures the degree of confidence in the clustering assignment of a particular observation, with well-clustered observations having values near 1 and poorly clustered observations having values near -1.
    - near 1: well-clustered; 
    - around 0: sample could be assigned to another cluster as well, and the sample lies equally far away from either position
    - close to -1: misclassified
    - **average silhoutte width**:
      - the largest overall average silhoutte indicates the best clustering
      - since the average silhouette width provides an evaluation of clustering validity, it might be used to select an "appropriate" number of clusters.

- 435:

  - Cluster Analysis does not provide information on the rlative importance of variables or underlying factors; it is up to the analysi to extract these from the data.

  

  

#### Glynn 2014

- "techniques and tools" in Glynn & Robinson (eds.) 2014:307-341
-  316: 
  - cluster analysis is an excellent technique for determining which forms are simialr to each other and which are different.








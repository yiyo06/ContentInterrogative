## MDS

#### Levshina 2015:Chapter 17

- making maps with R
- MDS
  - a method that represents distances between objects in a low-dimensional space.
  - Aim: to find a low-distances spaces that would represent [...] objects as points in the space, such that the distances between these points would match the original (dis)similarities between the objects as precisely as possible.
  - **metric MDS**: represent the objects in low-dimensional space, so that the original distances or dissimilarities between them are represented as precisely as possible by the distances between the points on the MDS map; classical MDS; **Principal Coordinates Analysis**
  - **non-metric MDS**: ranking of dissimilarities between the objects that matters, rather than their actual numerical values; to find a configuration of objects such that the rankings of the MDS distances between the objects correspond as closely as possible to the rank order of the original dissimilarities between the objects; should be used when the ordering is more important than the actual distances. 
  - **Stress**: The better the original distances or dissimilarities are represented in a dimensionality-reduction solution, the less information is lost; such loss of information is called "stress"; the amount of stress in a solution is the most important goodness-of-fit measure in MDS; The smaller the stress, the better the fit.
  - **cmdscale()**
  - When reporting the results of MDS, one should not forget to mention the quality of solution (stress), the type of distance metric and the method.
  - weakness: no straightforward way to interpret the location of the points with regard tot the input variables.



### What is MDS

----

#### **Everitt et al. 2011**

- 37: 
  - an attempt to represent the observed similarities or dissimilarities in the form of a geometrical model by embedding the stimuli of interest in some coordinate space so that a specified measure of distance between the point in the space represents the observed proximities.
  - a narrow definition: the search for a low-dimensional space in which points in the space represent the stimuli, one point representing each stimulus.
  - the larger the observed dissimilarity 



#### **Moisl 2015**

- 116:
  - MDS uses a different criterion, preservation of proximities among data objects, on the grounds that proximity is an indicator of the relative similarities of the real-world objects which the data represents, and therefore of informational content; if a low-dimensional representation of the proximities can be constructed, then the representation preserves the informational content of the original data. 



(Quelle: http://cda.psych.uiuc.edu/mds_509_2013/readings/Classnotes4_mds_and_related.pdf)

- P. 111:  MDS differs from the other interdependence techniques we have considered in two key aspects: 
  - Each respondent provides evaluations of all objects being considered, so that a solution can be obtained for each individual that is not possible in cluster analysis or factor analysis.
  - MDS does not use a variate.
- P. 105: the **decompositional** method, measures only the overall impression or evaluation of an object and then attempts to derive spatial positions in multidimensional space reflecting these perceptions. [...] Decompositional techniques are typically associated with MDS.



#### **Wälchli 2010**

- 333: "visualizing a distance matrix with MDS"
- 342 table 1:
  - **analytical primitives: coding means in utterances in aligned parallel corpora**
  - the distance matrix is computed by using Hamming distance as a distance measure
  - distance matrix: for any pair of situations the number of differences in languages is divided by the total number of languages where both values are attested
- 345:
  - MDS takes a matrix of pairwise dissimilarities and returns a set of points such that the distances between the points are approximately equal to the dissimilarities. 
  - If there are *n* items (analytic primitives), there is a maximum of *n*-1 dimensions (two dots can always be represented in one dimension, three dots can always be represented in two dimensions, etc.). 
  - The points are arranged such that the representation on the first dimension is as accurate as possible (as much information as possible is represented on the first dimension). Next, the second dimension covers as much as possible of the information left and so on.
- 347:
  - Dimension 2 represents not only a single a priori dimension, but a combination of two
  - If a priori dimensions are ―**orthogonal**— which means that there is no or little interaction between them—there is no way to combine them in one dimension. However, if two a priori dimensions can be combined in the same probabilistic ―"**scale**" or pseudo-scale, MDS analyses will tend to combine them
- 350:
  - the closer the dots in a language-particular category cluster, the more this category is recurrent cross-linguistically
- 357:
  - most other dimensions listed in ... do not emerge as dimensions or clusters on particular dimensions.
  - the semantic map built here is no good tool to appropriately represent the categorization systems in all languages.
  - However, it is a good tool to compare a large number of languages directly on the level of language use and to distinguish general recurrent trends from more specific language-paritcular categories.
- Section 4: **how different samples and different ways to count can affect a semantic map**
  - 358: **sampling** is a highly relevant issue for semantic maps
  - Every sample of languages or doculects reflects a certain amount of cross-linguistic diversity which can serve as a basis to construct a model that applies to all language data which falls into the range of the structural diversity represented in the data underlying that model.
- 364: **semantic maps**
  - if we build semantic maps on the basis of large world-wide samples of languages we get averaged semantic space where frequent semantic patterns clearly emerge, and rare semantic patterns are hardly distinguishable from noise

​	

### Interpretation of MDS

----

(Quelle: http://www.analytictech.com/borgatti/mds.htm)

- **Axes** are in themselves meaningless and is that the orientation of the picture is arbitrary.
- All that matters in an MDS map is which point is close to which others
- The **distances** among items are imperfect, distorted, representations of the relationships given by your data. The greater the stress, the greater the distortion. In general, however, you can rely on the larger distances as being accurate.
- There are two things to look for in interpreting an MDS picture: **clusters** and **dimensions**.
  - **Clusters** are groups of items that are closer to each other than to other items.
    - When really tight, highly separated clusters occur in perceptual data, it may suggest that each cluster is a **domain** or subdomain which should be analyzed individually. It is especially important to realize that any relationships observed within such a cluster, such as item *a* being slightly closer to item *b* than to *c* should not be trusted because the exact placement of items within a tight cluster has little effect on overall stress and so may be quite arbitrary.
    - Consequently, it makes sense to extract the **submatrix** corresponding to a given cluster and re-run the MDS on the submatrix.
  - **Dimensions** are item attributes that seem to order the items in the map along a continuum.
    - The underlying dimensions are thought to "explain" the **perceived similarity** between items.
    - Thus, the implicit model of how similarity judgments are produced by the brain is that items have attributes (such as size, viciousness, intelligence, furriness, etc) in varying degrees, and the similarity between items is a function of their similarity in scores across all attributes. This function is often conceived of as a **weighted sum of the similarity across each attribute**, where the weights reflect the importance or saliency of the attribute.



### Use of MDS

------

#### **Wälchli 2018**

- 154-6: steps
  - database consistes of ~ cells. Empty ones are not attested or not qualified
  - from this datatable, a distance matrix cross-table of all passages is calculated using Hamming distance as a maximally simple distance measure
  - The values range from 0.0 to 1.0. The value 0.0 means that all doculects use the same item for that pair of passages. 1.0. means that all doculects use differenct item for that passage.
  - The distance matrix is then used as input for MDS
  - With 133 entities, the multi-dimensional space that is built contains a maximum of 132 dimensions (n-1). 
  - MDS arranges the entites in such a way that the dimensions with the lowest numbes cover as much information as possible.
- 156: MDS is useful for visualizatio because it arranges semantially simialr units close to each other. The closer two dots are, the more likely that the corresponding passages are encoded by the same marker in any language of the sample (this is why this is called a probabilistic semantic map).



#### **Wälchli&Cysouw 2012**

- 682: 

  - The basic idea of MDS is that a large set of dissimilarities is organized into a spatial approximation.
  - The MDS analysis does not tell us what the **descriptive meaning** of a group of situation is. However, it tells us that wherever there is a cluster it is likely to have some **descriptive correlate**.
  - the lower dimensions contain more information

- 683:

  - The method is baded on the assumption that descriptive semantic meanings are represented by clsuters in the MDS analysis and the result confirms this assumption to a high degree since a large portion of clusters can be interpreted descriptively.

  - Mismatches can be of two kinds:

    - artifact of the method: cluster appear impossible to be interpreted descriptively, espcially in higher dimensions
    - categories do not correspond to clusters at any dimension if the descriptive meaning of the category does not follow a general recurrent trend in the data considered
    - the method thus tell apart **common category types** from **rare catogories**

  - any model obtained in this way will never reprsent the complete linguistic variation

  - the relationship between different stages in the processing chain from data to visualization is never one-to-one

    - language material considered

    - analytical primitvies used as the objects of the map

      - always a selected sample of functions or situations

    - method to compute the distances between the objects

    - choice of the visualization tool

      

#### de Swart&Tellings&Wälchli 2022

- temporal construction 'not...unitl' in European Languages

- small caps for cross-linguistic types, italics for language-instantiations of a particular category

- two MDS-relevant papers: **van der Klis&Tellings 2022**, **van der Klis et al. 2017**

  - **van der Klis&Tellings 2022**: comprehensive technical backgroud of MDS
  - **van der Klis et al. 2017**: dub **Translation Mining** based on Wälchli&Cysouw 2012

- **von Fintel&Matthewson 2008**: semantic/compositional meaning

- P. 6: *see document **Parallel text***

  - advantages of a parallel corpus and translation bias; 
  - onomasiological vs. semasiological step

- P. 7: ***simialr working flow of my thesis***

  - The term **datapoint** refers to the selected context

- P. 8:

  - **MDS** is a statistical technique that reduces a complex dataset with variation in many dimensions to a lower-dimensional representation that can be displayed visually as a scatterplot, known as a ***semantic map***.

  - the dots represent individual sentences (contexts) from the corpus

  - The algorithm places the dots based on a measure of similarity between contexts

  - **!** ***the way to describe the measurement of the similarity between contexts (within a language)***

    > This similarity measure is based on the annotation of the data: for example, when considering the annotation label ‘connective’, we can count two contexts as more similar when more languages use the same connective in both contexts

    - see also **Cysouw 2008** **"pairweise similarities**"

  - On the basis of this table, a ***dissimilarity matrix*** consisting of all pairs of contexts can be calculated with Hamming distance as distance measure
  -  The dissimilarity matrix determines the **spatial configuration of the points** in the map

- 21: **cluster analysis**

  

#### van der Klis&Tellings 2022

- an exhaustive introduction of MDS
- a dimensionality reduction technique, which facilitates the graphical representation of a highly complex dataset as a 2D or 3D scatter plot.
- **MDS map** is a visualization obtained through MDS
- using MDS as a method to chart cross-linguistic variation in **semantic maps**:  
  - Cysouw 2001; Levinson et al. 2003 and especially Croft and Poole 2008 for early work
  - **semantic maps** visually represent interrelationships between meanings expressed in languages; The distribution of language-specific items can then be mapped upon the semantic map
    - Anderson (1982)
    - Haspelmath (1997): semantic maps were formalized as **graphs**: **nodes** display functions (or meanings) in the linguistic domain under investigation, while **edges** convey that at least one lan- guage has a single form to express the functions of the nodes the edge connects
    - **classical maps**: Haspelmath (1997)
    - **proximity maps / MDS maps**: aim to advance the semantic map method by generating maps directly from linguistic data (see **van der Auwera 2013**)
    - comprehensive terms see **Georgakopoulos 2019**
  - employ MDS to map data from **parallel corpora**, intending to investigate a certain linguistic phenomenon from a cross-linguistic perspective **without prescribing functional categories**
- 4: 
  - MDS actually stands for a family of methods and procedures consisting of numerous variants
  - here **classic scaling / classic MDS / classic metric Torgerson scaling**
- 5-10: **mathematical background of MDS**
  - the main component of MDS is a process called **eigendecomposition**
  - What is specific about MDS is that it uses as **input** for eigendecomposition **a set of similarity or dissimilarity data** between objects.
  - MDS is based on **matrix algebra**
  - terms: **eigenvector, eigenvalue** (linear algebra; about direction & length in coordinate; help reduce a complex dataset to one of lower dimensionality)
  - **Stress** measures the difference between the MDS output and the original dissimilarity data; As larger stress values indicate a worse fit, stress is a badness-of-fit measure
  - the number of dimensions in the final MDS output is chosed by the researcher
  - **Stress** can be used to help determine the optimal dimensionalith of the MDS output.
  - **elbow method**: generate MDS outputs of increasing dimensionality 2, 3, ..., n, and calculate the stress value corresponding to each one; comparing the decreasing stress value to determine the 'optimal' dimensionality
  - **stress** can be used to detect potential **outliers** in the dataset by focusing on the deviation of individual points
  - summary: 
    - MDS stands for a set of statiscal tools that use matrix algebra to reduce a complex multidimensional dataset to a representation of lower dimensionality
    - the **input data** for an MDS analysis consist of a matrix of (dis)similarity values between linguistic objects
- 11-16: input-output-mds map
  - This type of MDS map is often **based on questionnaire data**: **sentence contexts** that have been selected or designed by the researcher to investigate a particular domain 
  - the input data for these maps consist of specifications (Yes/No) for forms in various languages about **whether or not that form can convey an abstract function**. 
  - **Two functions count as more similar when a higher number of forms express both functions**.
  - Measure of similarity between two functions: by the number of forms that co-express them
  - The dots on the MDS map may be connected to **add** **the graph structure** of the classical map (although this structure is not a result of the MDS algorithm)
  - **multilingual map** vs. **monolingual map**
  - monolingual map can be created by adding **cutting lines** to the map that indicate how language-specific forms realize the functions on the map
  - in outcome: **translational equivalents** are visible in the MDS map as a whole, and **designations of a particular meaning** intra-linguistically appear in language-specific maps
  - Language- specific constructions can be indicated by changing the appearance of the dots on the map (e.g. by using colors or symbols), a process we will refer to as **map coloring**.
- 17-19: maps of **parallel corpus data**
  - besides questionnaire data, **a parallel corpus ** is a second source of input dat for MDS
  - Wälchli&Cysouw (2012:674): **primary data typology**, contrasting it with analyses based on higher-level sources as reference grammars. 
  - **Merits**: 
    - no dependency on existing comparative concepts
    - using corpus data also allows to include frequency as a factor
  - **Shortcomings**:
    - a parallel corpus can be a limited source of data in that it may only provide a genre-specific perspective, 
    - might lack specific forms, 
    - and overuse prototypical forms
  - a context corresponds with a sequence of translations
  - typically, the **relative hamming distance** is used as a distance function
  - a context is represented as a sequence of translations, and the distance between two sequences of *n* objects is defined as the number of objects that differ (**compared pointwise**) divided by *n*. For example, the distance between 〈A,B,C,D,E〉 and 〈A,B,X,D,Z〉 is 2/5 because two of the five positions differ (the 3rd and the 5th)
  - **recent studies with MDS applies to parallel corpus data**:
    - Wälchli 2018
    - Verkerk 2014: dots represent languages but not contexts
    - Dahl&Wälchli 2016: dots represent grams; MDS space as 'grammatical space'; similarity determined based on how similar the distribution between two grams are across the text
    - Beekhuizen et al. 2017
    - de Swart et al. 2012: a special variant of map coloring "**semantic overlays**"
    - Levshina 2015, 2016, 2022
- 19-21: **Translation mining**
  - van der Klis et al. (2017) based on methodology from Wälchli&Cysouw (2012)
  - Instead of comparing translations by the lexical items that were chosen, they compare **translations based on a grammatical feature**, namely the tense form used
  - *w1* and *w2* count as equivalent if they use the same tense form, but they need not be the same lexical item
  - extracted data need to be annotated for the grammatical feature
  - contour lines
- 21: **two ways to analyze MDS maps**
  - dimension Interpretation: assign a linguistic interpretation to the dimensions of the map
  - cluster interpretation: consider groups of points that cluster together on the map
  - dimension and cluster interpretation are not completely independent, as typically, when two clusters are separated on a map, they are also on opposing poles of one of the dimensions in the map
- 21-23: **dimension interpretation**
  - the resulting dimensions in MDS maps do not necessarily reflect semantic distinctions; but are the outcome of the algorithm.
  - Wälchli&Cysouw (2012) finds at least 30 dimensions are relevant to describe the data; instead of assigning a single interpretative label to each dimension, they separately interpret the negative and positive 'pole' of a dimension.
    - Labels are displayed in **regions** of the map
    - p. 690: distinction between 'cluster/category' and '**region**': 'regions' of the semantic map purport to be the same for all doculects; so that all kinds of categories in a region can be plotted, since there is no a pair of doculect where a category has exactly the same extension  
  - issue of **horseshoe patterns**
    - no cutting lines in any language includes two ends of a horseshoe
    - one should interpret the functions as displaying only one dimension of variation, and not try to interpret the contribution of the x- and y-axis individually
  - Levshina (2022) uses linear regression to interpret dimensions
- 23-26: **cluster interpretation and cluster analysis (in combination with MDS)**
  - the proximity of the points indicates that the corresponding contexts are similar in a linguistically relevant way, and contrast with points outside the cluster.
  - classic: cluster identification (on MDS map) and interpretation after MDS
  - 24: ***my procedure!***
    - identify cluster directly from the original dataset, and run MDS **parallel** to it
    - directi identification of clusters from the distance matrix (or a transformation thereof) is known as **cluster analysis**
    - the resulting attribution of clusters to individuals points can then be fed back to the MDS map as an additional layer of labelling.
    - this procedure potentially facilitates the interpretation of the semantic dimensions at stake.
  - K-means clustering: example of Wälchli (2018)
  - Hierarchical cluste analysis:
    - bottom-up: each observation starts in its own cluster, and pairs of clusters are iteratively merged whiled minimizing distance; result usually a dendrogram
- 26-31: **MDS and linguistic theory**
  - the methodology of using parallel corpus data with an MDS analysis is **theory-neutral**
    - the MDS methodology does not commit the researcher to one particular theoretical framework, and has indeed been used with a variety of theoretical frameworks
    - both formal linguistics and classic typology; two need not be incompatible or conflicting, but are in fact rather closely related when it comes to the study of corss-linguistic variation
    -  MDS maps can be seen as an **explanandum**, i.e. they are visualizations of data that are not the end product, but the **starting point of further linguistic analysis**

  - parallel corpus data and an MDS analysis used to build a **formal analysis** of a linguistic phenomenon
    - advantage of the methodology of parallel corpus data + MDS: allows to recognize patterns in a large set of corpus data, which cannot be found by hand; the subsequent analysis will have a more comprehensive empirical coverage
    - Starting in Wälchli (2010, §2) and Wälchli and Cysouw (2012, §3), and later adopted in other MDS studies (e.g. de Swart et al. 2012, p. 167), a combination of **exemplar semantics** and **similarity semantic**s has been proposed
    - This means that **exemplars (individual occurrences) are compared** instead of abstract concepts, and that **similarity is a more basic notion** than identity. The two are linked by Haiman’s isomorphism hypothesis 
    - This theoretical basis underlies MDS maps in which points represent individual contexts

- 31-35: future directions
  - lexical-compositional step:
    - most MDS works: applied to word-size or phrase-size units, and comparison based on one parameter
    - now multiple parameters, e.g., 'not-until' construction
    - can be done either by a distance function that is a weighted average of distance measures for the various parameters, or by *multi-mode / multi-way* MDS

  - alternatives to MDS
    - **Dimensionality reduction methods** are usually subdivided into those that attempt to **retain global structure of the data, like MDS**, and those that instead try to **retain local structure**, like local linear embedding; some methods aim to operate at both the global and the local level (t-distributed stochastic neighbor embedding)
    - Figure 11 & 12 helps to understand!
    - **global-first** (full spectral): Euclidean distance; in Figure 12: MDS fails to identify the underlying two-dimensional structure of the Swiss Roll manifold
    - **local-first** (soarse spectral): geodesic distance; use the shortest path in terms of nearby points; in Figure 2: LLE has a drawback to tendentially crowd points at the centre of the map, which prevents gaps from forming between potential clusters
    - **t-SNE** in Figure keeps most of the local structure of the data intact; but also has erroneously extracted two clusters
    - **MDS** can capture the main sources of cross-linguistic variation by assigning a linguistic interpretation to the resulting dimensions (see Section 4.1), while **LLE** and **t-SNE** are more suitable to identify clusters (see Section 4.2).
    - **Asgari&Schütze 2017**: apply t-SNE to parallel bible corpus to cross-linguistic variation in tense markers
    - **Georgakopoulos et al. 2021**: apply UMAP






#### Levshina 2022



#### Croft&Poole 2008b 

- (short, 'Multidimensional scaling and other techniques for uncovering universals')



#### Cysouw 2008



#### Cysouw 2007:12-17 ("Building semantic maps")

- the idea behind an MDS is that two objects that are similar are placed close to each other, and objects that are less similar are placed further away from each other
- a **Euclidean space**, in which the distances between the primitives are indicative of their difference
- The dimensions of an MDS display are nameless, and only indicate some general mathematical notion of similarity
- an MDS represents **a strong reduction of the available information** -- therefore better not consider MDS as an improvement over the traditional sematnic map
  - footnote 14 in P. 22: "**stress**" refers to the meaure for the amount of data-reduction of an MDS; the lower the stress, the better the display reflects the underlying distances
- 13: **explanation of multi-dimensionality of dataset**
  - When there are only three objects, with distances measured for every pair, then **it is always possible to place these three objects on a two-dimensional plane in such a way that the pairwise distance between the points on the plane is exactly proportional to the measured distance** (viz. **three distances determine a triangle**). However, with four objects this is not always possible. In most cases, a third dimension is needed to display the distances to the fourth object exactly. In principle, **an extra dimension is needed for every object to be added**.
  - **strong reduction of the available information of MDS**
    - the mathematical procedure MDS tries to show as much as possible of the actual distances in only two dimensons. To do so, some of the distances have to be changed a bit. The MDS searches for the minal amount of changes needed to display all objects in two dimensions. In a sense, this is comparable to removing some of the thinner lines (from Figure 3 a semantic map)
    - the selectio of only two dimensions for an MDS is necessarily a reduction of the actual variation, focussing on the oppositions with the highest frequency



#### Georgakopoulos 2019



#### Georgakopoulos&Polis 2019



#### Georgakopoulos et al. 2021



#### van der Auwera 2013 : semantic maps

- in Ramat et al. (eds) (2013:153-176); (in bib)
- defend the usefulness of classical semantic map; mention MDS maps
- **classical semantic maps** 
  - 153: embody strong hypotheses about polysemy (synchronic)
  - 154: may allow a diachronic interpretation, symbolized by turning lines into diachronic arrows [...] embody a strong hypothesis about semantic change
- sematic maps are essentially representations of the polyfunctionality of words or, more generally, constructions
- **Two types of semantic maps**:
  - 154-155: types 1
    - terms for this kind of maps: '**connectivity**'(Narrog 2009:233), '**classical**' (van der Auwera 2008), '**traditional**' (Malchukov 2009), '**first-generation**' (Sansò 2009), '**implicational**' (Wälchli 2009)
    - Anderson (1982), Haspelmath (1997), van der Auwer &Plungian (1998), discussed in Haspelmath (2003), van der Auwera&Temürcü(2006)
    - see Figure 1 in 154
    - the cells stand for (semantic) **meanings** or (pragmatical) **uses**
    - the curcial feature of the map is that of **linking** [...] which for defining a crucial property of semantic maps, called **'adjacency'**(van der Auwer &Plungian 1998), '**semantic connectivity**' (Croft 2001:96), **'contiguity'** (Haspelmath 2003:216)
    - if a construction has more than one use, they will have to be adjacent/contiguous/connected.
  - 155: type 2
    - terms: '**proximity**' (Narrog 2009:233), '**second-generation**' (Sansò 2009), '**statistical**/**probablistic**' (Wälchli 2009), '**similarity**' (Malchukov 2009:176)
    - Levinson&Meira (2003), Croft&Poole (2008)
    - the cells are **contexts**
    - what matters is not the lines, which symbolize the connection, but only the **proximity of te contexts** 
  - 156: debate about the relative advantages of both approaches
    - Cysouw (2001); *Theoretical Linguistics 34.1*(e.g. Croft&Poole 2008, Cysouw 2008, van der Auwera 2008, etc.) , *Linguistic Discovery 8.1*



***(a summary for development of semantic maps given by Georgakopoulos&Polis 2018 call-for-paper)***



#### van der Klis et al. 2017

- **Translation Mining**



#### Croft&Poole 2008a




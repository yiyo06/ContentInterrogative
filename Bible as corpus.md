The corpus used for this cross-linguistic study names "Paralleltext" built by ...



- https://github.com/cysouw/paralleltext/tree/master/bibles

  > **structure**: Each line contains two elements which are separated by a TAB. The first element is the verse ID and the second element contains the actual text. The verse ID contains information about the book, chapter and verse number.
  >
  > Some lines contain only a verse ID and a TAB, but no actual text. In these cases, the translation of the respective verse ID is combined into the last preceding full text line above the **empty text line** [...] not easy to separate the content.
  >
  > [To assure parallelism] the verse numbering here is not always in accordance to the tradition of a specific bible translation

- https://github.com/cysouw/paralleltext

  > The file names used are defining each text as a **doculect** (Cysouw&Good 2013)
  >
  > The first tag is the closest available [ISO 639-3 code](http://www.sil.org/iso639-3). Note that this is often a rather rough approximation of the language used in the specific file!
  >
  > The core data always consist of two columns, separated by a tab.
  >
  > - The first column is an identifier of the parallelism.
  > - The second column contains the actual data.

- **Abney&Bird 2010** universal corpus; mentioned by following texts

  

- **Mayer&Cysouw 2014** Introduction about the Bible corpus

  3158-3159:

> 994 translations in 837 languages varieties, 41964 different verse numbers, the average numeber of verses per translation is 10707 (*need updated info!*)
>
> All Bible translations in this corpus are pre-processed and organized in a well-defined format -- consistent form for comparison!
>
> **Advantages of this corpus:**
>
> - all translations are tokenized -- separating punctuation marks, and Unicode normalized.
> - The parallel structure of the texts is guaranteed
>
> **Advantages of Bible:**
>
> - Bible texts are translated into many languages over such a long period of time
> - almost 7% of the 7,105 known living languages for which Ethnologue contains information have a complete Bible translation, 36% have at least portions of the Bible translated 

3159: **Format of Files in corpus**

> file name: ISO-x-bible-Translation-Version.txt
>
> The Translation tag can either represent a dialectal difference for a language or a specific translation
>
> extracted bare base texts of the Bible from the websites without any headings, footnotes or cross-references, retaining capitalization as found in the original.
>
> All characters are separated with white space.
>
> All tokenization for all texts are manually corrected



- **Dahl&Wälchli 2016:329-330**

>  It should be kept in mind, however, that the choice of languages depends on the availability of Bible translations, leading to a rather **patchy coverage of the languages** of the world
>
>  the **quality and faithfulness of the translations**, as well as the approach of the translators, are crucial
>
> In addition, we usually do not know **how well a translation represents** the language of the community for which it was made
>
> The use of parallel corpora relies on the possibility of **aligning** the texts. One advantage of Bible texts is that they are usually organized in chapters and verses in a strongly uniform fashion. Using **verse-level alignments** in comparing the distribution of elements in the corpus texts means that “having the same distribution” will be interpreted as “occurring in the same verses”. 
>
> When dealing with **high frequency grams** which can be expected to occur at several different places in the same verse, this will often yield a **low precision** (many false positives) of the linking but a **good recall** (few cases missed).



- **Dahl 2007:3-4** "features of Bibel as a basis for parallel corpora"

  **Strengths**:

  - over the globe
  - readily available
  - heterogeneous texts of different genres, including straightforward narratives and argumentative passages
  - Even if the Bible (like virtually all parallel corpora) represents written language, there is a considerable amount of natural-sounding direct speech in it
  -  well prepared in form (e.g. alignment)
  - some versions of the original text (Greek) are completely lexical and morphological markup in the case of the New Testament

  **Drawbacks**:

  - translational and original (Vries 2007)
  - different versions of the original texts (Vries 2007)
  - a trade-off between “alignability” and empirical relevance: literal translation vs. translations in a natural way

  

- **Christodouloupoulos&Steedman 2015** another bible corpus with 100 translations; advantage and issues of bibles

  376: 

  - existing **parallel** corpora; 

  - note the difference between:
    -  corpora with multiple languages 
    - parallel corpora but existing in a small number of languages or in common languages pairs
    - non-parallel but comparable corpora
    - parallel and comparable corpora in multiple languages.

  **Disadvantage/Potential issues of Bible:**

  377: the lack of modern named entities

  378-379: 

  - translation methods; **Nida&Taber 1969:182** -- principles for Bible translation
    - more content-sensitive approach -- not word-for-word, but sense-for-sense
    - less formally equivalent translations
  - writing style; the use of antiquated language
  - the alignment information is limited to verses -- different punctuation schemas indicate different numbers of sentences

  384:

  - not all the canonical verses are present even in the official translations -- the missing verses are maybe contained in the verses that come before or after them, or completely omitted.

  **Advantages:**

  377: 

  - translated into a much more diverse set of languages than any other book
  - the size of the text
  - uniquely identified by a book, chapter and verse number
  - free

  

- **Kanungo et al. 2005**

  126: **Disadvantages of Bible**

  - archaic syntax, atypical vocabulary, religion-specific subject matter
  - 127: missing modern-day elements

  126-127: **Advantages of Bible** 

  - relevant for research involving present-day language, e.g. cross-linguistic information retrieval and machine translation for low-density languages

  - > the underlying content is the same, one can expect similar patterns of vocabulary content in a modern language version of the Bible, regardless of the language in which that content is expressed.

  - > This **parallelism of content at a global level** is matched by parallelism at a much finer grain. Indeed, Bible translations are done with great care to preserve **nuances of meaning and they generally maintain verse-level parallelism**

  - over 383 languages with complete Bible, 987 with New Testament, 2261 at least on book 

  

- **Resnik&Olsen&Diab 1999**: Annotation bible to create a corpus; 'to what extent is the bible text relevant for research on present day language?'; **Validity of Bibel texts for present-day language comparison**

  use 13 translation of the Bible

  129:

  > The Bible is a widely available, representative sample of carefully translated texts in a variety of styles in a broad range of languages.

  134:

  > translations in established languages tend to be conservation.
  >
  > texts are as accurate as humanly possible

  147:

  Two comparisons: Bible with dictionary (modern/present-day language) and Brown Corpus (frequently used words); 

  coverage figure of modern English is 85%;

  "clock", names of measurements and units of time are as modern concepts missing in Bible

  148: result of comparison with dictionary 

  > [In comparison with the dictionary] the corpus contains at least one instance of use for some 80% of the most “useful” words in modern English. This coverage, combined with verse-level parallelism across languages, suggests that the corpus can in fact be a useful resource for investigating cross-linguistic lexical relationships in present day languages.

  148: result of comparison with Brown Corpus

  > The coverage figures of frequent words (types) *see paper!*
  >
  > noteworthy given that the Brown Corpus was created to span many genres
  >
  > the vocabulary of the Bible is least comprehensive for categories that focus on science, technology, and current events, and **most comprehensive for categories that are more aligned to universal concerns of everyday life**
  >
  > coverage reaches about two thirds of the most frequent 2000 words even for the least well covered of the categories
  >
  > BUT! **pitfall** of both comparisons is that coverage of lemmata represents only one level of analysis, and other relevant considerations such as phrasal units and word senses have yet to be explored.

  

- **Vries 2007** Special nature of Bibles

  1:

  > The special nature of translated Bibles is caused by **textual multiplicity, canonical multiplicity and multiplicity of translational types** [which] reflect one underlying cause, the specific skopos of Bibles: the **religious functions** of translated Bibles for a wide range of different Jewish and Christian communities.

  > The nature of translating as an activity that always involves problems of **selectivity** (decision of the translators) and **underdetermination** (multiple translation are legitimated; impossible to cover all possible interpretations)

  2:

  > skopos: "purpose"
  >
  > translational skopos: the intended or demanded function of the target text

  4-6: **for disadvantages of Bibles**

  > no "the source text" of the Bible that forms the basis for all translation
  >
  > **text multiplicity**: status of bible translations as parallel text is more complicated than translations of Harry Potter, where there is one undisputed English base text.

  6: 

  > **canonical multiplicity**: degrees of canonicity (canonical, deutero-canonical, apocryphal) and various communities have both narrower and wider canons.

  7: 

  > **multiplicity of translational types**: The religious function of the Bible has important hermeneutic and translational implications that sets Bible translations apart
  >
  > literal and foreignising vs. communicative translation
  >
  > Because of these various religious functions Bible translations can be extremely free or extremely literal, in some cases down to the level of morphemes or function words.
  >
  > Many Bible translation for minority languages [...] have a missionary skopos -- leads to translation of the explicative type

  10: complication of Bible translations

  > - Bible translations are based on different source texts
  > - Different Bibles have different sets of books in them
  > - the wide variety of translational types based on the various religious functions of the Bible

  Summary from Cysouw&Wälchli 2007:4

  > textual multiplicity of Bible
  >
  > one cannot automatically assume that different Bible translations are directly equivalent.

  

- **Gasset 2000** Problem about translation (not read yet!)



- **Hundt 2020:507** characteristic of corpus-based approach -- summaries Biber 1998

  > - –  it is empirical, analysing the actual patterns of use in natural texts;
  > - –  it utilizes a large and principled collection of natural texts, known as a “corpus,” as the basis for analysis;
  > - –  it makes extensive use of computers for analysis, using both automatic and interactive techniques;
  > - –  it depends on both quantitative and qualitative analytical techniques.

  > a corpus needs to be of a specific size (“large”) as well as a “principled” collection of naturally used language.

  

- **Biber et al. 1998:4** (**in Bib or https://books.google.de/books?id=vMfLCgAAQBAJ&printsec=frontcover&hl=zh-CN#v=onepage&q&f=false**) 

  - essential characteristics of corpus-based analyses

    > - empirical, analyzing the actual patterns of use in natural texts;
    >- utilizes a large and principled collection of natural texts, known as a "corpus", as the basis for analysis
    > - makes extensive use of computers for analysis, using both automatic and interactive techniques;
    > - depends on both quantitative and qualitative analytical techniques.
    
    

- **Kennedy 1998:13-14** (in bib or https://books.google.de/books?id=RV-PBAAAQBAJ&printsec=frontcover&hl=zh-CN#v=onepage&q&f=true)

  - bible concordance from Alexander Cruden includes not only for [...] the major content words in the Bible but also some function words [...] and certain collocations such as *how long*
  - After Cruden's work was first published, the works of established authors such as Shakespeare were similarly concordances and indexed for various scholarly purposes.
  - **1998:3-4**: corpus is defined as a principled and structured collection of (natural) texts.

  

- **Hundt 2008 in Lüdeling 2008:168** Text corpora 

  - medial aspect: texts can be transmitted in the written or spoken medium
  - conceptual aspect: (a degree of) orality and literacy
  - both aspects overlap
  - according to the definition of corpus as "principled or structured collection of text" given by Kennedy (1998:4), corpus has to be distinguished from a more arbitrary collection of material or 'text database'.

  

- **Meyer 2008 in Lüdeling 2008:1** Biblical concordances as pre-electronic corpora

  - Alexander Cruden created a concordance of the King James Version of the Bible in the 18th century 
  - other concordances before Cruden's in other languages

  

- **in Lüdeling 2008:432**: existing multilingual corpora (**not read yet!**)

- **Biber 2008 in Lüdeling 2008:822** MDS (**not read yet!**)

- **Biber&Jones 2008 in Lüdeling 2008:1287** quantitative methods in corpus (**not read yet!**)



- **Leech 1992**: key features of corpus computational corpus (methodological aspect?)

  > 1. (1)  Focus on linguistic performance, rather than competence
  >
  > 2. (2)  Focus on linguistic description, rather than linguistic universale
  >
  > 3. (3)  Focus on quantitative, as well as qualitative models of language
  >
  > 4. (4)  Focus on a more empiricist, rather than rationalist view of scientific
  >
  >    inquiry.

  

- **Nida&Taber 1982:14,182**: principle for Bible translation (sense-for-sense approach)
  - cross-reference with **Christodouloupoulos&Steedman 2015:378**
  - Content is to have priority over style.
  - Contextual consistency is to have priority over verbal consistency.

  

- **Heider et al. 2011**: bibles for grammar sketches

  - **ambient linguistic data**: the Bible translations
  - **structured linguistic data**: grammatical descriptions

  



The steps to find QW in a new language will be illustrated below. 
===========

#### Needed basic files: `525Single.txt`, `102Multiple.txt`, `627Verse.txt`


1. Read grammar of a well-known language and manually find out QW for 743 verses -- create a file `check-NAME-VERSION.txt`.

2. Use command `FindLanguageFamilyInCorpus` to sort out all languages from the same family from the corpus with bash:

```
scipts mac$ selectFiles FAMILY INDIR OUTDIR
```

  Notice: There are two `scripts` directories in the `Paralleltext`, one is `Paralleltext/scripts`, the other is `Paralleltext/bible/scripts`. The first one is used for this step, since the needed file `ISO639-3.tsv` locates in the same directory.

3. Creat a new directory under `data`, write down the basic information in the file `FAMILY summary.md`.

4. Depending on the script, available literature, subfamily etc., choose some languages to conduct `fast-alignment` -- creat the directory `InFAMILY/texts` and `OutFAMILY/table`.

5. Sort out the data from `table` belonging to the 627 Verses (not considering abcd) with bash:

````
cat 627Verse.txt | xargs -I % cp table/%.csv NewDirectory
````

6. Use R loops to find out the QW according to the manually operated language `check-NAME-VERSION.txt` (see 1.). Notice: During these procedures, the `check-Name-Version.txt` must be temporarily renamed same as the original file in the corpus `NAME-x-bible-VERSION.txt`, otherwise the loops would not work -- create `QWFAMILY` directory.

7. Create inventar for every text which will be checked with bash:

```
QWFAMILY mac$ grep NAME * >>../invNAME.txt

QWFAMILY mac$ cut -f2 ../invNAME.txt | tr [:upper:] [:lower:] | sort | uniq -c | sort -nr >../invtotalNAME.txt
````

  Notice: `invNAME.txt` is important for the next step!

  Create the directory `invFAMILY`.

8. Combined the automatically result from `invNAME.txt` and the origninal text, conduct the manual check:

![](https://user-images.githubusercontent.com/33869669/80273663-90dfdb80-86d4-11ea-8e21-80406a21b1d2.JPG)

 Notice: first 525 verses with a single QW, then 102 verses with multiple QW.
 
 Get a table with three columns (Number + QW + Text) `check-NAME-VERSION.txt`
 
 9. During the manual check for each language, files `NAME summary.md` and `NAMENotSureVerse.md` are generated in Github.
 
 10. Create `WordForm.txt` with QW from all texts with R command `makeTable.R`.

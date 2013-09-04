---
layout: post
title: My first first author paper is out! plus Errata
tags:
- biology
- miRNA
- research
- science
status: publish
type: post
published: true
meta:
  _searchme: '1'
  ratings_users: '0'
  ratings_score: '0'
  ratings_average: '0'
  views: '344'
  tagazine-media: a:7:{s:7:"primary";s:0:"";s:6:"images";a:1:{s:72:"http://www.researchblogging.org/public/citation_icons/rb2_large_gray.png";a:6:{s:8:"file_url";s:72:"http://www.researchblogging.org/public/citation_icons/rb2_large_gray.png";s:5:"width";s:2:"70";s:6:"height";s:2:"85";s:4:"type";s:5:"image";s:4:"area";s:4:"5950";s:9:"file_path";s:0:"";}}s:6:"videos";a:0:{}s:11:"image_count";s:1:"1";s:6:"author";s:7:"4875032";s:7:"blog_id";s:8:"14888982";s:9:"mod_stamp";s:19:"2010-04-20
    20:02:52";}
---
<span style="float:left;padding:5px;">
![](http://www.researchblogging.org/public/citation_icons/rb2_large_gray.png)
</span>

<span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.jtitle=Plant+Cell&amp;rft_id=info%3A%2F10.1105%2Ftpc.110.073882&amp;rfr_id=info%3Asid%2Fresearchblogging.org&amp;rft.atitle=Arabidopsis+lyrata+Small+RNAs%3A+Transient+MIRNA+and+Small+Interfering+RNA+Loci+within+the+Arabidopsis+Genu&amp;rft.issn=&amp;rft.date=2010&amp;rft.volume=&amp;rft.issue=&amp;rft.spage=&amp;rft.epage=&amp;rft.artnum=http%3A%2F%2Fwww.plantcell.org%2Fcgi%2Fcontent%2Fshort%2Ftpc.110.073882%3Fkeytype%3Dref%26ijkey%3DChuzaZwudrANgEF&amp;rft.au=Zhaorong+Mab%2C+Ceyda+Coruh+and+Michael+J.+Axtell&amp;rfe_dat=bpr3.included=1;bpr3.tags=Biology%2CBioinformatics">Zhaorong Ma, Ceyda Coruh and Michael J. Axtell (2010). <em>Arabidopsis lyrata</em> Small RNAs: Transient <em>MIRNA</em> and Small Interfering RNA Loci within the <em>Arabidopsis</em> Genus <span style="font-style:italic;">Plant Cell</span> : <a rev="review" href="http://www.plantcell.org/cgi/content/short/tpc.110.073882?keytype=ref&amp;ijkey=ChuzaZwudrANgEF">10.1105/tpc.110.073882</a></span>

Here is an InBrief article about this paper and another paper by Fahlgren <em>et al.</em>

<span class="Z3988" title="ctx_ver=Z39.88-2004&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.jtitle=Plant+Cell&amp;rft_id=info%3A%2F10.1105%2Ftpc.110.220411&amp;rfr_id=info%3Asid%2Fresearchblogging.org&amp;rft.atitle=MicroRNA+Evolution+in+the+Genus+Arabidopsis&amp;rft.issn=&amp;rft.date=2010&amp;rft.volume=&amp;rft.issue=&amp;rft.spage=&amp;rft.epage=&amp;rft.artnum=&amp;rft.au=Nancy+R.+Hofmann&amp;rfe_dat=bpr3.included=1;bpr3.tags=Biology%2CBioinformatics">Nancy R. Hofmann (2010). MicroRNA Evolution in the Genus <em>Arabidopsis</em> <span style="font-style:italic;">Plant Cell</span> : <a rev="review" href="http://www.plantcell.org/cgi/reprint/tpc.110.220411v1?maxtoshow=&amp;hits=10&amp;RESULTFORMAT=&amp;searchid=1&amp;FIRSTINDEX=0&amp;resourcetype=HWCIT">10.1105/tpc.110.220411</a></span>

However, the point to write about it is not to show off, but to make a list of corrections.

The study in this paper is data intensive, analysing hundreds of <em>MIRNA</em> genes at the same time. So it is easy to make mistakes. Or rather, I wasn't careful enough... Anyway, when the proof of the article and supplementary data have been finalized, I spotted several errors due to bugs in my Python code (Don't get it wrong, I won't blame Python for that).

Unfortunately, unlike software industry, most scientific publications are final, black ink on white paper (or in Chinese, 白纸黑字). You can not publish a paper as a "Beta" version, and keep refining it as what Gmail did.

So below is the errata:

<strong>SupDataset1</strong>

line 16, column E: 2:11845992-11846123 (+)

line 16, column H: scaffold_201452.1

line 16, column J: Single locus

line 16, column L: Yes

line 16, column N: Pass   (all the above are concerning one <em>MIRNA</em>, aly-MIR157b, which was first mistakenly annotated as the same sequence as aly-MIR157a and then removed in the original study due to a bug in my code)

line 127, column N: Fail   (basically it means aly-MIR832 actually FAILED MIRcheck)

<strong>Main text</strong>

Due to the change listed above, several numbers in the main text will have to change.

page 2, right column: "143 out of 157", "143" should be "144"

page 2, right column: "A total of 154 A. lyrata MIRNA loci", "154" should be "155"

page 2, right column: "Many of these loci (106)", "106" should be "107"

page 3, right column: "between these 128 syntenic A. thaliana and A. lyrata loci (88 from MC families and 40 from LC families)", "128" should be "129", "88" should be "89"

<strong>Figures</strong>

Figure 1, 3 and 4 will change slightly, although the degree of change is difficult to detect by eye. The overall trends and results will not change.

I sincerely apologize for all these errors. If you spot other errors, please leave a comment.

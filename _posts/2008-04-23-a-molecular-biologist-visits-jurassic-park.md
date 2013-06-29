---
layout: post
title: 分子生物学家眼中的侏罗纪公园
tags:
- bioinformatics
- BLAST
- fun
- sequence alignment
- study
status: publish
type: post
published: true
meta:
  _searchme: '1'
  views: '863'
  _wp_old_slug: '%e5%88%86%e5%ad%90%e7%94%9f%e7%89%a9%e5%ad%a6%e5%ae%b6%e7%9c%bc%e4%b8%ad%e7%9a%84%e4%be%8f%e7%bd%97%e7%ba%aa%e5%85%ac%e5%9b%ad'
---
标题很不恰当，我不是讨论生物伦理学，而是要讲个故事。

1990年, Micheal Crichton出版了著名的科幻小说《侏罗纪公园》，书中的科学家Dr. Henry Wu讲解复活恐龙的原理时，给读者看了一段恐龙DNA序列:

gcgttgctgg cgtttttcca taggctccgc ccccctgacg agcatcacaa aaatcgacgc
ggtggcgaaa cccgacagga ctataaagat accaggcgtt tccccctgga agctccctcg
tgttccgacc ctgccgctta ccggatacct gtccgccttt ctcccttcgg gaagcgtggc
tgctcacgct gtaggtatct cagttcggtg taggtcgttc gctccaagct gggctgtgtg
ccgttcagcc cgaccgctgc gccttatccg gtaactatcg tcttgagtcc aacccggtaa
agtaggacag gtgccggcag cgctctgggt cattttcggc gaggaccgct ttcgctggag
atcggcctgt cgcttgcggt attcggaatc ttgcacgccc tcgctcaagc cttcgtcact
ccaaacgttt cggcgagaag caggccatta tcgccggcat ggcggccgac gcgctgggct
ggcgttcgcg acgcgaggct ggatggcctt ccccattatg attcttctcg cttccggcgg
cccgcgttgc aggccatgct gtccaggcag gtagatgacg accatcaggg acagcttcaa
cggctcttac cagcctaact tcgatcactg gaccgctgat cgtcacggcg atttatgccg
caagtcagag gtggcgaaac ccgacaagga ctataaagat accaggcgtt tcccctggaa
gcgctctcct gttccgaccc tgccgcttac cggatacctg tccgcctttc tcccttcggg
ctttctcatt gctcacgctg taggtatctc agttcggtgt aggtcgttcg ctccaagctg
acgaaccccc cgttcagccc gaccgctgcg ccttatccgg taactatcgt cttgagtcca
acacgactta acgggttggc atggattgta ggcgccgccc tataccttgt ctgcctcccc
gcggtgcatg gagccgggcc acctcgacct gaatggaagc cggcggcacc tcgctaacgg
ccaagaattg gagccaatca attcttgcgg agaactgtga atgcgcaaac caacccttgg
ccatcgcgtc cgccatctcc agcagccgca cgcggcgcat ctcgggcagc gttgggtcct
gcgcatgatc gtgctagcct gtcgttgagg acccggctag gctggcgggg ttgccttact
atgaatcacc gatacgcgag cgaacgtgaa gcgactgctg ctgcaaaacg tctgcgacct
atgaatggtc ttcggtttcc gtgtttcgta aagtctggaa acgcggaagt cagcgccctg

1992年，NCBI的科学家Dr. Mark Boguski阅读《侏罗纪公园》时，好奇地用这段序列去blast了一下，结果他发现了什么？
哈哈,你自己去blast一下，只需要2分钟，或者看看Mark<a href="http://www.markboguski.net/publications_PDFs/BioTechniques%201992.pdf" target="_blank">发表在BioTechniques上的发现</a> Boguski, M.S. A Molecular Biologist Visits Jurassic Park. (1992) BioTechniques 12(5):668-669.

话说Micheal Crichton看到Mark这篇文章，大为倾倒，于是请他做写科幻小说的顾问，在他的另一本书《消失的世界》(The Lost World)中,Mark杜撰了一个恐龙DNA序列:

gaattccgga agcgagcaag agataagtcc tggcatcaga tacagttgga gataaggacg
gacgtgtggc agctcccgca gaggattcac tggaagtgca ttacctatcc catgggagcc
atggagttcg tggcgctggg ggggccggat gcgggctccc ccactccgtt ccctgatgaa
gccggagcct tcctggggct gggggggggc gagaggacgg aggcgggggg gctgctggcc
tcctaccccc cctcaggccg cgtgtccctg gtgccgtggg cagacacggg tactttgggg
accccccagt gggtgccgcc cgccacccaa atggagcccc cccactacct ggagctgctg
caaccccccc ggggcagccc cccccatccc tcctccgggc ccctactgcc actcagcagc
gggcccccac cctgcgaggc ccgtgagtgc gtcatggcca ggaagaactg cggagcgacg
gcaacgccgc tgtggcgccg ggacggcacc gggcattacc tgtgcaactg ggcctcagcc
tgcgggctct accaccgcct caacggccag aaccgcccgc tcatccgccc caaaaagcgc
ctgcgggtga gtaagcgcgc aggcacagtg tgcagccacg agcgtgaaaa ctgccagaca
tccaccacca ctctgtggcg tcgcagcccc atgggggacc ccgtctgcaa caacattcac
gcctgcggcc tctactacaa actgcaccaa gtgaaccgcc ccctcacgat gcgcaaagac
ggaatccaaa cccgaaaccg caaagtttcc tccaagggta aaaagcggcg ccccccgggg
gggggaaacc cctccgccac cgcgggaggg ggcgctccta tggggggagg gggggacccc
tctatgcccc ccccgccgcc ccccccggcc gccgcccccc ctcaaagcga cgctctgtac
gctctcggcc ccgtggtcct ttcgggccat tttctgccct ttggaaactc cggagggttt
tttggggggg gggcgggggg ttacacggcc cccccggggc tgagcccgca gatttaaata
ataactctga cgtgggcaag tgggccttgc tgagaagaca gtgtaacata ataatttgca
cctcggcaat tgcagagggt cgatctccac tttggacaca acagggctac tcggtaggac
cagataagca ctttgctccc tggactgaaa aagaaaggat ttatctgttt gcttcttgct
gacaaatccc tgtgaaaggt aaaagtcgga cacagcaatc gattatttct cgcctgtgtg
aaattactgt gaatattgta aatatatata tatatatata tatatctgta tagaacagcc
tcggaggcgg catggaccca gcgtagatca tgctggattt gtactgccgg aattc

这个序列来源于和恐龙亲缘关系很近的一个物种的序列，并混合了蛙的DNA序列，同时，Mark还做了点小手脚，在这个序列翻译成的蛋白质序列中，嵌入了一条消息。是什么你也不要问啦，我虽然不知道，即使知道也不会告诉你滴，自己去blast！

这段轶事是在<a href="http://www.inf.fu-berlin.de/lehre/WS05/aldabi/aufgabe5_12.html" target="_blank">http://www.inf.fu-berlin.de/lehre/WS05/aldabi/aufgabe5_12.html</a>看到的，赞一下！

恩，补充一下，这个故事说明，生物学家要多读科幻小说，并且保持好奇心，把里面的序列都去blast一下，就可以发paper，并且兼职做顾问赚外快啦

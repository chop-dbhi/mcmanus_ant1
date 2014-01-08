---
layout: wide
---

### ChIP-Seq Analysis

> [err_chipseq.pdf](err_chipseq.pdf)

### Using ERR BigWig Tracks in UCSC Genome Browser

Add custom tracks

The first three are raw unscaled BigWig directly derived from the alignments, the second two are normalized, and the last two are fold enrichment relative to input.

> ```track type=bigWig name=ERR1 smoothingWindow=4 color=127,201,127 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR1.bw```

> ```track type=bigWig name=ERR3 smoothingWindow=4 color=190,174,212 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR3.bw```

> ```track type=bigWig name=INPUT smoothingWindow=4 color=253,192,134 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/CTRL.bw```

> ```track type=bigWig name=ERR1_score smoothingWindow=4 color=255,255,153 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR1_treat_pileup.bw```

> ```track type=bigWig name=ERR3_score smoothingWindow=4 color=56,108,176 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR3_treat_pileup.bw```

> ```track type=bigWig name=ERR1_FE smoothingWindow=4 color=240,2,127 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR1.fe.bw```

> ```track type=bigWig name=ERR3_FE smoothingWindow=4 color=191,91,23 autoScale=on viewLimits=1:200 visibility=full windowingFunction=maximum bigDataUrl={{ site.uploaddir }}/ERR3.fe.bw```

### Tracks
I put these on dropbox for UCSC to see them but they can be downloaded below:

#### Raw BigWigs
> [ERR1.bw](ERR1.bw)

> [ERR3.bw](ERR3.bw)

> [CTRL.bw](CTRL.bw)

#### Normalized

> [ERR1_treat_pileup.bw](ERR1_treat_pileup.bw)

> [ERR3_treat_pileup.bw](ERR3_treat_pileup.bw)

#### Fold enrichment

> [ERR1.fe.bw](ERR1.fe.bw)

> [ERR3.fe.bw](ERR3.fe.bw)

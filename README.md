# Structural Phylogenomics Pipeline Tutorial

## Prerequisites

Please install the following before starting:

### Command-line tools
- [HMMer](http://hmmer.org/)
- [Foldseek](https://github.com/steinegger-lab/foldseek)
- [MAFFT](https://mafft.cbrc.jp/alignment/software/)
- [FAMSA](https://github.com/refresh-bio/FAMSA)
- [Foldmason](https://github.com/steinegger-lab/foldmason)
- [IQ-TREE 2](http://www.iqtree.org/)
- [FigTree](http://tree.bio.ed.ac.uk/software/figtree/)
- [Quarto](https://quarto.org/)

### R packages
Open R and run:
\`\`\`r
install.packages("pak")
pak::pkg_install(c("ape", "ggtree", "ggplot2", "Biostrings", "TreeDist", "tidyverse"))
\`\`\`

## Setup

\`\`\`bash
git clone https://github.com/YOUR_USERNAME/str2phy_tools_tutorial_v0.git
cd str2phy_tools_tutorial_v0
\`\`\`

Open the folder in VS Code. When prompted, click **Install Recommended Extensions**.

## Running the tutorial

Open \`tutorial.qmd\` in VS Code and click **Render**, or run from the terminal:

\`\`\`bash
quarto render tutorial.qmd
\`\`\`

This produces \`tutorial.html\` — open it in any browser.

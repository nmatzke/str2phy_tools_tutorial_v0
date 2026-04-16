# Structural Phylogenomics Pipeline Tutorial
 
A step-by-step tutorial pipeline moving from bacterial genomes to
phylogenetic trees, using sequence and structure-based methods.
 
**Example data:** *E. coli* K12 MG1655 genome (U00096.3), MotA query
sequence and structure (UniProt P0AFN2 / AlphaFold AF-P0AFN2-F1).
 
## Prerequisites
 
Install the following tools before starting:
 
| Tool | Install |
|---|---|
| [Quarto](https://quarto.org/) | Download from quarto.org |
| [HMMer](http://hmmer.org/) | `conda install -c bioconda hmmer` |
| [Foldseek](https://github.com/steinegger-lab/foldseek) | `conda install -c bioconda foldseek` |
| [MAFFT](https://mafft.cbrc.jp/) | `conda install -c bioconda mafft` |
| [FAMSA](https://github.com/refresh-bio/FAMSA) | `conda install -c bioconda famsa` |
| [Foldmason](https://github.com/steinegger-lab/foldmason) | See GitHub releases |
| [IQ-TREE 2](http://www.iqtree.org/) | `conda install -c bioconda iqtree` |
| [FigTree](http://tree.bio.ed.ac.uk/software/figtree/) | Download from website |
| [any2fasta](https://github.com/tseemann/any2fasta) | `conda install -c bioconda any2fasta` |
 
Install required R packages:
 
```r
install.packages("pak")
pak::pkg_install(c(
  "Bioconductor/Biostrings",
  "ape", "ggtree", "ggplot2", "TreeDist", "tidyverse"
))
```
 
## Setup
 
```bash
git clone https://github.com/YOUR_USERNAME/str2phy_tools_tutorial_v0.git
cd str2phy_tools_tutorial_v0
bash setup_repo.sh   # downloads example data and creates folder structure
```
 
Open the folder in VS Code. When prompted, click **Install Recommended
Extensions**.
 
## Running the tutorial
 
Open `tutorial.qmd` in VS Code and click **Render**, or from the terminal:
 
```bash
quarto render tutorial.qmd
```
 
This produces `tutorial.html` — open it in any browser.
 
## Folder structure
 
| Folder | Contents |
|---|---|
| `01_input/` | Example genome, query sequence, query structure |
| `02_genome_proteins/` | Extracted protein FASTA from genome |
| `03_hmmer/` | HMM profile and search results |
| `04_foldseek/` | Foldseek structural search results |
| `05_hit_fasta/` | Combined hit sequences in FASTA |
| `06_3di/` | 3Di structural alphabet sequences |
| `07_alignments/` | MAFFT, FAMSA, and Foldmason alignments |
| `08_trees/` | IQ-TREE 2 phylogenetic trees |
| `09_visualization/` | R tree plots |
| `10_tree_distances/` | Tree distance statistics |

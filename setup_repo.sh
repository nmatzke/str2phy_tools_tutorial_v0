#!/usr/bin/env bash
# Run this from inside your repo:
#   cd ~/GitHub/str2phy_tools_tutorial_v0
#   bash setup_repo.sh
 
set -e
 
echo "=== Creating folder structure ==="
 
mkdir -p 01_input
mkdir -p 02_genome_proteins
mkdir -p 03_hmmer
mkdir -p 04_foldseek
mkdir -p 05_hit_fasta
mkdir -p 06_3di
mkdir -p 07_alignments
mkdir -p 08_trees
mkdir -p 09_visualization
mkdir -p 10_tree_distances
mkdir -p Rsrc
mkdir -p .vscode
 
# Keep empty output folders tracked by Git
touch 02_genome_proteins/.gitkeep
touch 03_hmmer/.gitkeep
touch 04_foldseek/.gitkeep
touch 05_hit_fasta/.gitkeep
touch 06_3di/.gitkeep
touch 07_alignments/.gitkeep
touch 08_trees/.gitkeep
touch 09_visualization/.gitkeep
touch 10_tree_distances/.gitkeep
 
echo "=== Downloading E. coli K12 genome (GenBank U00096.3) ==="
curl -s "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?\
db=nuccore&id=U00096.3&rettype=gbwithparts&retmode=text" \
  -o 01_input/ecoli_k12.gbk
echo "    Done: 01_input/ecoli_k12.gbk"
 
echo "=== Downloading MotA query sequence (UniProt P0AFN2) ==="
curl -s "https://rest.uniprot.org/uniprotkb/P0AFN2.fasta" \
  -o 01_input/motA.faa
echo "    Done: 01_input/motA.faa"
 
echo "=== Downloading MotA AlphaFold structure (AF-P0AFN2-F1) ==="
curl -s "https://alphafold.ebi.ac.uk/files/AF-P0AFN2-F1-model_v4.pdb" \
  -o 01_input/motA.pdb
echo "    Done: 01_input/motA.pdb"
 
echo "=== Writing .vscode/extensions.json ==="
cat > .vscode/extensions.json << 'EOF'
{
  "recommendations": [
    "quarto.quarto",
    "REditorSupport.r",
    "RDebugger.r-debugger",
    "mads-hartmann.bash-ide-vscode",
    "timonwong.shellcheck",
    "mechatroner.rainbow-csv",
    "GrapeCity.gc-excelviewer",
    "christian-kohler.path-intellisense",
    "oderwat.indent-rainbow",
    "eamodio.gitlens"
  ]
}
EOF
 
echo "=== Writing _quarto.yml ==="
cat > _quarto.yml << 'EOF'
project:
  type: default
 
format:
  html:
    self-contained: true
    toc: true
    toc-depth: 3
    toc-title: "Pipeline Steps"
    code-fold: false
    theme: cosmo
    highlight-style: github
 
execute:
  echo: true
  warning: false
  message: false
EOF
 
echo "=== Writing .gitignore ==="
cat > .gitignore << 'EOF'
# Quarto rendered output
/_site/
/.quarto/
*_files/
*.html
 
# R
.Rhistory
.RData
.Rproj.user/
renv/library/
 
# Large sequence/structure files (comment out if you want to commit example data)
*.fastq
*.fastq.gz
*.bam
*.bai
 
# Foldseek tmp folders
*/tmp/
EOF
 
echo "=== Writing README.md ==="
cat > README.md << 'EOF'
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
EOF
 
echo ""
echo "=== All done! Suggested next steps: ==="
echo ""
echo "  cp /path/to/tutorial.qmd ."
echo "  git add -A"
echo "  git commit -m 'Initial project structure and example data'"
echo "  git push"
echo ""
echo "Folder structure:"
find . -not -path './.git/*' | sort

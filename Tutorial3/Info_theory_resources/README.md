# Installation Instructions

## Linux

1. **Install Miniconda**  
   # Create a directory for Miniconda
   mkdir -p ~/miniconda3
   
   # Download the Linux Miniconda installer
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
   
   # Install silently into ~/miniconda3
   bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
   
   # Remove the installer
   rm ~/miniconda3/miniconda.sh
   
   # (Optional) Initialize conda in your shell (e.g., bash)
   source ~/miniconda3/etc/profile.d/conda.sh

2. **Create and activate a conda environment**  
   conda create -n thoi python=3.10 -y
   conda activate thoi

3. **Install required packages**  
   pip install jupyter
   pip install torch
   pip install thoi
   pip install matplotlib
   pip install seaborn

---

## macOS

> **Note**: The URL below is for Apple Silicon (arm64). If you have an Intel-based Mac, use the corresponding `x86_64.sh` installer from the [Miniconda website](https://docs.conda.io/en/latest/miniconda.html).

1. **Install Miniconda**  
   # Create a directory for Miniconda
   mkdir -p ~/miniconda3
   
   # Download the macOS Apple Silicon Miniconda installer
   curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh -o ~/miniconda3/miniconda.sh
   
   # Install silently into ~/miniconda3
   bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
   
   # Remove the installer
   rm ~/miniconda3/miniconda.sh
   
   # (Optional) Initialize conda in your shell (zsh, bash, etc.)
   source ~/miniconda3/etc/profile.d/conda.sh

2. **Create and activate a conda environment**  
   conda create -n thoi python=3.10 -y
   conda activate thoi

3. **Install required packages**  
   pip install jupyter
   pip install torch
   pip install thoi
   pip install matplotlib
   pip install seaborn

---

## Windows

1. **Install Anaconda or Miniconda**  
   - Download and install Anaconda or Miniconda from [the official website](https://docs.conda.io/en/latest/miniconda.html).  
   - During installation, check “Add Anaconda to my PATH environment variable” if you plan to use it in a standard Command Prompt. Otherwise, use the **Anaconda Prompt** that comes with the installation.

2. **Open an Anaconda Prompt** (or Command Prompt if you added conda to your PATH).

3. **Create and activate a conda environment**  
   conda create -n thoi python=3.10 -y
   conda activate thoi

4. **Install required packages**  
   pip install jupyter
   pip install torch
   pip install thoi
   pip install matplotlib
   pip install seaborn

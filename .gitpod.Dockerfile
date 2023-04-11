FROM gitpod/workspace-full

# Install conda
RUN curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  && bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda \
  && rm Miniconda3-latest-Linux-x86_64.sh \
  && echo "source ~/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc

# Install any required packages via conda
RUN conda install -n base -c conda-forge mamba \
  && conda activate base \
  && echo "conda activate base" >> ~/.bashrc \
  && mamba init >> >> ~/.bashrc \
  && mamba create -c conda-forge -c bioconda -n snakemake snakemake \
  && conda activate snakemake 
  
  && conda install -n myenv pandas numpy matplotlib

# Set the default command to bash
CMD ["bash"]

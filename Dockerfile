
FROM us-central1-docker.pkg.dev/ucb-datahub-2018/base-images-repo/base-python-image:bb2e6c6

# -------------------------------
# Environment for R
# -------------------------------

ENV JULIA_DIR=/srv/julia
ENV CONDA_DIR=/srv/conda/envs/notebook

ENV PATH=${JULIA_DIR}/bin:${CONDA_DIR}/bin:$PATH


USER root
RUN apt-get update && apt-get install -y tini && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------
# System packages
# ------------------------------------------------------------
# Copy your new apt.txt
COPY apt.txt /tmp/apt.txt

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends $(grep -v '^#' /tmp/apt.txt) && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/apt.txt

RUN mkdir -p ${JULIA_DIR} && chown ${NB_USER}:${NB_USER} ${JULIA_DIR}

# ------------------------------------------------------------
# Conda / Python packages
# ------------------------------------------------------------
# Copy environment.yml for additional packages
USER ${NB_USER}
COPY --chown=${NB_USER}:${NB_USER} environment.yml /tmp/environment.yml


# Update existing /srv/conda/notebook environment with new packages
RUN mamba env update -n notebook -f /tmp/environment.yml && \
    mamba clean -afy && rm -rf /tmp/environment.yml


USER root
RUN rm -rf /tmp/*



USER ${NB_USER}
WORKDIR /home/${NB_USER}

COPY install-julia.bash /tmp/install-julia.bash
RUN /tmp/install-julia.bash
ENV JULIA_DEPOT_PATH=${JULIA_DIR}/pkg
ENV JULIA_CPU_TARGET=generic

RUN JUPYTER_DATA_DIR=${CONDA_DIR}/share/jupyter julia -e 'using Pkg; Pkg.add("IJulia"); using IJulia; installkernel("Julia");'

COPY install-julia-packages.jl /tmp/install-julia-packages.jl
RUN /tmp/install-julia-packages.jl
RUN julia -e 'println(Sys.CPU_NAME)'



EXPOSE 8888
ENTRYPOINT ["tini", "--"]












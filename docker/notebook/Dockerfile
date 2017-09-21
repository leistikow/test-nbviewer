# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

FROM jupyter/pyspark-notebook

LABEL version "20170920.01"

USER root

# Do the pip installs as the unprivileged notebook user
USER jovyan

RUN conda install -c conda-forge ipywidgets
RUN conda install bokeh

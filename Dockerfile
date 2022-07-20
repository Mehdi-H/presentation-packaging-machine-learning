# 👇 définition de la version de Python nécessaire, tirée du dockerhub
FROM python:3.8.0-slim  

# 👇 Installation de dépendances sur le système
RUN apt-get update \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 👇 Packaging du modèle de machine learning
COPY presentation_pkg_ml/densenet121_weights_tf_dim_ordering_tf_kernels.h5 /app/presentation_pkg_ml/densenet121_weights_tf_dim_ordering_tf_kernels.h5

# 👇 Packaging des sources python
COPY setup.py setup.cfg MANIFEST.in /app/
COPY presentation_pkg_ml/*.py /app/presentation_pkg_ml

# 👇 Installation de dépendances Python via pip
WORKDIR /app
RUN pip install --user -U pip && pip install .
CMD pkg-ml
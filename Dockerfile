FROM renku/renkulab-py:3.10-0.23.0

RUN mamba init && \
    mamba install -y voila nodejs ipywidgets jupyterlab_widgets ipyfilechooser && \
    npm install -g @devcontainers/cli

COPY --chown=jovyan:jovyan src /renku_templates

CMD [ "jupyter", "server", "--ip", "0.0.0.0", "/renku_templates/apply_template.ipynb"]

FROM darribas/gds_py:2.0

RUN pip install keplergl

RUN sed -i "s/print data/print(data)/g" /opt/conda/lib/python3.7/site-packages/keplergl/keplergl.py

# Local docs
RUN rm -R work/
COPY ./README.md ${HOME}/README.md
COPY ./pysal_kepler.ipynb ${HOME}/pysal_kepler.ipynb
COPY ./config.json ${HOME}/config.json
COPY ./config_lisa.json ${HOME}/config_lisa.json
# Fix permissions
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

# Start-up
CMD ["jupyter", "notebook"]

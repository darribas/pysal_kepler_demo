FROM darribas/gds:2.0

RUN pip install keplergl

RUN sed -i "s/print data/print(data)/g" /opt/conda/lib/python3.7/site-packages/keplergl/keplergl.py



FROM continuumio/miniconda3@sha256:d7ab0b98c5adad49ed5dabf11a93d53361f08445b998945d80d351b417d4e0ba
RUN apt update && apt -y install gcc gunicorn

COPY environment.yml environment.yml
RUN conda update -n base -c defaults conda && \
    conda env create -f environment.yml && \
    conda clean -a -y && \
    echo "source activate app" >> ~/.bashrc

ENV PATH /opt/conda/envs/app/bin:$PATH

COPY src .
RUN chmod +x boot.sh

ENV FLASK_APP app.py

EXPOSE 5000
ENTRYPOINT ["sh", "boot.sh"]

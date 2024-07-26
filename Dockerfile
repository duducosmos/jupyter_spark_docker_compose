FROM jupyter/pyspark-notebook
USER root

# Instalar pacotes necessários
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    rm -rf /var/lib/apt/lists/*

# Instalar o JAR do Hadoop para S3
RUN wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.2.4/hadoop-aws-3.2.4.jar -P /usr/local/spark/jars/ && \
    wget https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.900/aws-java-sdk-bundle-1.11.900.jar -P /usr/local/spark/jars/

# Instalar Python requirements
COPY requirements.txt /home/jovyan/
RUN pip install -r /home/jovyan/requirements.txt

COPY jupyter_lab_config.json /home/jovyan/

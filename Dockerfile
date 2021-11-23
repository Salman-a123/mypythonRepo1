FROM python:3.8-slim-buster
# Install python and pip
RUN apk add --update py2-pip

RUN echo "I am here at check point1"
COPY install-packages.sh .
RUN ./install-packages.sh
RUN echo "I am here at check point2"

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]

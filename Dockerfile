#choose our version of python
FROM python:3.11

#setu up a working directory
WORKDIR /code

#copy just the requirements into the working directory so it gets cached by itself
COPY ./requirements.txt /code/requirements.txt

#install the dependencies from the requirements file
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

#copy the code into the working directory
COPY ./src /code/src

COPY ./models /code/models

COPY ./config.py /code/config.py

COPY ./data /code/data

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]

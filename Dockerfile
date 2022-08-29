FROM python:3.9

EXPOSE 80

COPY ./app /app

COPY requirements.txt /app/requirements.txt

WORKDIR /app

RUN python3 -m pip install --no-cache-dir --upgrade \
        setuptools \
        wheel \
        && \
    python3 -m pip install --trusted-host pypi.python.org -r requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
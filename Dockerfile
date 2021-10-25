FROM python:alpine as base
    WORKDIR /app/
    COPY requirements.txt .
    RUN pip install -r requirements.txt

FROM base as base_test
    COPY requirements.test.txt .
    RUN pip install -r requirements.test.txt

FROM base_test as test
    COPY . .
    ENTRYPOINT ["pytest"]

FROM base as app
    COPY ./app/ .
    ENTRYPOINT ["python", "-m", "http.server"]

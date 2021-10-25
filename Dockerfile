FROM python:slim as base

    # Systems tools
    RUN \
        apt-get update && \
        apt-get install -y \
            less \
            nano \
            make \
    && rm -rf /var/lib/apt/lists/*

    WORKDIR /app/

    # Project dependencies
    COPY requirements.txt .
    RUN pip install -r requirements.txt

FROM base as base_test
    COPY requirements.test.txt .
    RUN pip install -r requirements.test.txt

FROM base_test as test
    COPY . .
    CMD ["pytest"]

FROM base as serve_app
    COPY ./app/ .
    RUN python example.py > data.json
    RUN mv example.html index.html
    CMD ["python", "-m", "http.server"]

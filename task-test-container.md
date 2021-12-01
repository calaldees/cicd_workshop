Task: Test Container
====================



* Build a docker container that has a a python _code formatter_ and _test framework_ installed
* Run tests and code formatter check in the container
* Have the tests run when you commit to your repo

Hints:
* filename case is important!
* `Makefile:4: *** missing separator.  Stop.` - Makefiles must be indented with TAB's (not spaces)


Repo
----

* Create a new github repo
    * https://github.com/new
        * `Add a README file`
* Create GitPod Workspace
    * In your browser `https://gitpod.io#PASTE_YOUR_REPO_URL_HERE`
* Start developing! Add the files below
    * Fix the broken tests
    * Format the code with the formatter `black .`
* Commit and push
    * `git status`
    * `git add .` 
        * (first time to track the files)
    * `git commit -a`
        * Type a meaning message about your change
    * `git push`
        * (you may have to set GitPod permissions)
    * Check GitHub actions status


Files
-----

`Dockerfile`
```Dockerfile
FROM python:slim

WORKDIR /app/

RUN pip install ??? ???

COPY . .
```

`Makefile`
```Makefile
DOCKER_IMAGE:=my-first-container

build:
	docker build --tag ${DOCKER_IMAGE} .

run_pytest:
	docker run --rm ${DOCKER_IMAGE} pytest

run_black_check:
	docker run --rm ${DOCKER_IMAGE} black --check .

shell:
	docker run --rm -it --volume ${PWD}:/app/ ${DOCKER_IMAGE} /bin/bash
```

`example.py`
```python
def add(a, b):
    return 0

def multiply(a, b):
    return 0
```

`test_example.py`
```python
def test_add():
    assert add(1, 2) == 3
    assert add(1, -2) == -1
    assert add(1000000000000000000, 2) == 1000000000000000002

def test_multiply():
    assert False, "please implement the rest of this test"
```

`.github/workflows/test.yml`
```
name: Test
on:
  push:
jobs:
  test:
    name: Test
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
    - name: Build container
      run: make build
    - name: Run black code format check
      run: make run_black_check
    - name: Run PyTest tests
      run: make run_pytest
```
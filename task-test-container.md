Task: Create a repo with CI Tests (GitHub Actions)
=================================

Your Mission:
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
* Commit and push
    * (as a test edit `README.md`)
    * `git status`
    * `git add .` 
        * (first time to track/add new files with git)
    * `git commit -a`
        * Type a meaningful message about your change
    * `git push`
        * (you may have to set GitPod permissions the first time you do this)
* Task
    1. Edit your `README.md` and commit a change -> verify the file has updated on GitHub web view
    2. Create/Copy files below
    3. Fix the broken tests
    4. Format the code with the formatter `black .`
    5. Commit + Check GitHub actions status


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
def add(a,b):
  return 0

def multiply(a,b):
  return 0
```

`test_example.py`
```python
from example import *

def test_add():
    assert add(1, 2) == 3
    assert add(1, -2) == -1
    assert add(1000000000000000000, 2) == 1000000000000000002

def test_multiply():
    assert False, "please implement the rest of this test"
```

`.github/workflows/test.yml`
```yml
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


Extension
=========

The tasks below can be done in any order.

* If you are adding new files, you need to _track_ them with git.
* Add/track the new files with `git add FILENAME` 
    * (be CAREFUL about tracking files that were programmatically generated. Add these `.gitignore` if you're l33t enough)


Setup a Manual Action with parms
--------------------------------

* [How to Manually Trigger a GitHub Actions Workflow](https://levelup.gitconnected.com/how-to-manually-trigger-a-github-actions-workflow-4712542f1960)
    * Look at Option 2 in the guide above
    * Make the GitHub Action ask for some text - output that text the terminal (rather than `git tag`) - `echo hello, ${{ github.event.inputs.version }}`


Code Coverage Report
--------------------

* Install `pytest-cov` and `pytest-env` in `Dockerfile`
* Create/modify `pytest.ini`
    * ```ini
        [pytest]
        env =
            COVERAGE_FILE=/tmp/pytest-cov.coverage
        addopts = --cov app --cov-report term --cov-report=html:/tmp/cov_report
        ```
* (not great, but) serve the coverage report with a webserver (to see the coverage report)
    * add `--publish 8000:8000` to `Makefile:shell`
    * `pytest` (to generate the report)
    * `python3 -m http.server --directory /tmp/cov_report/`
        * open browser at port 8000
    * add `pytest --cov-fail-under ??` and test this by creating a new function (sub? or div?)
* Side note:
    * Getting files out of an exited container is a bit complex for now - capturing html reports as _artefacts_ of the build process is useful


Code Metrics
------------

* Install `radon` in `Dockerfile`
* Run `radon cc .` and `radon mi .`
* Add these to `test.yml` to ensure these statistics are run on CI
* Research what Cyclomatic Complexity and Maintainability Index are
    * [radon.readthedocs.io/en/latest](https://radon.readthedocs.io/en/latest/)


HTML Report and Artefact
------------------------

* Install `pytest-html` in `Dockerfile`
* Create/modify `pytest.ini`
    * ```ini
        [pytest]
        addopts = --html=report.html --self-contained-html
        ```
    * https://docs.github.com/en/actions/advanced-guides/storing-workflow-data-as-artifacts#example
        * Add to `test.yml`
        * ```yml
            - name: Archive test report
              uses: actions/upload-artifact@v2
              with:
                name: test-report
                path: report.html
            ```
    * Alter the `Makefile:run_pytest` target to include `--volume ${PWD}:/app/` (to allow file-write mounting)
        * This is NOT an ideal way of containers sharing data ... but will do for now
    * Check the artifact is there in GitHub
        * Sadly this is a zip file
            * [Display files in browser where appropriate. #14](https://github.com/actions/upload-artifact/issues/14)


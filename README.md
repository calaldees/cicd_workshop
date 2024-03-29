CI/CD Workshop
==============

* A one off workshop introducing learners to CICD concepts
* Get ready to take notes (seriously ...)


Objectives
----------

* (not sure they work)
* Reverse Objectives - Tell me at the end what you got


Overview
--------

* Talky bit (until you get board - maybe some typing) (45min)
* Do-ey bit (can you make a simple CI system) (1h30min)
* Talky bit (probably wont have time for much) (45min)


The Problem
-----------

* Developer -> makes a code change -> Deploy to all the servers/appStore (Production)
    * ["I Test In Production" Meme's](https://www.google.com/search?tbm=isch&q=i+test+in+production)
    * This is irresponsible madness ...
* Developer(s) -> making changes over 10 parts of a big project -> Deploy to all the servers
    * Even more madness ... 
    * There are monkeys flinging poo everywhere!

What is the problem?
How do we fix it?



The Solution
------------

* Strategy 1: Get it right first time every time - detect errors
    * > None shall pass!!!!!
    * Months of checking involving whole teams of people and users
* Strategy 2: Deploy a little but, detect problems quickly and roll back quickly (if needed)
    * > It's all gone wrong ... [giffy: run away](https://giphy.com/explore/run-away)


* Strategy 3: Use cheaper human labour
    * Historic exploitation
    * How fast are humans? How reliable are humans? how expensive are humans?


* Continuous Integration (CI)
* Continuous Deployment (CD)


* Technologies
    * [GitLab CI](https://docs.gitlab.com/ee/ci/)
        * Prefers lots of small self contained repos
    * [GitHub Actions](https://github.com/features/actions)
        * Can work with mono-repos effectively (as github actions can target subfolders)
    * [Jenkins](https://www.jenkins.io/)
        * The flexible super omni-system. Difficult to setup. Difficult to replicate infrastructure
    * [CircleCI](https://circleci.com/)
        * 


Task:
Shared Whiteboard [whiteboard.fi](https://whiteboard.fi)

Many students struggle to articulate your ideas and understanding in writing.

* Banned phrases (I WILL GET ANNOYED!)
    * Faster, Easier, More efficient, Saves-money/costs-less
    * These are vague and if left unqualified are meaningless
* "What is the problem is this technology trying to solve"


Hands on
--------

* [task-test-container.md](task-test-container.md)


Unit-Tests
----------

1000's of Tests that test the small units of functionality


Branches
--------

Feature branches

Branch Protection

* GitHub -> project/repo -> Settings -> Branches -> Protect matching branches
    * Require a pull request before merging 
    * Require status checks to pass before merging 

* Squash commits for merging branches
    * allows for `git bisect`


Containers
----------

* Analogy: Pre-packed computer-in-a-box that can run isolated anywhere
    * Can (mostly) only run software on cloud in containers
    * Why? (do we have the same python version on all servers across the planet)
* Microservice
* Application + Database separate



Actions/Jobs/Workflow
-------

* [GitHub Actions](https://github.com/features/actions)
    * Automate your workflow from idea to production
    * GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD.
    * Build, test, and deploy your code right from GitHub.
    * Make code reviews, branch management, and issue triaging work the way you want.

Downstream jobs
Artifacts


Metrics
-------

* Metrics - cyclomatic complexity
* Code coverage
* (Derive) Code quality?


Code Coverage
-------------

```bash
make test
# generates `reports/cov.html`
python3 -m http.server --directory reports
```
* Show html report
* Show `pytest.cov-fail-under`


Integration Testing - Cypress
-----------------------------

```bash
make run
# demo application http://localhost:8000
```
```powershell
npm install cypress
set CYPRESS_BASE_URL=http://localhost:8000
npx cypress open
```



Pre-commit hooks
----------------

* [pre-commit](https://pre-commit.com/) -  A framework for managing and maintaining multi-language pre-commit hooks. 
    * [Supported hooks](https://pre-commit.com/hooks.html) list
    * Install
        * Local
            * `pip install pre-commit`
            * `pre-commit install`
        * You may want this installed and managed in the container


Parallelisation
---------------

Your local system (laptop) is not sufficient

* 1000 test to run that take 30min
* Split the tests into even batches and run them simultaneously
* Spin up 10 servers that run 100 tests in 3min (on average)
* Merge the test reports

10 times-ish faster


Integration Testing -> CD
-------------------

### Code process

* branch strategies
* formatters
* code review process
* merging/squashing
    * bisect
    * Feature/ticket in one audit/hash/place

### Continuous Integration
* Android (push to app store)
    * Mockachino
    * 7 updates a day? (good?/bad? why? human release)
* iOS

### Continuous Deployment
* Server (staged deployment)
    * trigger android article
* incremental deployment?
* rollback? tested as part of process
* chaos monkey(/gorilla)


Matrix Testing (Multiplatform)
--------------

Test Mac, Windows, Linux, Arm? all at once




Further Reading
---------------

* [pre-commit.com/hooks](https://pre-commit.com/hooks.html)
* [GitHub Actions Limitations and Gotchas](https://www.cbui.dev/github-actions-limitations-and-gotchas/)


### Test in Production
Actually has some truth
* https://www.flagship.io/test-in-production-memes/
* https://increment.com/testing/i-test-in-production/


### Professional Technologies
* [git](https://git-scm.com/)
* [GitHub](https://github.com) (repo)
* [GitHub Actions](https://github.com/features/actions)
* [GitPod](https://www.gitpod.io) (Cloud based development environment - VSCode in browser)
* [Docker](https://www.docker.com/) (A tool for building and running containerised applications)
* [PyTest](https://pytest.org/) (Python test framework)
* [Black](https://github.com/psf/black#readme) (code formatter)
* [make](https://www.gnu.org/software/make/manual/make.html) (tool to aid building software)


* [My unpopular opinion about black code formatter](https://luminousmen.com/post/my-unpopular-opinion-about-black-code-formatter)

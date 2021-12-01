cicd_workshop
=============

The Problem
-----------

* Developer -> Production
    * ["I Test In Production" Meme's](https://www.google.com/search?tbm=isch&q=i+test+in+production)
    * This is irresponsible madness ...
* Developers

A one off workshop introducing learners to CICD concepts


* https://www.flagship.io/test-in-production-memes/
* https://increment.com/testing/i-test-in-production/





The Solution
------------

* Strategy 1: Get it right first time every time - detect errors
    * > None shall pass!!!!!
* Strategy 2: Deploy a little but, detect problems quickly and roll back quickly (if needed)
    * > It's all gone wrong ... [giffy: run away](https://giphy.com/explore/run-away)

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
Shared Whiteboard

Many students struggle to articulate your ideas and understanding in writing.

* Banned phrases (I WILL GET ANNOYED!)
    * Faster, Easier, More efficient, Saves money
    * These are vague and if left unqualified are meaningless
* "What is the problem is this technology trying to solve"


Branches
--------

Feature branches

Branch Protection

* GitHub -> Repo -> Settings -> Branches -> Protect matching branches
    * Require a pull request before merging 
    * Require status checks to pass before merging 

Sqush
 bisect

Containers
----------

Analogy: Pre-packed computer-in-a-box that can run isolated anywhere
Microservice
Application + Database separate


Actions/Jobs/Workflow
-------

* [GitHub Actions](https://github.com/features/actions)
    * Automate your workflow from idea to production
    * GitHub Actions makes it easy to automate all your software workflows, now with world-class CI/CD. 
    * Build, test, and deploy your code right from GitHub. 
    * Make code reviews, branch management, and issue triaging work the way you want.

Downstream jobs
Paralalel
Metrics - cyclomatic compexity
Artifacts

Code quality


Matrix (Multiplatform?)
------




* [pre-commit.com/hooks](https://pre-commit.com/hooks.html)
* [GitHub Actions Limitations and Gotchas](https://www.cbui.dev/github-actions-limitations-and-gotchas/)
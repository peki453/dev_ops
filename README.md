# Devops Engineering Labs

Student name: **Marko Pezer** <br>
Student email: **m.pezer@innopolis.university** <br>
Student Telegram: **@marko453** <br>
Student group: **BS18-SE-01** 

If you have any questions, feel free to contact me at any time.

## Lab 1: Python App

For my simple app I have used Python and FastAPI.

To install FastAPI use `pip install fastapi`.

To install and run my application use following commands:

```
git clone https://github.com/peki453/dev_ops.git
cd app_python/app
uvicorn index:app --reload 
```

You can find more about Python best practices in `PYTHON.md` file. 

**References:**

- [Python](https://python.org)
- [FastAPI](https://fastapi.tiangolo.com/)

## Lab 2: Docker

In this lab we get started with Docker.

You can find more about Docker best practices in `DOCKER.md` file. 

**References:**

- [Docker](https://docker.com/)

## Lab 3: Continuous Integration (CI)

Third lab was about Unit Testing and Continuous Integration (CI).

Since my application is very simple, I tested just if response from request to main page is 200 (`STATUS 200 OK`).

For unit testing use following comands:

```
cd app_python/app
pytest unit_tests.py
```

You can find more about CI and Jenkins best practices in `CI.md` file. 
Moreover, in `PYTHON.md` file you can find list of best practices for Python Unit Testing.

**References:**

- [Jenkins](https://www.jenkins.io/)

## Lab 4: Infrastructure As Code

This lab was about infrastructure as code and Terraform.

You can find more about Terraform best practices in `TF.md` file. 

**References:**

- [Terraform](https://www.terraform.io/)

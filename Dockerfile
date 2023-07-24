FROM python:3.11
LABEL AUTHOR="Wilhelium"

RUN mkdir /pytest-project/
COPY ./test-requirements.txt /pytest-project/
COPY ./setup.py ./setup.py

RUN pip3 install --upgrade pip \\
&& pip install -e . \\
&& pip3 install -r /pytest-project/test-requirements.txt

WORKDIR /pytest-project/
CMD "pytest"
ENV PYTHONDONTWRITEBYTECODE=true
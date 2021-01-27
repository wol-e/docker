FROM python:3

RUN mkdir src

WORKDIR src

COPY src/ .

RUN pip install -r requirements.txt
RUN pip install jupyter

RUN python3 my_script.py # feel free to delete this bit (and the my_script.py), it's just to showcase

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]


FROM python:3.7.6-alpine3.11
RUN apk update && apk add py3-gunicorn postgresql-dev libffi-dev python3-dev musl-dev build-base
COPY ./requirements/prod.txt /app/requirements.txt
WORKDIR /app
ENV CONDUIT_SECRET='something-really-secret' FLASK_APP='app/autoapp.py' FLASK_DEBUG=0 DATABASE_URL=postgres://otnecihopmfiee:eec126400a7527061a9f30075160d2efcc06eeab490ef91bf1b7ccca2416ab23@ec2-174-129-33-156.compute-1.amazonaws.com:5432/d6ihee8p5iu77g
RUN pip install -r /app/requirements.txt
COPY . ./
EXPOSE 5000
CMD ["gunicorn", "autoapp:app", "-b", "0.0.0.0:5000", "-w", "3"]
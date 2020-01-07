FROM python:3.6.4

WORKDIR /app
COPY requirements*.txt ./
ENV CONDUIT_SECRET='something-really-secret' FLASK_APP=/home/circleci/repo/autoapp.py FLASK_DEBUG=0 DATABASE_URL=postgres://otnecihopmfiee:eec126400a7527061a9f30075160d2efcc06eeab490ef91bf1b7ccca2416ab23@ec2-174-129-33-156.compute-1.amazonaws.com:5432/d6ihee8p5iu77g
RUN pip install -r /app/requirements/prod.txt
COPY . .
EXPOSE 5000
CMD ["flask", "run"]
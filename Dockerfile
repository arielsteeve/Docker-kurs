FROM python:2.7-stretch

#Maintainer of image
MAINTAINER arielsteeve@googlemail.com

#Install Apache
RUN apt-get update -y
RUN apt-get install git

#Install of dependencies
RUN apt-get update -y && apt-get install python-dev python3-dev libsasl2-dev python-dev libldap2-dev libssl-dev -y
RUN pip install flask==1.1.2 flask_httpauth==4.1.0 flask_simpleldap python-dotenv==0.14.0


# Add API
ADD student_age.py /

# create data folder
VOLUME ["/data"]

EXPOSE 5000

CMD ["python","./student_age.py"]

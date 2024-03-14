
## Get the Python Base image from Docker-hub

FROM python:3.11

## Create A Working Directory 

WORKDIR /app

## Copy the code from load machine to Docker

COPY . .

## Let's install virtualenv first

#RUN pip install virtualenv

# Then we create our virtual environment
#RUN virtualenv envname

## Activate the virtual environment :

#RUN envname\scripts\activate

#Install the requirements

RUN pip install -r requirements.txt

# Expose the port on which Django runs (default is 8000)
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

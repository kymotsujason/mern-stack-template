# MERN stack Template
MERN stack template

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to utilize this project and how to install them

```
NodeJS (v20.8.0 used) - https://nodejs.org/en/download/current
NPM (v10.4.0 used) - https://nodejs.org/en/download/current
Visual Studio Code (v1.18.6 used) - https://code.visualstudio.com/download
Mongodb (v7.0 used) - https://www.mongodb.com/try/download/community
PM2 (v5.3.0) - https://pm2.keymetrics.io/
```

### Installing

A step by step series of examples that tell you how to get a development env running

Clone the project (or download it)

```
git clone https://github.com/kymotsujason/mern-stack-template.git
```

Open the root directory in Visual Studio Code

Run the following command in both the backend and frontend folder

```
npm install
```

Create a .env file in the backend directory with the following values

```
PORT=(any port number, I use 5556)
PROD_DATABASE_URL=(your prod mongodb ip, example is 123.123.123.123:27017)
DATABASE_URL=(your dev mongodb ip, example is 127.0.0.1:27017)
DATABASE_TABLE=(your mongodb table, it autocreates)
```

Create a .env file in the frontend directory with the following values

```
PORT=(any port number, I use 5555)
```

Click on the "Run and Debug" button (left sidebar)

Change the dropdown to "Backend+Frontend Development"

Click the Play button

## Running the tests

Use your mindpower to virtually summon tests into existence

## Deployment

Create a .env file in the root directory with the following values

```
USER=(linux username)
PASSWORD=(linux password)
SERVER_IP=(linux server ip)
FRONTEND_ZIP=frontend.zip
BACKEND_ZIP=backend.zip
SERVER_FRONTEND_ZIP=(upload directory)/frontend.zip
SERVER_BACKEND_ZIP=(upload directory)/backend.zip
SERVER_FRONTEND_ZIP_PATH=(upload directory)
SERVER_BACKEND_ZIP_PATH=(upload directory)
SERVER_FRONTEND_ROOT=/var/www/frontend/build/
SERVER_BACKEND_ROOT=/var/www/backend/
PM2_FRONTEND=(pm2 frontend name)
PM2_BACKEND=(pm2 backend name)
FRONTEND_EXPRESS=./frontend/frontend.js
FRONTEND_ENV=./frontend/.env
SERVER_FRONTEND_EXPRESS_ROOT=/var/www/frontend/
SERVER_FRONTEND_ZIP=(upload directory)/frontend.js
SERVER_FRONTEND_ZIP=(upload directory)/.env
```

Run the following files from the root directory of the project (relies on current working directory)

```
1-send-to-server-backend.ps1
2-send-to-server-frontend.ps1
```

On first run, these will error out because PM2 is not set up yet. Set up the web environment.

```
pm2 start /var/www/frontend/frontend.js -i 6 --name "Frontend"
pm2 start /var/www/backend/bin/www -i 8 --name "Backend"
```

## Built With

* [Mongodb](https://www.mongodb.com/) - The database
* [Express](https://expressjs.com/) - The backend web application framework
* [React](https://react.dev/) - The frontend web library
* [NodeJS/NPM](https://nodejs.org/en/download/current) - JavaScript runtime + package manager

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/kymotsujason/mern-stack-template/tags). 

## Authors

* **Jason Yue** - *Initial work* - [kymotsujason](https://github.com/kymotsujason)

See also the list of [contributors](https://github.com/kymotsujason/mern-stack-template/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Motivation to not have to set this stuff up again


# MiniTwitter

This is a sample app, designed to allow you to play with a simple JSON API!

## Setup

1. [Install Docker](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)

    ```shell
    $ sudo apt-get update
    $ sudo apt-get install ca-certificates curl gnupg lsb-release
    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    $ echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    $ sudo apt-get update
    $ sudo apt-get install docker-ce docker-ce-cli containerd.io
    ```

2. [Install Docker Compose](https://docs.docker.com/compose/install/#install-compose)

    ```shell
    $ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    $ sudo chmod +x /usr/local/bin/docker-compose
    ```

3. Test the installation

    ```shell
    $ docker-compose --version
    ```

    The above command should print version of Docker Compose.

4. Clone this repository to your local machine

5. Run from root directory of this repo:

    ```shell
    $ sudo docker-compose run web mix ecto.migrate
    ```

## Running the app

Run from root directory of this repo:

```shell
$ sudo docker-compose up
```

Leave it in a terminal window for the time being (to stop the app, press `CTRL+C` and wait few seconds).

Open: http://localhost:4000/. You should see HTML page with tweets (at the beginning there will be no tweets).

## API

The page contains the main page that renders HTML with all the Tweets: http://localhost:4000/.

There is also JSON API with the following endpoints (you can fetch, create, update, delete tweets using that API):

```
GET     /api/tweets
GET     /api/tweets/:id
POST    /api/tweets
PATCH   /api/tweets/:id
PUT     /api/tweets/:id
DELETE  /api/tweets/:id
```

### Examples of API calls

#### Fetching all tweets

```shell
$ curl -X GET -H "Accept: application/json" http://localhost:4000/api/tweets
{"data":[]}
```

#### Creating a new tweet

```shell
$ curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" -d '{"tweet":{"author":"Jon","message":"Hey!"}}' http://localhost:4000/api/tweets
{"data":{"author":"Jon","id":"2ae773d1-6899-4738-9b4b-5783e91334d8","message":"Hey!"}}
```

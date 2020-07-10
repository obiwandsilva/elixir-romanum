# Romanum

Romanum is an Elixir application used for convertions between Roman and decimal numbers.

## Usage

After running the application (See the _Running_ section bellow), the app will ask for an input.

Romanum is smart enought to differ a decimal number from a Roman one after an input is given.

In case you input a valid decimal number, Romanum will print a message with its convertion to Roman. Example:

```
Starting Romanum...
Enter a valid Roman or decimal number or type 'exit' to quit:
10
10 -> X
```

In case you input a valid Roman number, Romanum will convert it to decimal. Example:

```
Starting Romanum...
Enter a valid Roman or decimal number or type 'exit' to quit:
MMCL
MMCL -> 2150
```

Romanum ignores empty spaces and is also case insensitive, so you can type Roman numbers like `xx   V` and it will still work. 

To exit the programm, type `exit`.


## Running

You can run the app by both building and executing it in your machine or by running inside a container.

**First of all**, clone the repo with `git clone https://github.com/obiwandsilva/elixir-romanum.git`

1) **In your machine**

Requirements: _erlang_ and _elixir_ installed.

Inside the project directory run `MIX_ENV=prod mix release --force`

An executable will be generated inside the also created _build directory.

Run `_build/prod/rel/romanum/bin/romanum start` or execute the __.bat__ file if you are on a Windows environment.

A message will appear asking for your input.

2) **Using Docker**

Requirements: _docker_ installed.

Inside the project repo, run: `docker build -t wandsilva/romanum .`

This will build the image to be used by the container.

After the image building, run a container with an interactive tty with the command:

`docker container run --name romanum -ti wandsilva/romanum sh`

After running this, you will be logged in a shell terminal inside the container.

Run the command `romanum`  and this will start the appication.

A message will appear asking for your input.

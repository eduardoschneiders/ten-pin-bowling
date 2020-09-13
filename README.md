# Ten-pin bowling

[https://en.wikipedia.org/wiki/Ten-pin_bowling](https://en.wikipedia.org/wiki/Ten-pin_bowling)

## Running the project

The project was build with docker, but the tool is not mandatory to run the project. You can choose to run the project
on your native machine libraries or docker.

---

## **With Docker:**

### Building project
`docker build . -t ten-pin-bowling`

### Running the specs
`docker run ten-pin-bowling rspec`

### Running the game
`docker run -i ten-pin-bowling < some_input_file`

Obs.: It was included tree game input examples, so you can run them as follows:

`docker run -i ten-pin-bowling < game_input_example.txt`

`docker run -i ten-pin-bowling < game_input_example_2.txt`

`docker run -i ten-pin-bowling < game_input_example_3.txt`

### Running in the development mode
`docker run -v $(pwd):/app -it --rm --name running-ten-pin-bowling ten-pin-bowling`

---

## **With Native Machine:**

### Building project
`bundle install`

### Running the specs
`rspec`

### Running the game
`ruby game_runner.rb < some_input_file`

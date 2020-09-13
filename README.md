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

Obs.: It was included three game input file examples, so you can run them as follows:

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

---

## Output example:

```
Frame           1               2               3               4               5               6               7               8               9               10
Jeff
Pinfalls                X       7       /       9       0               X       0       8       8       /       F       6               X               X       X       8       1
Score           20              39              48              66              74              84              90              120             148             167
John
Pinfalls        3       /       6       3               X       8       1               X               X       9       0       7       /       4       4       X       9       0
Score           16              25              44              53              82              101             110             124             132             151
```

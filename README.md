# Building project
`docker build . -t ten-pin-bowling`

# Running the specs
`docker run -it --rm --name running-ten-pin-bowling ten-pin-bowling rspec`

# Running the game
`docker run -it --rm --name running-ten-pin-bowling ten-pin-bowling`

# Running in the development mode
`docker run -v $(pwd):/app -it --rm --name running-ten-pin-bowling ten-pin-bowling`

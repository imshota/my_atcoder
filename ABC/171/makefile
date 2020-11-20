CXX=g++
CXX_FLAGS= -std=c++17

CPP_FILES := $(wildcard *.cpp)

EXE := $(CPP_FILES:%.cpp=%.out)

.PHONY: all clean

all: $(EXE)

./%.out : %.cpp
		$(CXX) -o $@ $<

clean:
		rm -rf $(EXE)

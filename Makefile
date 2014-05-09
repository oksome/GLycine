
all: run/glfw_test.so run/model.so

run/glfw_test.so: pyx/glfw_test.pyx
	python setup.py build_ext
	cp build/lib.*/glfw_test.*.so ./run/glfw_test.so

run/model.so: pyx/model.pyx
	python setup.py build_ext
	cp build/lib.*/model.*.so ./run/model.so

clean:
	rm -fr build/*
	rm -fr run/*.so
	rm pyx/glfw_test.c
	rm pyx/model.c


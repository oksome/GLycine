
all: run/glfw_test.so
	
run/glfw_test.so: pyx/glfw_test.pyx
	python setup.py build_ext
	cp build/lib.macosx-10.8-x86_64-3.4/glfw_test.so ./run/

run/model.so: pyx/model.pyx
	python setup.py build_ext
	cp build/lib.macosx-10.8-x86_64-2.7/model.so ./run/

clean:
	rm -fr build/*
	rm -fr run/*.so
	rm pyx/glfw_test.c


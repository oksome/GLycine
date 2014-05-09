cdef extern from "glfw_include.h":
    enum:
        GLFW_SAMPLES
    cdef int glfwInit()
    cdef void glfwWindowHint(int target, int hint)

cdef do():
    glfwInit()
    glfwWindowHint(GLFW_SAMPLES , 4)


def run():
    do()

cdef extern from "glew_include.h":
    ctypedef unsigned int GLenum
    ctypedef float GLclampf
    GLenum glewInit()
    enum:
        GLEW_OK
        GL_TRUE
    void glClearColor(GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha)


cdef extern from "glfw_include.h":
    enum:
        GLFW_SAMPLES
        GLFW_CONTEXT_VERSION_MAJOR
        GLFW_CONTEXT_VERSION_MINOR
        GLFW_STICKY_KEYS
        GLFW_KEY_ESCAPE
        GLFW_PRESS
    ctypedef void* GLFWwindow
    ctypedef void* GLFWmonitor

    cdef int glfwInit()
    cdef void glfwWindowHint(int target, int hint)
    cdef GLFWwindow * glfwCreateWindow(
        int width, int height,
        const char * title,
        GLFWmonitor * monitor,
        GLFWwindow * share
    )
    cdef void glfwTerminate()
    cdef void glfwMakeContextCurrent(GLFWwindow window)
    cdef void glfwSetInputMode(GLFWwindow window, int mode, int value)
    cdef void glfwPollEvents()
    cdef int glfwGetKey(GLFWwindow window, int key)
    cdef int glfwWindowShouldClose(GLFWwindow window)
    cdef void glfwSwapBuffers(GLFWwindow window)


cdef do():
    glfwInit()
    glfwWindowHint(GLFW_SAMPLES, 4);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);

    window = glfwCreateWindow(1024, 768, "Tutorial 01", NULL, NULL)
    if(window == NULL):
        print("Failed to open GLFW window.")
        glfwTerminate()
        return -1
    glfwMakeContextCurrent(window);

    # Initialize GLEW
    if (glewInit() != GLEW_OK):
        print("Failed to initialize GLEW")
        return -1

    # Ensure we can capture the escape key being pressed below
    glfwSetInputMode(window, GLFW_STICKY_KEYS, GL_TRUE);

    # Dark blue background
    glClearColor(0.0, 0.0, 0.4, 0.0);

    # HACK !
    import model
    o = model.Object()

    glfwPollEvents();
    # Check if the ESC key was pressed or the window was closed
    while glfwGetKey(window, GLFW_KEY_ESCAPE) != GLFW_PRESS \
    and glfwWindowShouldClose(window) == 0:

        # Draw nothing, see you in tutorial 2 !

        o.draw()

        # Swap buffers
        glfwSwapBuffers(window)
        glfwPollEvents()

    # Close OpenGL window and terminate GLFW
    glfwTerminate()

    return 0


def run():
    do()

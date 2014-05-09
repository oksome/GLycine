from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass={'build_ext': build_ext},
    ext_modules=[
        Extension("model", ["pyx/model.pyx"]),
        Extension('glfw_test', ['pyx/glfw_test.pyx'],
            #libraries=['glfw', 'glew'],
            libraries=['glfw'],
            #extra_compile_args=['-I/usr/local/include/GLFW'],
            extra_compile_args=['/usr/lib/x86_64-linux-gnu/'],
            #extra_link_args=['-L/usr/local/lib'],
            )
        ],
)

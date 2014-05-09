from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
    cmdclass={'build_ext': build_ext},
    ext_modules=[
        Extension("model", ["pyx/model.pyx"]),
        Extension('glfw_test', ['pyx/glfw_test.pyx'],
            include_dirs=['pyx'],
            libraries=['glfw3', 'glew'],
            )
        ],
)

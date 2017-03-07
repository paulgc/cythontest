from distutils.core import setup, Extension
from Cython.Build import cythonize

setup(ext_modules = cythonize([
#    Extension("string_vector", sources=["string_vector.pyx"], language="c++",
#              extra_compile_args = ["-O3", "-ffast-math", "-march=native", "-fopenmp"],
#              extra_link_args=['-fopenmp']),
    Extension("test", sources=["test.pyx", "string_vector.cpp"], language="c++",   
              extra_compile_args = ["-O3", "-ffast-math", "-march=native", "-fopenmp"],
              extra_link_args=['-fopenmp']), 
 ]))


from libcpp.vector cimport vector                                               
from libcpp.string cimport string                                             


cdef extern from "string_vector.h" nogil:                                      
    cdef cppclass StringVector nogil:                                          
        StringVector()                                                         
        void set_fields(vector[string]&)                  
        vector[string] str_vec
'''
cdef class StringVector:                                           
    cdef void set_fields(self, vector[string]&)                                        
    cdef vector[string] str_vec
'''                 

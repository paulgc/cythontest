
from libcpp.vector cimport vector
from libcpp.string cimport string
from string_vector cimport StringVector
from cython.parallel import prange                                              
from libcpp.set cimport set as oset                                             

cdef extern from "string.h" nogil:                                              
    char *strtok (char *inp_str, const char *delimiters)  

cdef void convert_to_vector(string_col, vector[string]& string_vector, StringVector& tmp):        
    for val in string_col:                                                      
        string_vector.push_back(str(val)) 

cdef vector[string] tokenize(const string& inp_string) nogil:         
    cdef char* pch                                                          
    pch = strtok (<char*> inp_string.c_str(), " ")                          
    cdef oset[string] tokens                                                
    cdef vector[string] out_tokens                                          
    while pch != NULL:                                                  
        tokens.insert(string(pch))                                      
        pch = strtok (NULL, " ")                                        
    for s in tokens:                                                    
        out_tokens.push_back(s)                                         
    return out_tokens    

def foo1(s):
    print tokenize(str(s))

def foo(df, col_name):
    cdef StringVector sv
    cdef vector[string] tmp_sv
    convert_to_vector(df[col_name], tmp_sv, sv)
    sv.set_fields(tmp_sv)
    cdef int j, n=sv.str_vec.size()
    cdef vector[vector[string]] tokens

    for j in xrange(n):
        tokens.push_back(vector[string]())
    for j in prange(n, nogil=True, num_threads=4):                    
        tokens[j] = tokenize(sv.str_vec[j])
    
    print tokens[0]
####


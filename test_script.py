import pandas as pd

df=pd.DataFrame([{'name':'k v pradap'}, {'name':'adel ardalan'}, {'name':'han li'}, {'name':'paul suganthan g c'}])

from cythontest.test import foo
foo(df, 'name')

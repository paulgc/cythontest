#include <string>
#include <vector>

class StringVector {
  public:
    std::vector<std::string> str_vec;                                       

    StringVector();
    ~StringVector();
    void set_fields(std::vector<std::string>&);  
};

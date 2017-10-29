#include <iostream>
#include <algorithm>
#include <string>
#include <ctype.h>
#include <unordered_map>
using namespace std;

void insert(unordered_map<string, int> &map1, string word) {
    if(map1.find(word) != map1.end())
        map1[word]++;
    else
        map1.insert(unordered_map<string,int>::value_type(word,1));
}

int main(int argc, char** argv) {
    char letter;
    string str;
    unordered_map<string, int> theOriginalMap;


    while (cin.get(letter)) {
        if (isspace(letter) || letter == ',' || letter == '.') {
            if (str.length() != 0) {
                insert(theOriginalMap, str);
            }
            str = "";
        } else if (isalpha(letter)) {
            str += tolower(letter);
        }
    }

    for (auto& x: theOriginalMap) {
        std::cout << x.first << ": " << x.second << std::endl;
    }
}

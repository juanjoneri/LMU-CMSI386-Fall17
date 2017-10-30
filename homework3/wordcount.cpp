#include <iostream>
#include <algorithm>
#include <string>
#include <ctype.h>
#include <unordered_map>
using namespace std;

// Inserts a new word in a map, to keep track of the occurences of that word
void insert(unordered_map<string, int> &destination_map, string word) {
    if (destination_map.find(word) != destination_map.end()) {
        destination_map[word]++;
    } else {
        destination_map.insert(unordered_map<string,int>::value_type(word, 1));
    }
}

int main(int argc, char** argv) {
    char letter;
    string word;
    unordered_map<string, int> word_record;


    while (cin.get(letter)) {
        if (isspace(letter) || letter == ',' || letter == '.') {
            if (word.length() != 0) {
                insert(word_record, word);
            }
            word = "";
        } else if (isalpha(letter)) {
            word += tolower(letter);
        } else {
            // In the case that the character is a nuber or other symbol, we just ignore it
        }
    }

    for (auto& record: word_record) {
        cout << record.first << " " << record.second << endl;
    }
}

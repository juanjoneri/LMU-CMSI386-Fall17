#include <iostream>
#include <algorithm>
#include <string>
#include <ctype.h>
#include <map>
#include <set>

using namespace std;

// Inserts a new word in a map, to keep track of the occurences of that word
void insert(map<string, int> &destination_map, string word) {
    if (destination_map.find(word) != destination_map.end()) {
        destination_map[word]++;
    } else {
        destination_map.insert(map<string,int>::value_type(word, 1));
    }
}

template<typename A, typename B>
pair<B,A> flip_pair(const pair<A,B> &p) {
    return pair<B,A>(p.second, p.first);
}

template<typename A, typename B>
multimap<B,A> flip_map(const map<A,B> &src) {
    multimap<B,A> dst;
    transform(src.begin(), src.end(), inserter(dst, dst.begin()),
    flip_pair<A,B>);
    return dst;
}

int main(int argc, char** argv) {
    char letter;
    string word;
    map<string, int> word_record;


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


    multimap<int, string> dst = flip_map(word_record);

    for (auto& record: dst) {
        cout << record.second << " " << record.first << endl;
    }

}

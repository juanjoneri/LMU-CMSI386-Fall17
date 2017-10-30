#include <iostream>
#include <algorithm>
#include <string>
#include <ctype.h>
#include <map>
#include <set>

using namespace std;

// Inserts a new word in a map, to keep track of the occurences of that word
// <key = word, value = word_count>
void insert(map<string, int> &destination_map, string word) {
    if (destination_map.find(word) != destination_map.end()) {
        destination_map[word]++;
    } else {
        destination_map.insert(map<string,int>::value_type(word, 1));
    }
}

// returns a new pair with the values of p swaped
template<typename A, typename B>
pair<B,A> flip_pair(const pair<A,B> &p) {
    return pair<B,A>(p.second, p.first);
}

// returns a new map destination_map with the key, values pairs of source_map swaped
template<typename A, typename B>
multimap<B,A> flip_map(const map<A,B> &source_map) {
    multimap<B,A> destination_map;
    transform(source_map.begin(), source_map.end(), inserter(destination_map, destination_map.begin()),
    flip_pair<A,B>);
    return destination_map;
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
            // If character is a nuber or other symbol, we just ignore it
        }
    }


    // copy contents of the map into new map in reverse
    // since map sorts by key (occurences)
    multimap<int, string> ordered_records = flip_map(word_record);

    for (auto& record: ordered_records) {
        cout << record.second << " " << record.first << endl;
    }

}

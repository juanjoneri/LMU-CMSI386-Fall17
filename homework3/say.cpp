#include <cassert>
#include <string>
#include <iostream>

using namespace std;

class Say {
    string phrase;

    public:
        Say(string first_word): phrase(first_word) {}
        string operator()(string new_word) {
            // string add_word = [](string new_word){
            //     phrase += new_word;
            //     return phrase
            // };
            // return add_word;
            phrase += new_word;
            return phrase;
        }
};

int main() {
  Say say("first");
  cout << say("things") << endl;

  // assert(say('hi')() == 'hi');
  // assert(say('hi')('there')() == 'hi there');
  // assert(say('hello')('my')('name')('is')('Colette')() == 'hello my name is Colette');
}

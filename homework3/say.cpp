#include <cassert>
#include <string>
#include <iostream>

using namespace std;

class Say {
    string phrase;

    public:
        Say(string first_word): phrase(first_word = "") {}
        auto operator()(string new_word = "") {
            // if (new_word == "") {
            //     return phrase;
            // }

            return [&](string new_word = "") {
                Say::phrase += ' ';
                Say::phrase += new_word;
                return Say::phrase;
            };
        }
};

int main() {
  Say say("first");
  cout << say("hi")("to") << endl;

  // assert(say('hi')() == 'hi');
  // assert(say('hi')('there')() == 'hi there');
  // assert(say('hello')('my')('name')('is')('Colette')() == 'hello my name is Colette');
}

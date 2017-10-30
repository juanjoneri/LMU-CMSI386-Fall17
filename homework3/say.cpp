#include <cassert>
#include <string>
#include <iostream>

using namespace std;

class Say {
    string phrase;

    public:
        Say(string first_word): phrase(first_word = "") {}
        auto operator()(string new_word) {
            phrase += new_word;
            cout << phrase << endl;
            Say say(phrase);
            return say;
        }
        auto operator()() {
            return phrase;
        }
};

int main() {
  Say say("first");
  cout << say("hi")("there")() << endl;

  // assert(say('hi')() == 'hi');
  // assert(say('hi')('there')() == 'hi there');
  // assert(say('hello')('my')('name')('is')('Colette')() == 'hello my name is Colette');
}

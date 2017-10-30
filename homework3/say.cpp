#include <cassert>
#include <string>
#include <iostream>

using namespace std;

class Say {
    string phrase;

    public:
        Say(string first_word=""): phrase(first_word) {}
        auto operator()(string new_word) {
            phrase += ' ';
            phrase += new_word;
            Say say_more(phrase);
            return say_more;
        }
        auto operator()() {
            // overload with the case that no param was passed should end call chain
            return phrase;
        }
};

int main() {
  Say say;
  cout << say("hi")("there")() << endl;

  // assert(say('hi')() == 'hi');
  // assert(say('hi')('there')() == 'hi there');
  // assert(say('hello')('my')('name')('is')('Colette')() == 'hello my name is Colette');
}

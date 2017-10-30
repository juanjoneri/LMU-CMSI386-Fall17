#include <cassert>
#include <string>
#include <iostream>

using namespace std;

class Say {
    string phrase;
    string first_word;

    public:
        Say(string first_word=""): phrase(first_word), first_word(first_word) {}
        auto operator()(string new_word) {
            if (phrase != "") phrase += ' ';
            phrase += new_word;
            Say say_more(phrase);
            phrase = first_word; // reset the original for future use
            return say_more;
        }
        auto operator()() {
            // overload with the case that no param was passed should end call chain
            return phrase;
        }
};

int main() {
  Say say; // Say say("first_word")
  assert(say("hi")() == "hi");
  assert(say("hi")("there")() == "hi there");
  assert(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette");
}

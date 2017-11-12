#include <cassert>
#include <iostream>

using namespace std;

template <typename T>
class Stack {

  struct Node {
    T data;
    Node* next;
  };

  int size = 0;
  Node* top = nullptr;

  Node* copy(Node* n) {
    return new Node {n->data, n->next ? copy(n->next) : nullptr};
  }

public:

  ~Stack() {
    while (top != nullptr) {
      pop();
    }
  }

  Stack() = default;

  Stack(const Stack& s) = delete;
  Stack& operator=(const Stack& s) = delete;

  Stack(Stack&& s): size(s.size), top(s.top) {
    s.top = nullptr;
    s.size = 0;
  }

  Stack& operator=(Stack&& s) {
    if (&s != this) {
      size = s.size;
      top = s.top;
      s.top = nullptr;
      s.size = 0;
    }
    return *this;
  }

  int get_size() {
    return size;
  }

  T get_top() {
    return top->data;
  }

  void push(T x) {
    top = new Node {x, top};
    size++;
  }

  T pop() {
    Node* nodeToDelete = top;
    T valueToReturn = top->data;
    top = top->next;
    size--;
    delete nodeToDelete;
    return valueToReturn;
  }
};

Stack<int> oneTwoThree() {
  Stack<int> z;
  z.push(3);
  z.push(2);
  z.push(1);
  return z;
}

int main() {
  Stack<int> s;
  assert(s.get_size() == 0);
  s.push(100);
  assert(s.get_top() == 100);
  assert(s.get_size() == 1);
  s.push(200);
  assert(s.get_top() == 200);
  assert(s.get_size() == 2);
  assert(s.pop() == 200);
  assert(s.get_size() == 1);
  assert(s.pop() == 100);
  assert(s.get_size() == 0);
  s.push(300);
  s.push(400);

  Stack<int> t = oneTwoThree();

  t = oneTwoThree();

  s.pop();
  cout << "All tests passed\n";
}

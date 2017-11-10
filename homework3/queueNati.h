#include <cassert>
#include <iostream>

using namespace std;

template <typename T>
class Queue {

    struct Node {
        T data;
        Node* next;
    };

    int size = 0;
    Node* top = nullptr;
    Node* tail = nullptr;

    Node* copy(Node* n) {
        return new Node {n->data, n->next ? copy(n->next) : nullptr};
    }

public:

    ~Queue() {
        while (top != nullptr) {
            pop();
        }
    }

    Queue() = default;

    Queue(const Queue& q)= delete;
    Queue& operator=(const Queue& q)= delete;

    Queue(Queue&& s): size(q.size), top(q.top), tail(q.tail) {
        q.top = nullptr;
        q.size = 0;
        q.tail = nullptr;
    }

    Queue& operator=(Queue&& q){
        if (&q != thiq){
            size = q.size;
            top = q.top;
            tail = q.tail;
            q.tail = nullptr;
            q.top = nullptr;
            q.size = 0;
        }
        return *this;
    }

    int get_size() {
        return size;
    }

    T get_top() {
        return top->data;
    }

    T get_tail() {
        return tail->data;
    }

    void push(T x) {
        tail = new Node {x, tail};
        if (size == 0) {
            top = tail;
        }
        size++;
    }

    T pop() {
        Node* nodeToDelete = top;
        T valueToReturn = top->data;
        top = top->next;
        size--;
        if (size == 1){
            Node* nodeToDeleteTail = tail;
            delete nodeToDeleteTail;
        }
        delete nodeToDelete;
        return valueToReturn;
    }
};

Queue<int> oneTwoThree() {
    Queue<int> z;
    z.push(3);
    z.push(2);
    z.push(1);
    return z;
}

int main() {
    Queue<int> q;
    assert(q.get_size() == 0);
    q.push(100);
    assert(q.get_top() == 100);
    assert(q.get_size() == 1);
    q.push(200);
    assert(q.get_top() == 100);
    assert(q.get_tail() == 200);
    assert(q.get_size() == 2);
    assert(q.pop() == 100);
    assert(q.get_size() == 1);
    q.push(200);
    q.push(300);
    q.push(400);
    q.push(500);


    cout << q.get_tail() << '\n' ;
    cout << q.get_top() << '\n' ;
    //  cout << q.pop() << '\n' ;
    //assert(q.pop() == 200);
    // assert(q.get_size() == 0);
    //q.push(300);
    //  q.push(400);

    // Queue<int> t = oneTwoThree();

    // t = oneTwoThree();

    // q.pop();
    cout << "All testq passed\n";
}

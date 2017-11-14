#include <cassert>
#include <iostream>

using namespace std;

// DRAWING
/*
 Size = 4
[Head] -> [] -> [] -> [Tail] -> new elements...
*/


template <typename T>
class Queue {

    struct Node {
        T data;
        Node* next;
    };

    int size = 0;
    Node* head = nullptr; //first item added (to remove)
    Node* tail = nullptr; //last item added  (last to remove)

    Node* copy(Node* n) {
        return new Node {n->data, n->next ? copy(n->next) : nullptr};
    }

public:

    ~Queue() {
        while (size != 0) {
            dequeue();
        }
    }

    Queue() = default;

    Queue(const Queue& q)= delete;            //prohibit copying
    Queue& operator=(const Queue& q)= delete; //prohibit copying

    Queue(Queue&& q): size(q.size), head(q.head), tail(q.tail) {
        q.head = nullptr;
        q.tail = nullptr;
        q.size = 0;
    }

    // move operator when source is and r-value
    Queue& operator=(Queue&& q) {
      if (&q != this) {
        size = q.size;
        head = q.head;
        tail = q.tail;
        q.head = nullptr;
        q.tail = nullptr;
        q.size = 0;
      }
      return *this;
    }

    int get_size() {
        return size;
    }

    T get_head() {
        return head->data;
    }

    T get_tail() {
        return tail->data;
    }

    void enqueue(T x) {
        Node* newTail = new Node {x, nullptr};
        if (size == 0) {
            tail = newTail;
            head = newTail;
        } else {
            tail -> next = newTail;
            tail = newTail;
        }
        size++;

    }

    T dequeue() {
        if (size == 0) throw std::underflow_error("This q is empty dude.");
        Node* nodeToDelete = head;
        T valueToReturn = head->data;
        head = head->next;
        size--;

        delete nodeToDelete;
        if (size == 0) tail = nullptr;
        return valueToReturn;
    }
};

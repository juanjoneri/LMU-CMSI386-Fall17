/*
 * Write, in the file queue.h, an implementation of a generic singly-linked queue (template) class, implemented using nodes and   *pointers.
 * The queue object should have three fields:
 *  (1) a pointer to the head node
 *  (2) a pointer to the tail node
 *  (3) the current size of the queue (its number of elements).
 * You may use smart pointers or raw pointers (whichever you would enjoy practicing with more). Support move semantics but   prohibit copying.
 * Expose public methods
 * - enqueue
 * - dequeue
 * - get_size
 * Make sure queues can be written to ostreams with the << operator. Throw the standard exception underflow_error when trying to dequeue from an empty queue
 */
using namespace std;

class Queue {

private:
    class Node {
        public:
            int data;
            Node* next;
            Node* prev;

            Node(int data) : data(data) { };
    };
public:
    Node* head;
    Node* tail;

    Queue() { };

    Queue (int initial) : head(NULL), tail(NULL) {
        Node initial_node(initial);
        head = &initial_node;
        tail = &initial_node;
    }

    void enqueue(int data);
    void dequeue();
    int get_size();

    friend ostream &operator<<(ostream&, const Queue&);

};

ostream &operator<<(ostream& strm, const Queue& obj) {
    strm << 3 << endl;
    return strm;
}

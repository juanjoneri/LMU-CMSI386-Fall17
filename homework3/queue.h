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

 class Queue {
 public:
     // Member variables can be given default values in this manner.
     double x = 0;
     double y = 0;

     // Define a default constructor which does nothing
     // but initialize the Queue to the default value (0, 0)
     Queue() { };

     // The following syntax is known as an initialization list
     // and is the proper way to initialize class member values
     Queue (double a, double b) :
         x(a),
         y(b)
     { /* Do nothing except initialize the values */ }

     // Overload the + operator.
     Queue operator+(const Queue& rhs) const;

     // Overload the += operator
     Queue& operator+=(const Queue& rhs);

     // It would also make sense to add the - and -= operators,
     // but we will skip those for brevity.
 };

Queue Queue::operator+(const Queue& rhs) const
{
    // Create a new Queue that is the sum of this one and rhs.
    return Queue(x + rhs.x, y + rhs.y);
}

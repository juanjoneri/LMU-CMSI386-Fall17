# CMSI 386 - HW 3

1. (5 pts) Given the C++ declaration:

   ```c++
   struct {
     int n;   // 4bytes -> 4 x 8 bits
     char c;  // 1byte  -> 8 bits
   } A[10][10];
   ```

   On your machine, find the address of `A[0][0]`  and `A[3][7]` . Explain why these values are what you found them to be.

   output:

   ```sh
   0x1043040a0
   0x1043041c8
   ```

   These values correspond to 4365238432 and 4365238728 in decimal respectively, which are separated by 296 bits.

   (3 * 10  + 7) * 8 = 296.

   Each entry in the array represents an 8 bit pointer to the location of a struct. To access the location of the pointer in the 3,7 location, because c++ stores the elements of an array sequentially, this is equivalent to the array location 3*10+7 passed the first entry at A\[0][0] corresponding to memory address  (3 * 10  + 7) * 8 + A\[0][0].

2. (5 pts) Explain the meaning of the following C++ declarations:

   ```c++
   double *a[n];
   double (*b)[n];
   double (*c[n])();
   double (*d())[n];
   ```

3. Consider the following declaration in C++:

   ```c++
   double (*f(double (*)(double, double[]), double)) (double, ...);
   ```

   Describe rigorously, in English, the type of f.

4. What happens when we “redefine” a field in a C++ subclass? For example, suppose we have:

   ```c++
   class Base {
   public:
     int a;
     std::string b;
   };

   class Derived: Base {
   public:
     float c;
     int b;
   };
   ```

   Does the representation of a Derived object contain one b field or two? If two, are both accessible, or only one? Under what circumstances? Tell the story of how things are.

5. What does the following C++ program output?

   ```c++
   #include <iostream>
   int x = 2;
   void f() { std::cout << x << '\n'; }
   void g() { int x = 5; f(); std::cout << x << '\n'; }
   int main() {
     g();
     std::cout << x << '\n';
   }
   ```

   Verify that the answer you obtained is the same that would be inferred from apply the rules of static scoping. If C++ used dynamic scoping, what would the output have been?

6. Suppose you were asked to write a function to scramble (shuffle) a given array, in a mutable fashion. Give the function signature for a shuffle function for (a) a raw array, and (b) a std::array.

   ​


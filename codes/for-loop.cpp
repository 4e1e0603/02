// Example: Loop
//
// The examples shows that a variable declared in for cycle has a
// visibility only inside the `{ ... }` block.
//
// Expect: Compile error.
//
#include <iostream>

int main() {

    for (auto i = 0; i<10; ++i) {
        std::cout << i << std::endl;
    }

    for (auto i = 0; i<10; ++i) {
        std::cout << i << std::endl;
    }

    // Error: Scope of `i` is only in the block `{...}`.
    std::cout << i << std::endl;
}
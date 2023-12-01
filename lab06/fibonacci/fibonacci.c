int fibonacci(int n) {
    int i, fib, f1 = 0, f2 = 0;

    for (i = 0; i < n; i++) {
        if (i == 0) {
            fib = 0;
        } else if (i == 1) {
            fib = 1;
        } else {
            fib = f1 + f2;
        }
        f2 = f1;
        f1 = fib;
    }
    return fib;
}


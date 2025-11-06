<<__EntryPoint>>
function main(): void {
  print("Hello, World!\n");
  print("Fibonacci of 10 is " . fibonacci(10));
  exit(0);
}

function fibonacci(int $n): int {
  if ($n <= 1) {
    return $n;
  }

  return fibonacci($n - 1) + fibonacci($n - 2);
}
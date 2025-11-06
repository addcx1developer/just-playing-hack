<<__EntryPoint>>
function main(): void {
  print("Hello, World!\n");
  
  $n = (int) (vec(\HH\global_get('argv') as Container<_>)[1] ?? 10);
  echo 'The ' . $n . ' number in fibonacci is: ' . fibonacci($n) . PHP_EOL;
  
  exit(0);
}

function fibonacci(int $n): int {
  if ($n <= 1) {
    return $n;
  }

  return fibonacci($n - 1) + fibonacci($n - 2);
}
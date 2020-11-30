bool isPerfectSquare(int n) {
  for (int i = 1; i * i <= n; i++) {
    if ((n % i == 0) && (n / i == i)) {
      return true;
    }
  }
  return false;
}

bool isTriangular(int num) {
  if (num < 0) {
    return false;
  }
  return isPerfectSquare(8 * num + 1);
}

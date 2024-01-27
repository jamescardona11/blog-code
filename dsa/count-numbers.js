function numberSum(n) {
  let total = 0;
  for (let i = 1; i <= n; i++) {
    total += i;
  }
  return total;
}

// let t1 = performance.now();
// numberSum(10000000000);
// let t2 = performance.now();

// console.log(`Time: ${t2 - t1} ms`);

function numberSum2(n) {
  return (n * (n + 1)) / 2;
}

let t3 = performance.now();
numberSum2(10);
let t4 = performance.now();

console.log(`Time: ${t4 - t3} ms`);

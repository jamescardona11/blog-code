class MyHashTable {
  constructor(size) {
    this.data = new Array(size);
  }

  _hash(key) {
    let hash = 0;
    for (let i = 0; i < key.length; i++) {
      hash = (hash + key.charCodeAt(i) * i) % this.data.length;
    }
    return hash;
  }

  set(key, value) {
    if (key == null) return;

    const address = this._hash(key);
    if (!this.data[address]) {
      this.data[address] = [];
    }

    this.data.push([key, value]);
  }

  get(key) {
    const address = this._hash(key);
    const cb = this.data[address];

    if (cb) {
      for (let i = 0; i < cb.length; i++) {
        if (cb[i][0] === key) {
          return cb[i][1];
        }
      }
    }

    return undefined;
  }

  keys() {
    if (!this.data.length) {
      return undefined;
    }
    let result = [];
    // loop through all the elements
    for (let i = 0; i < this.data.length; i++) {
      // if it's not an empty memory cell
      if (this.data[i] && this.data[i].length) {
        // but also loop through all the potential collisions
        if (this.data.length > 1) {
          for (let j = 0; j < this.data[i].length; j++) {
            result.push(this.data[i][j][0]);
          }
        } else {
          result.push(this.data[i][0]);
        }
      }
    }
    return result;
  }
}

const myHashTable = new MyHashTable(10);
myHashTable.set('cherry', 900);
myHashTable.set('grapes', 10000);
myHashTable.set('grapes', 10000);
myHashTable.set('apples', 9);

for (let i = 0; i < myHashTable.data.length; i++) {
  console.log(myHashTable.data[i]);
}

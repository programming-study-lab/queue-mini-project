String test(){
  String t = 'game';
  Queue q = Queue();
  bool a = q.isEmpty();
  print (a);


  return "";
}

class Queue {
  int max = 5;
  List<dynamic> data = [];
  int front = -1;
  int rear = -1;
  int count =0;

  // Queue(){
  //   this.max = 5;
  //   this.data = [];
  //   this.front = -1;
  //   this.rear = -1;
  // }

  bool isEmpty() {
    return (this.rear == -1) || (this.front == -1);
  }

  bool isFull(dynamic data) {
    return this.rear == (this.rear, data);
  }

  void enqueue(String d) {
    print('---------------${d.runtimeType}: ${d}');

    if (this.rear < (this.max - 1)) {
      this.rear++;
      print("Front enq: ${this.front}");
      this.data.insert(this.rear, d);
      if (this.front == -1) {
        this.front = 0;
        print('Front enq: ${this.front}');
      }
      // return true;
    }
    // return false;
  }

  String dequeue(){
    print("Start Front: ${this.front}");
    String queue = "คิวว่าง";
    if (this.front != -1) {
      print("VS Front: ${this.front}");
      print("VS Rear: ${this.rear}");

      if (this.front > this.rear) {
        this.front = -1;
        this.rear = -1;
        queue = "คิวว่าง";
      } else {
        queue = this.data[this.front].toString();
        print(queue);
        this.front++;
        print("DeQ Front: ${this.front}");
      }
    }
    print("End Front: ${this.front}");
    return queue;
  }

  String peek() {
    if (this.isEmpty()) {
      return "คิวว่าง";
    } else {
      return this.data[this.rear].toString();
    }
  }

  List peekAll() {
    print("PeeKAll: ${this.data.length}");
    if (this.isEmpty()) {
      return this.data;
    } else {
      int index = this.front;
      if(index > this.rear) {
        print ("คิวว่าง");
      } else {
       return this.data;
      }
    }
    return this.data;
  }

  // String display() {
  //
  //   if (isEmpty())
  //   return
  // }

int getFront(){
    return this.front;
}


}

// int c = 0;
//
// void numTest(){
//   c++;
//   print(c);
// }
//
// void reCount() {
//   c = 0;
// }
//
// int outNum() {
//   print(c);
//   for (int i = 0; i < 10; i++) {
//     return c++;
//   }
//   return c;
// }
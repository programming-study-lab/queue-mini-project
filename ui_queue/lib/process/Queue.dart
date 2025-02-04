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

  Queue(){
    this.max = 5;
    this.data = [];
    this.front = -1;
    this.rear = -1;
  }

  bool isEmpty() {
    return this.rear == -1 || this.front == -1;
  }

  bool isFull(dynamic data) {
    return this.rear == (this.rear, data);
  }

  bool enqueue(String d) {
    print('${d.runtimeType}: ${d}');

    if (this.rear < (this.max - 1)) {
      this.rear++;
      print(this.rear);
      this.data.insert(this.rear, d);
      // print('Queue${this.queue(this.rear)}');
      if (this.front == -1) {
        this.front = 0;
        print(this.front);
      }
      return true;
    }
    return false;
  }

  String dequeue(){
    String queue = "";
    if (this.front != -1) {
      if (this.front > this.rear) {
        this.front = -1;
        this.rear = -1;
        queue = "ไม่มีคิว";
      } else {
        queue = this.data[this.front].toString();
        print(queue);
        this.front++;
      }
    }
    return queue;
  }

  String peek() {

    // this.data = [1,2,3,4,5];
    // this.data.toString();
    if (this.isEmpty()) {
      return "คิวว่าง";
    } else {
      return this.data[this.rear].toString();
    }
  }

  String peekAll() {
    if (this.isEmpty()) {
      return "คิวว่าง";
    } else {
      int index = this.front;
      if(index > this.rear) {
        print ("คิวว่าง");
      } else {
        while (index <= this.rear) {
          return this.data.toString();
          index += 1;
        }
      }
    }
    return "";
  }

  // String display() {
  //
  //   if (isEmpty())
  //   return
  // }


  void numTest() {
    this.count += 1;
  }
  void reCount() {
    this.count = 0;
  }

  int outNum() {
    return this.count;
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
class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;

  // Method insert data di binary tree
  void insertData(T newValue) {
    Node<T> newNode = Node(newValue);
    if (root == null) {
      root = newNode;
      return;
    } else {
      insertBasedOrderLevel(root!, newNode);
    }
  }

  bool insertBasedOrderLevel(Node<T> current, Node<T> newNode) {
    if (current.left == null) {
      current.left = newNode;
      return true;
    }
    if (current.right == null) {
      current.right = newNode;
      return true;
    }

    // Jika kiri dan kanan penuh, coba ke subtree kiri dulu
    return insertBasedOrderLevel(current.left!, newNode) ||
        insertBasedOrderLevel(current.right!, newNode); 
  }

  void printPreOrder(Node<T>? node) {
    if (node != null) {
      print("${node.nodeValue} "); // N
      printPreOrder(node.left);   // L
      printPreOrder(node.right);  // R
    }
  }

  void printInOrder(Node<T>? node) {
    if (node != null) {
      printInOrder(node.left);    // L
      print("${node.nodeValue} "); // N
      printInOrder(node.right);   // R
    }
  }

  void printPostOrder(Node<T>? node) {
    if (node != null) {
      printPostOrder(node.left);  // L
      printPostOrder(node.right); // R
      print("${node.nodeValue} "); // N
    }
  }
}

void main() {
  BinaryTree<int> btree = BinaryTree();
  
  btree.insertData(1);
  btree.insertData(2);
  btree.insertData(3);
  btree.insertData(4);
  btree.insertData(5);
  btree.insertData(6);

  print("Pre Order Traversal Binary Tree: ");
  btree.printPreOrder(btree.root);

  print("");
  print("In Order Traversal Binary Tree: ");
  btree.printInOrder(btree.root);

  print("");
  print("Post Order Traversal Binary Tree: ");
  btree.printPostOrder(btree.root);
}
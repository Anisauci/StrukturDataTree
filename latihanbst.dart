class Node {
  int data;
  Node? left, right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  // Menambahkan node baru ke BST
  void insert(int value) {
    root = _insertRec(root, value);
  }

  Node _insertRec(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }

    if (value < node.data) {
      node.left = _insertRec(node.left, value);
    } else if (value > node.data) {
      node.right = _insertRec(node.right, value);
    }
    return node;
  }

  // Method untuk mendapatkan nilai terkecil (first)
  int? first() {
    if (root == null) return null;
    Node current = root!;
    while (current.left != null) {
      current = current.left!;
    }
    return current.data;
  }

  // Method untuk mendapatkan nilai terbesar (last)
  int? last() {
    if (root == null) return null;
    Node current = root!;
    while (current.right != null) {
      current = current.right!;
    }
    return current.data;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(80);

  print('Nilai terkecil (first): ${bst.first()}');
  print('Nilai terbesar (last): ${bst.last()}');
}

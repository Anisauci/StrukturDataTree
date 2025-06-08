class Node<T> {
  T nodeValue;
  Node<T>? left, right;

  Node(this.nodeValue);
}

class BinaryTree<T> {
  Node<T>? root;
}

void PrintPreOrder(Node? node) {
  if (node != null) {
    print("${node.nodeValue} "); // N
    PrintPreOrder(node.left);   // L
    PrintPreOrder(node.right);  // R
  }
}

void PrintInOrder(Node? node) {
  if (node != null) {
    PrintInOrder(node.left);    // L
    print("${node.nodeValue} "); // N
    PrintInOrder(node.right);   // R
  }
}

void PrintPostOrder(Node? node) {
  if (node != null) {
    PrintPostOrder(node.left);  // L
    PrintPostOrder(node.right); // R
    print("${node.nodeValue} "); // N
  }
}

void main() {
  BinaryTree<int> BTree = BinaryTree();
  BTree.root = Node(1);
  BTree.root!.left = Node(2);
  BTree.root!.right = Node(4);

  print("Pre-Order Traversal Binary Tree: ");
  PrintPreOrder(BTree.root); // NLR

  print("\nIn-Order Traversal Binary Tree: ");
  PrintInOrder(BTree.root); // LNR

  print("\nPost-Order Traversal Binary Tree: ");
  PrintPostOrder(BTree.root); // LRN
}
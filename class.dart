import 'dart:io';

class Node<T> {
  T value;
  Node<T>? left;
  Node<T>? right;

  Node(this.value) : left = null, right = null;
}

class BinaryTree<T> {
  Node<T>? root; 

  BinaryTree() {
    root = null;
  }

  void printPostorder(Node<T>? node) {
      if (node != null) {
      stdout.write('${node.value} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }  
  }

  //   void printPostorderFromRoot() {
  //   stdout.write("Post Order traversal: ");
  //   printInorder(root);
  //   print('');
  // }

  void printPreorder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.value} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  // void printPreorderFromRoot() {
  //   stdout.write("Pre Order traversal: ");
  //   printPreorder(root);
  //   print('');
  // }

  void printInorder(Node<T>? node) {
    if (node != null) {
      printInorder(node.left);
      stdout.write('${node.value} ');
      printInorder(node.right);
    }
  }

  // void printInorderFromRoot() {
  //   stdout.write("In Order traversal: ");
  //   printInorder(root);
  //   print('');
  // }
}

void main() {
  BinaryTree t = BinaryTree();
  t.root = Node(15);
  t.root?.left = Node(10);
  t.root?.right = Node(22);
  t.root?.left?.left = Node(4);
  t.root?.left?.right = Node(12);
  t.root?.right?.left = Node(18);
  t.root?.right?.right = Node(24);
  t.root?.right?.right?.right = Node(31);
  t.root?.right?.right?.right?.right = Node(44);
  t.root?.right?.right?.right?.right?.right = Node(70);
  t.root?.right?.right?.right?.right?.right?.right = Node(90);
  t.root?.right?.right?.right?.left = Node(35);
  t.root?.right?.right?.right?.left?.left = Node(50);

  print("Print Pre Order");
  t.printPreorder(t.root);
  print("\nPrint In Order");
  t.printInorder(t.root);
  print("\nPrint Post Order ");
  t.printPostorder(t.root);
}
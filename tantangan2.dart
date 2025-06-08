import 'dart:io';

class Node<T> {
  T nodeValue;
  Node<T>? left,right,parent;

  Node(this.nodeValue, [this.parent]);
}

class BinarySearchTree<T extends Comparable> {
  Node<T>? root;
  int treeSize = 0;

  bool insertdata(T newValue) {
    Node<T>? current = root,parent;
    int orderValue = 0;

    while(current != null) {
      parent = current;
      orderValue = newValue.compareTo(current.nodeValue);

      if (orderValue == null) {
        return false;
      } else if (orderValue < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    Node<T> newNode = Node(newValue, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }

  void PreOrder(Node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} '); // N
      PreOrder(node.left); // L
      PreOrder(node.right); // R
    }
  }

  void InOrder(Node? node) {
    if (node != null) {
      InOrder(node.left);
      stdout.write('${node.nodeValue} ');
      InOrder(node.right);
    }
  }

  void PostOrder(Node? node) {
    if(node != null) {
      PostOrder(node.left);
      PostOrder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }
}


void main() {
  BinarySearchTree bst = BinarySearchTree();

  bst.insertdata(30);
  bst.insertdata(45);
  bst.insertdata(20);
  bst.insertdata(25);
  bst.insertdata(80);

  print("Pre-Order: ");
  bst.PreOrder(bst.root);

  print("");

  print("InOrder: ");
  bst.InOrder(bst.root);

  print("");

  print("PostOrder");
  bst.PostOrder(bst.root);
}
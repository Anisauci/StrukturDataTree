class BSTNode<T> {
  T nodeValue;
  BSTNode<T>? left, right, parent;

  BSTNode(this.nodeValue, [this.parent]) {
    left = null;
    right = null;
  }
}

class BinarySearchTree<T extends Comparable> {
  BSTNode<T>? root;
  int treeSize = 0;

  BinarySearchTree() {
    root = null;
  }

  bool insert(T newValue) {
    BSTNode<T>? current = root, parent;
    int orderValue = 0;

    while (current != null) {
      parent = current;
      orderValue = newValue.compareTo(current.nodeValue);
      if (orderValue == 0) {
        return false;
      } else if (orderValue < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }

    BSTNode<T> node = BSTNode<T>(newValue, parent);
    if (parent == null) {
      root = node;
    } else if (orderValue < 0) {
      parent.left = node;
    } else {
      parent.right = node;
    }
    treeSize++;
    return true;
  }

  void inOrder(BSTNode<T>? node) {
    if (node != null) {
      inOrder(node.left);
      print('${node.nodeValue}');
      inOrder(node.right);
    }
  }

  void printInOrderFromRoot() {
    inOrder(root);
  }

  void preOrder(BSTNode<T>? node) {
    if (node != null) {
      print('${node.nodeValue}');
      preOrder(node.left);
      preOrder(node.right);
    }
  }

  void printPreOrderFromRoot() {
    preOrder(root);
  }

  void postOrder(BSTNode<T>? node) {
    if (node != null) {
      postOrder(node.left);
      postOrder(node.right);
      print('${node.nodeValue}');
    }
  }

  void printPostOrderFromRoot() {
    postOrder(root);
  } 

  void printVisual(BSTNode<T>? node, [String prefix = "", bool isLeft = true]) {
    node ??= root;
    if (node == null) {
      return;
    }
    if (node.right != null) {
      printVisual(node.right, "$prefix${isLeft ? "│   " : "    "}", false);
    }
    print("$prefix${isLeft ? "└── " : "┌── "}${node.nodeValue}");
    if (node.left != null) {
      printVisual(node.left, "$prefix${isLeft ? "    " : "│   "}", true);
    }
  }

  void visualFromRoot() {
    printVisual(root);
  }
}

void main() {
 BinarySearchTree t = BinarySearchTree();
  t.insert(10);
  t.insert(20);
  t.insert(30);
  t.insert(4);

print("isi tree:");
  t.visualFromRoot();
}
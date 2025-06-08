// Percobaan 1: Class STNode<T>
class STNode<T> {
  T nodeValue;
  STNode<T>? left, right, parent;

  STNode(this.nodeValue, [this.parent]) {
    left = null;
    right = null;
  }

  STNode.withChildren(this.nodeValue, this.left, this.right) {
    parent = null;
  }
}

// Percobaan 1-4: Class BinarySearchTree<T>
class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int treeSize = 0;

  BinarySearchTree() {
    root = null;
  }

  // Percobaan 1: Menambahkan node ke BST
  bool add(T item) {
    STNode<T>? t = root, parent;
    int orderValue = 0;

    while (t != null) {
      parent = t;
      orderValue = item.compareTo(t.nodeValue);

      if (orderValue == 0) {
        return false; // Node sudah ada
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }

    STNode<T> newNode = STNode(item, parent);

    if (parent == null) {
      root = newNode; // Node pertama jadi root
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    treeSize++;
    return true;
  }

  // Percobaan 2: Mencari node dan mengembalikan alamatnya
  STNode<T>? findNode(T item) {
    STNode<T>? t = root;
    int orderValue = 0;

    while (t != null) {
      orderValue = item.compareTo(t.nodeValue);
      if (orderValue == 0) {
        return t;
      } else if (orderValue < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }

    return null;
  }

  // Percobaan 3: Mencari node dan mengembalikan true/false
  bool find(T item) {
    STNode<T>? t = findNode(item);
    return t != null;
  }

  // Percobaan 4: Menghapus node
  void RemoveNode(STNode<T>? dNode) {
    if (dNode == null) return;

    STNode<T>? pNode = dNode.parent;
    STNode<T>? rNode;

    // Jika node memiliki satu anak atau tidak ada anak
    if (dNode.left == null || dNode.right == null) {
      rNode = (dNode.right == null) ? dNode.left : dNode.right;

      if (rNode != null) {
        rNode.parent = pNode;
      }

      if (pNode == null) {
        root = rNode;
      } else if (dNode.nodeValue.compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    } 
    // Jika node memiliki dua anak
    else {
      STNode<T>? pOfRNode = dNode;
      rNode = dNode.right;

      while (rNode!.left != null) {
        pOfRNode = rNode;
        rNode = rNode.left;
      }

      dNode.nodeValue = rNode.nodeValue;

      if (pOfRNode == dNode) {
        dNode.right = rNode.right;
      } else {
        pOfRNode!.left = rNode.right;
      }

      if (rNode.right != null) {
        rNode.right!.parent = pOfRNode;
      }
    }
  }

  // Tambahan: Mendapatkan root
  STNode<T>? getRoot() {
    return root;
  }

  // Tambahan: InOrder traversal
  static void InOrderDisplay<T>(STNode<T>? node) {
    if (node != null) {
      InOrderDisplay(node.left);
      print(node.nodeValue);
      InOrderDisplay(node.right);
    }
  }

  // Tambahan: PreOrder traversal
  static void PreOrderDisplay<T>(STNode<T>? node) {
    if (node != null) {
      print(node.nodeValue);
      PreOrderDisplay(node.left);
      PreOrderDisplay(node.right);
    }
  }

  // Tambahan: PostOrder traversal
  static void PostOrderDisplay<T>(STNode<T>? node) {
    if (node != null) {
      PostOrderDisplay(node.left);
      PostOrderDisplay(node.right);
      print(node.nodeValue);
    }
  }
}

// Class Main untuk menguji percobaan 1-4
void main() {
  BinarySearchTree<int> bst = BinarySearchTree();

  // Percobaan 1: Menambahkan node
  bst.add(35);
  bst.add(18);
  bst.add(25);
  bst.add(48);
  bst.add(20);

  // Percobaan 2: Mencetak root
  STNode<int>? rootNode = bst.getRoot();
  if (rootNode != null) {
    print('Root Value: ${rootNode.nodeValue}');
  } else {
    print('The tree is empty.');
  }

  // Percobaan 3: Mencari node
  var node = bst.findNode(5);
  print(node != null ? 'Node found: ${node.nodeValue}' : 'Node not found.');

  bool isFound = bst.find(5);
  print(isFound ? 'Node found' : 'Node not found');

  // Traversal InOrder
  print('InOrder Display Sebelum Dihapus:');
  BinarySearchTree.InOrderDisplay(bst.getRoot());

  // Percobaan 4: Menghapus node
  STNode<int>? nodeToRemove = bst.findNode(20);
  bst.RemoveNode(nodeToRemove);

  // Traversal InOrder setelah penghapusan
  print('InOrder Display Setelah Dihapus:');
  BinarySearchTree.InOrderDisplay(bst.getRoot());
}

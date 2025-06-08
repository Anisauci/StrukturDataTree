import 'dart:collection';
import 'dart:io';

class Node<T> {
  T key;
  Node<T>? left, right;

  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  // Percobaan 2: InOrder
  void tampilkanInOrder(Node<T>? node) {
    if (node != null) {
      tampilkanInOrder(node.left);
      stdout.write('${node.key} ');
      tampilkanInOrder(node.right);
    }
  }

  void tampilkanInOrderFromRoot() {
    tampilkanInOrder(root);
    stdout.writeln();
  }

  // Percobaan 3: PreOrder
  void tampilkanPreOrder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.key} ');
      tampilkanPreOrder(node.left);
      tampilkanPreOrder(node.right);
    }
  }

  void tampilkanPreOrderFromRoot() {
    tampilkanPreOrder(root);
    stdout.writeln();
  }

  // Percobaan 4: PostOrder
  void tampilkanPostOrder(Node<T>? node) {
    if (node != null) {
      tampilkanPostOrder(node.left);
      tampilkanPostOrder(node.right);
      stdout.write('${node.key} ');
    }
  }

  void tampilkanPostOrderFromRoot() {
    tampilkanPostOrder(root);
    stdout.writeln();
  }

  // Percobaan 5: Kedalaman Tree
  int hitungKedalaman(Node<T>? node) {
    if (node == null) return 0;
    int kedalamanKiri = hitungKedalaman(node.left);
    int kedalamanKanan = hitungKedalaman(node.right);
    return (kedalamanKiri > kedalamanKanan ? kedalamanKiri : kedalamanKanan) + 1;
  }

  // Percobaan 6: Level Order
  void printLevelOrder() {
    int h = hitungKedalaman(root);
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
    stdout.writeln();
  }

  void printCurrentLevel(Node<T>? node, int level) {
    if (node == null) return;
    if (level == 0) {
      stdout.write('${node.key} ');
    } else {
      printCurrentLevel(node.left, level - 1);
      printCurrentLevel(node.right, level - 1);
    }
  }

  // Percobaan 7: Hapus simpul
  void deleteDeepest(Node<T> root, Node<T> delNode) {
    Queue<Node<T>> q = Queue();
    q.add(root);

    while (q.isNotEmpty) {
      Node<T> temp = q.removeFirst();

      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          q.add(temp.left!);
        }
      }

      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          q.add(temp.right!);
        }
      }
    }
  }

  void delete(Node<T>? root, T key) {
    if (root == null) return;

    if (root.left == null && root.right == null) {
      if (root.key == key) {
        this.root = null;
      }
      return;
    }

    Queue<Node<T>> q = Queue();
    q.add(root);

    Node<T>? temp;
    Node<T>? keyNode;

    while (q.isNotEmpty) {
      temp = q.removeFirst();

      if (temp.key == key) keyNode = temp;

      if (temp.left != null) q.add(temp.left!);
      if (temp.right != null) q.add(temp.right!);
    }

    if (keyNode != null && temp != null) {
      keyNode.key = temp.key;
      deleteDeepest(root, temp);
    }
  }
}

void main() {
  BinaryTree<int> tree = BinaryTree<int>();

  // Percobaan 1
  tree.root = Node(10);
  tree.root!.left = Node(20);
  tree.root!.right = Node(30);
  tree.root!.right!.left = Node(4);

  stdout.writeln("\n== Traversal InOrder (Percobaan 2) ==");
  tree.tampilkanInOrderFromRoot();

  stdout.writeln("\n== Traversal PreOrder (Percobaan 3) ==");
  tree.tampilkanPreOrderFromRoot();

  stdout.writeln("\n== Traversal PostOrder (Percobaan 4) ==");
  tree.tampilkanPostOrderFromRoot();

  stdout.writeln("\n== Kedalaman Tree (Percobaan 5) ==");
  stdout.writeln(tree.hitungKedalaman(tree.root));

  stdout.writeln("\n== Level Order Traversal (Percobaan 6) ==");
  tree.printLevelOrder();

  stdout.writeln("\n== Menghapus node 30 (Percobaan 7) ==");
  tree.delete(tree.root, 30);
  stdout.write("InOrder setelah delete: ");
  tree.tampilkanInOrderFromRoot();

  stdout.writeln("\n== Tampilkan node di level ke-1 ==");
  tree.printCurrentLevel(tree.root, 1);
  stdout.writeln();
}

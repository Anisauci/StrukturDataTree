import 'dart:io';

class Node<T> {
  T key; // digunakan untuk menyimpan nilai simpul
  Node<T>? kiri, kanan;

  Node(this.key);
}

// Kelas BinaryTree<T> merepresentasikan struktur binary tree
class BinaryTree<T> {
  Node<T>? root;

  BinaryTree() {
    root = null;
  }

  // traversal inorder: kiri lalu root lalu kanan
  void inorder(Node<T>? node) {
    if (node != null) {
      inorder(node.kiri);
      stdout.write('${node.key} ');
      inorder(node.kanan);
    }
  }

  // traversal preorder: root lalu kiri lalu kanan
  void preorder(Node<T>? node) {
    if (node != null) {
      stdout.write('${node.key} ');
      preorder(node.kiri);
      preorder(node.kanan);
    }
  }

  // Traversal postorder: kiri lalu kanan lalu root
  void postorder(Node<T>? node) {
    if (node != null) {
      postorder(node.kiri);
      postorder(node.kanan);
      stdout.write('${node.key} ');
    }
  }

  // fungsi untuk mencetak traversal inorder
  void printInOrder() {
    stdout.write("InOrder: ");
    inorder(root);
    stdout.writeln();
  }

  // fungsi untuk mencetak traversal preorder
  void printPreOrder() {
    stdout.write("PreOrder: ");
    preorder(root);
    stdout.writeln();
  }

  // fungsi untuk mencetak traversal postorder
  void printPostOrder() {
    stdout.write("PostOrder: ");
    postorder(root);
    stdout.writeln();
  }
}

// Kelas untuk node pohon ekspresi
class Expr {
  String value; // simpan operator atau operand
  Expr? kiri, kanan; // referensi ke anak kiri dan kanan

  Expr(this.value);
}

// kelas ExpressionTree untuk merepresentasikan ekspresi matematika
class ExpressionTree {
  Expr? root;

  ExpressionTree(this.root);

  // traversal inorder dengan tanda kurung untuk ekspresi matematika
  void inorder(Expr? node) {
    if (node == null) return;
    if (node.kiri != null || node.kanan != null) stdout.write("(");
    inorder(node.kiri);
    stdout.write(node.value); // Cetak nilai simpul
    inorder(node.kanan);
    if (node.kiri != null || node.kanan != null) stdout.write(")");
  }

  // traversal preorder untuk ekspresi prefix
  void preorder(Expr? node) {
    if (node == null) return;
    stdout.write("${node.value} ");
    preorder(node.kiri);
    preorder(node.kanan);
  }

  // traversal postorder untuk ekspresi postfix
  void postorder(Expr? node) {
    if (node == null) return;
    postorder(node.kiri);
    postorder(node.kanan);
    stdout.write("${node.value} ");
  }

  // evaluasi ekspresi berdasarkan operator dan operand
  double evaluate(Expr? node, Map<String, double> values) {
    if (node == null) return 0.0;
    
    // jika simpul adalah operand, ambil nilainya
    if (node.kiri == null && node.kanan == null) {
      return values[node.value] ?? double.tryParse(node.value) ?? 0.0;
    }

    // evaluasi rekursif kiri dan kanan
    double kiri = evaluate(node.kiri, values);
    double kanan = evaluate(node.kanan, values);

    // operasi berdasarkan jenis operator
    switch (node.value) {
      case '+':
        return kiri + kanan;
      case '-':
        return kiri - kanan;
      case '*':
        return kiri * kanan;
      case '/':
        return kanan != 0 ? kiri / kanan : 0; // mencegah pembagian oleh nol
      default:
        return 0;
    }
  }
}

void main() {
  print(" Binary Tree Latihan ");
  
  // data Binary Tree secara manual
  BinaryTree<String> t1 = BinaryTree<String>();
  t1.root = Node('A');
  t1.root!.kiri = Node('B');
  t1.root!.kiri!.kiri = Node('D');
  t1.root!.kiri!.kanan = Node('E');
  t1.root!.kiri!.kanan!.kiri = Node('G');
  t1.root!.kanan = Node('C');
  t1.root!.kanan!.kanan = Node('F');
  t1.root!.kanan!.kanan!.kanan = Node('J');
  t1.root!.kanan!.kanan!.kiri = Node('H');

  // menampilkan hasil traversal Binary Tree
  t1.printInOrder();
  t1.printPreOrder();
  t1.printPostOrder();

  print("\nExpression Tree: a * b + (c - d) / e ");

  // Expression Tree untuk ekspresi matematika
  Expr root = Expr('+');
  root.kiri = Expr('*');
  root.kiri!.kiri = Expr('a');
  root.kiri!.kanan = Expr('b');

  root.kanan = Expr('/');
  root.kanan!.kiri = Expr('-');
  root.kanan!.kiri!.kiri = Expr('c');
  root.kanan!.kiri!.kanan = Expr('d');
  root.kanan!.kanan = Expr('e');

  var exprTree = ExpressionTree(root);

  // mencetak ekspresi dalam berbagai format traversal
  print("Infix   :");
  exprTree.inorder(exprTree.root);
  print("");

  print("Prefix  :");
  exprTree.preorder(exprTree.root);
  print("");

  print("Postfix :");
  exprTree.postorder(exprTree.root);
  print("");

  //ekspresi dengan nilai operand yang diberikan
  var nilai = {'a': 2.0, 'b': 3.0, 'c': 6.0, 'd': 4.0, 'e': 2.0};
  double hasil = exprTree.evaluate(exprTree.root, nilai);
  print("Hasil evaluasi: $hasil");
}

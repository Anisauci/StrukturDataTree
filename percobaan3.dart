// mencetak kedalam
void printLevelOrder() {
  int h = height(root);
  for (int i = 0; i <= h; i++) {
    printCurrentLevel(root, i);
  }
}

int height(Node? root) {
  if (root == null) {
    return 0;
  } else {
    int lheight = height(root.kiri);
    int rheight = height(root.kanan);
    return lheight > rheight ? lheight + 1 : rheight + 1;
  }
}

void printCurrentLevel(Node? root, int level) {
  if (root == null) return;
  
  if (level == 0) {
    print('${root.key} ');
  } else if (level >= 1) {
    printCurrentLevel(root.kiri, level - 1);
    printCurrentLevel(root.kanan, level - 1);
  }
}


// https://leetcode.com/problems/binary-tree-inorder-traversal/
// https://gemini.google.com/app/7128d7d5f6427c60

// helper code to define a tree node.
// essentially a treenode is an object that has a left and right value. I'm not
// sure why it's own value (this.vaL) gets initialized to 0. Maybe that's for
// new nodes, and when they get added to tree, they take on the value of their
// parent. But no, I would think that the left and rigth are not values, they
// are more TreeNodes. Yes, that's what it says here. So... I don't get the
// this.val
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// This problem would benefit to some explanation of what "in order" means for
// a binary tree. Of course, that opens up how deep you want to go, but I think
// I would skip trying to define a binary tree, maybe I would explain it
// quickly.
// When traversing a binary tree "inorder", that means always go left if you,
// can, and only when you, walk back and go right (when you can). If you can go
// right, then next first check if you can go left again. Left first, then back
// till right.

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    // Set a results array. As we traverse the tree, we will store each step in
    // our array.
    List<int> result = [];
    // call the _inOrder function. (We ahve to say something about recursion).
    // Note, this function will call itself if it can. Every time it calls
    // itself, it's going "down a level", building up a stack. When it can't
    // call itself, it will exit, up one level, until it reaches the top.
    _inorder(root, result);
    return result;
  }

  // _inorder takes a treenode, and our results array.
  void _inorder(TreeNode? root, List<int> result) {
    // first check. If the treenode we recieved was null, we are at the end
    // of a branch. Returning here sends us "up a level"
    if (root == null) {
      return;
    }

    // if the node we received does have a value, first we call it's left side.
    // This calls _inorder again. You can imagine here. Take the current node
    // we are on. We call it's left side first? Now we're in a fressh run
    // through this function. What do we do first? Check if our new TreeNode is
    // null. If not, call the left side again. We will go on and on until
    // we hit null. Then we go to the next step.
    _inorder(root.left, result);
    // whenever we null, the _inorder functions exits. It will start again here.
    // Add the current value to our answer array.
    result.add(root.val);
    // And now call right.
    _inorder(root.right, result);
    // notice how we never explicitly add a .rigth TreeNode to the array. This
    // is because when we hit a right node with more children (left or right),
    // we call them. When we hit a right node with no children, we already added
    // it after finishing checking it's left side.
  }
}

// key programming concepts in this problem
//
// recursion. This is a tough one. I think I did it justice here, but I don't
// know if there's a simple example to use. Maybe for now keep this as an
// advanced topic.
// Defining our own object, TreeNode. Like with linked lists, this also seems
// more advanced to me, for a beginner.
// Defining variables.
// if loop
// true/false check, ==


void main() {
  // Test Case 1: Empty Tree
  TreeNode? root1 = null;
  Solution solution = Solution();
  List<int> result1 = solution.inorderTraversal(root1);
  print('Test Case 1: $result1'); // Expected: []

  // Test Case 2: Single Node Tree
  TreeNode root2 = TreeNode(1);
  List<int> result2 = solution.inorderTraversal(root2);
  print('Test Case 2: $result2'); // Expected: [1]

  // Test Case 3: Simple Tree
  TreeNode root3 = TreeNode(1);
  root3.right = TreeNode(2);
  root3.right!.left = TreeNode(3);
  List<int> result3 = solution.inorderTraversal(root3);
  print('Test Case 3: $result3'); // Expected: [1, 3, 2]

  // Test Case 4: More Complex Tree
  TreeNode root4 = TreeNode(4);
  root4.left = TreeNode(2);
  root4.right = TreeNode(6);
  root4.left!.left = TreeNode(1);
  root4.left!.right = TreeNode(3);
  root4.right!.left = TreeNode(5);
  root4.right!.right = TreeNode(7);

  List<int> result4 = solution.inorderTraversal(root4);
  print('Test Case 4: $result4'); // Expected: [1, 2, 3, 4, 5, 6, 7]

  // Test Case 5: Left leaning Tree
  TreeNode root5 = TreeNode(4);
  root5.left = TreeNode(2);
  root5.left!.left = TreeNode(1);
  root5.left!.left!.left = TreeNode(0);

  List<int> result5 = solution.inorderTraversal(root5);
  print('Test Case 5: $result5'); //Expected: [0, 1, 2, 4]

  // Test Case 6: Right leaning Tree
  TreeNode root6 = TreeNode(1);
  root6.right = TreeNode(2);
  root6.right!.right = TreeNode(3);
  root6.right!.right!.right = TreeNode(4);

  List<int> result6 = solution.inorderTraversal(root6);
  print('Test Case 6: $result6'); //Expected: [1, 2, 3, 4]
}
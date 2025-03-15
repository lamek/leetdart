class Solution {
  int minimumTotal(List<List<int>> triangle) {
    if (triangle.isEmpty) {
      return 0;
    }

    int rows = triangle.length;

    for (int i = rows - 2; i >= 0; i--) {
      for (int j = 0; j < triangle[i].length; j++) {
        triangle[i][j] +=
            (triangle[i + 1][j] < triangle[i + 1][j + 1])
                ? triangle[i + 1][j]
                : triangle[i + 1][j + 1];
      }
    }

    return triangle[0][0];
  }
}

void main() {
  Solution solution = Solution();

  // Test Case 1
  List<List<int>> triangle1 = [
    [2],
    [3, 4],
    [6, 5, 7],
    [4, 1, 8, 3]
  ];
  int result1 = solution.minimumTotal(triangle1);
  print("Test Case 1: $result1"); // Output: 11

  // Test Case 2
  List<List<int>> triangle2 = [
    [-10]
  ];
  int result2 = solution.minimumTotal(triangle2);
  print("Test Case 2: $result2"); // Output: -10

    //Test Case 3
    List<List<int>> triangle3 = [
    [2],
    [3,2],
    [6,5,1]
    ];
    int result3 = solution.minimumTotal(triangle3);
    print("Test Case 3: $result3"); // Output: 8

    //Test Case 4
    List<List<int>> triangle4 = [
    [-1],[2,3],[1,-1,-3]
    ];
    int result4 = solution.minimumTotal(triangle4);
    print("Test Case 4: $result4"); // Output: -1
}
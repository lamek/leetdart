// https://leetcode.com/problems/reverse-string/description/
// https://gemini.google.com/app/d0b7f735f3969e4d

class Solution {
  void reverseString(List<String> s) {

    // set 2 pointers
    // 1 (left) goes at the beginning of the list
    // 2 (rigth) goes at the end
    int left = 0;
    int right = s.length - 1;

    // our pointers are going to move closer, so our loop checks that
    // left is still less than right
    while (left < right) {
      // create a temp string. It will hold our left value.
      String temp = s[left];
      // now, let the left value to equal what's currently at right
      // in other words, take the last item in the string, and place it in the
      // front.
      s[left] = s[right];
      // now set right to what we stored in temp.
      // in other words, take the first value of the string (which we stored in
      // temp), and place it at the end
      s[right] = temp;
      // At this point we've swapped the 2 values on the end.
      // So, we move left up and right now, one step closer to each other.
      left++;
      right--;
    }
    // note our while loop check. If our string has an odd numbered length, then
    // right and left will end up on the middle element at the same time. The
    // check will fail, but the middle element never needs to move anyway.
  }
}

// key programming concepts in this problem
//
// 0 indexing of lists and implications on length calculations
// while loop
// defining variables with type
// accessing items in a list
// incrementing and descremetning
// the .length (getter? Or built-in property that is getter-like, LOL)

void main() {
  Solution solution = Solution();

  // Test cases
  List<String> test1 = ['h', 'e', 'l', 'l', 'o'];
  solution.reverseString(test1);
  print('Test 1: ${test1}'); // Expected: ['o', 'l', 'l', 'e', 'h']

  List<String> test2 = ['H', 'a', 'n', 'n', 'a', 'h'];
  solution.reverseString(test2);
  print('Test 2: ${test2}'); // Expected: ['h', 'a', 'n', 'n', 'a', 'H']

  List<String> test3 = [];
  solution.reverseString(test3);
  print('Test 3: ${test3}'); // Expected: []

  List<String> test4 = ["a"];
  solution.reverseString(test4);
  print("Test 4: ${test4}"); //Expected: ["a"]

  List<String> test5 = ["a","b"];
  solution.reverseString(test5);
  print("Test 5: ${test5}"); //Expected: ["b","a"]

}
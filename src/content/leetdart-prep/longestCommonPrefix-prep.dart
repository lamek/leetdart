// https://leetcode.com/problems/longest-common-prefix/description/
// https://gemini.google.com/app/742dfe92554c841c


class Solution {
  String longestCommonPrefix(List<String> strs) {
    // base check to see if the input array of strings is empty
    // if you have an empty input string, then the longest common prefix is
    // nothing.
    // return an empty string.
    if (strs.isEmpty) {
      return "";
    }

    // The longest common prefix has to be common across all words
    // So, we pick the first word as our "anchor". We pretend the entire
    // word is the longest common prefix.
    // Then we will check against each other word in the array.
    
    // the prefix is set to the first word
    String prefix = strs[0];
    // for each word in our input array
    for (int i = 1; i < strs.length; i++) {
      // start checking
      // while the current word does NOT start with our prefix
      // (or, while the current word doesn't 100% match our prefix)
      while (!strs[i].startsWith(prefix)) {
        // shorten the prefix by 1, by making a new string from 0 to the 
        // length of the prefix - 1
        prefix = prefix.substring(0, prefix.length - 1);
        // do a quick check to see if the prefix is empty. If it is, we have no
        // common prefix across any of the words, so return an empty string.
        if (prefix.isEmpty) {
          return "";
        }
      // this while loop will run for the first word until a common prefix is
      // found. This first iteration only finds the common prefix between the 
      // 0th index word and the 1st index word.
      // Then, the for loop increments to the 3rd word. Then the while loop
      // starts again. This time the 3rd word is trying to match the now
      // shortened prefix.
      // This continues for each word, until we finish them all with a common
      // prefix, or until the prefix runs to empty.
      }
    }
    return prefix;
  }
}

// key programming features in this problem
//
// if loop
// for loop
// while loop
// not logic
// accessing an item in a string
// substring() buildin method


void main() {
  Solution solution = Solution();

  // Test cases
  List<List<String>> testCases = [
    ["flower", "flow", "flight"],
    ["dog", "racecar", "car"],
    ["", "b"],
    ["c","c"],
    ["abab","aba",""],
    ["a"],
    [],
    ["cir","car"],
    ["aa","aa","aaa"]
  ];

  for (List<String> strs in testCases) {
    String result = solution.longestCommonPrefix(strs);
    print("Input: $strs, Output: $result");
  }
}
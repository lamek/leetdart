// https://leetcode.com/problems/valid-anagram/description/
// https://gemini.google.com/app/36758edc6bfbc5d1

class Solution {
  bool isAnagram(String s, String t) {
    // check that the 2 input strings have matching lengths
    // if they don't, they can't possibly be anagrams
    if (s.length != t.length) {
      return false;
    }

    // set up 2 maps. We'll map the letters in each string.
    // the key will be the letter. the value will be the count.
    Map<String, int> sMap = {};
    Map<String, int> tMap = {};

    // because the strings are both the same length (we verified above), we can
    // use the length of one of the strings to iterate across both of them
    for (int i = 0; i < s.length; i++) {
      // each of the following statements reads like so:
      // for the key of s[i], if it has a value use it, otherwise, use 0, and 
      // increment by 1
      sMap[s[i]] = (sMap[s[i]] ?? 0) + 1;
      tMap[t[i]] = (tMap[t[i]] ?? 0) + 1;
    }

    // at this point we have 2 maps. They each have a set of keys that represent
    // all of the letters in their respective string, and a set of values with
    // the count for each of those letters.
    // if there is a key in one map and not in another, then the 2 strings cant
    // be anagrams.

    // for each key in sMap
    for (String key in sMap.keys) {
      // if the key and value are not equal to the key and value in tMap
      if (sMap[key] != tMap[key]) {
        return false;
        // return false
      }
    }

    // if we get this far all checks have passed and we have a valid anagram
    return true;
  }
}

// key programming concepts in this problem
//
// if loop
// build in .length method on strings
// initializing maps
// adding elements to a map
// conditional or logic
// for loop
// getting all the keys in a map
// getting a value in a map
// not equals !=


void main() {
  Solution solution = Solution();

  // Test cases
  print("Test Case 1: ${solution.isAnagram('anagram', 'nagaram')} - Expected: true");
  print("Test Case 2: ${solution.isAnagram('rat', 'car')} - Expected: false");
  print("Test Case 3: ${solution.isAnagram('a', 'a')} - Expected: true");
  print("Test Case 4: ${solution.isAnagram('ab', 'a')} - Expected: false");
  print("Test Case 5: ${solution.isAnagram('abc', 'cba')} - Expected: true");
  print("Test Case 6: ${solution.isAnagram('', '')} - Expected: true");
  print("Test Case 7: ${solution.isAnagram('aabb', 'bbaa')} - Expected: true");
  print("Test Case 8: ${solution.isAnagram('aabbc', 'cbbaa')} - Expected: true");
  print("Test Case 9: ${solution.isAnagram('aabbc', 'cbbaa1')} - Expected: false");

}
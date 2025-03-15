class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> numMap = {};
    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];
      if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }
      numMap[nums[i]] = i;
    }
    return [];
  }
}

// all the aspects of this dart problem
// Create a class - to me this isn't really "beginner", but more a byproduct of 
// how I'm setting up single files that include code and tests, so we can run them
// on the dartpad. Let's skip Classes for now.

// Set up a simple function. I think this first part, List<int>, might be what we return?
// twoSum is the name of the function, then we have the inputs, nums and target, both with
// types specified before the input names. Let's rewrite the simplified version of this function:

// List<int> twoSum(List<int> nums, int target) {
//   // do somethings in the function
//   return [];
// }

// not bad. I like it.
// Next thing!

// Declaring, or initializing, a variable. This variable type is Map.
// We declare it's type (Map), and then the type of variables it will hold
// for it's key value pairs (<int, int>). Then name it (numMap), and finally,
// initialize it as empty (no key value pairs... yet).
// So... slight tangent looking up two docs:
// https://dart.dev/language/collections#maps
// https://dart.dev/libraries/dart-core#maps
// Now, I'm wondering if we declared this map the simplest way possible. 
// I see this phrase, "You can declare a map using a terse literal syntax, or you can use a traditional constructor:"
// and I'm wondering a few things.
// 1. Which is which? I think it's like this:
// 1.a. Terse literal: var beaches = {'beach1': 'waikiki', 'beach2': 'waimanola'}
// 1.b. Traditional constructor: var becahse = Map();
// 2. Why do neither of these look like the example from my code?

// ... pause our analysis here. Let's rewrite this code:

// class Solution {
//   List<int> twoSum(List<int> nums, int target) {
//     var numMap = Map();
//     for (int i = 0; i < nums.length; i++) {
//       int complement = target - nums[i];
//       if (numMap.containsKey(complement)) {
//         return [numMap[complement]!, i];
//       }
//       numMap[nums[i]] = i;
//     }
//     return [];
//   }
// }

// Ok. Quick convo with Gemini, and a few errors while I tried to rewrite this. It turns out
// (at least according to Gem), that specifying types is in line with "modern dart", and not
// a bad idea. Let's continue.

// A basic for loop. This mirrors very closely what I use in JS. In fact, it might be the same.
// Let's do a mock example:
// for (counter; condition; post-loop thing) {
  // loop does stuff
// }
// Wow. Mad respect to all thems computer language guys. I find it difficult to name these parts
// of the for loop, but I'm sure they have names.
// Still. I think I captured the gist of it.

// Some simple math, and storing the anser in a variable. Again, specifying the type.

// An if statement. Wow. This simple problem really has it all!
// if (condition) {
// // some things happen if the condition is true
// // otherwise, this chunk is skipped
// }

// The if's return statement is interesting here. I'm at little thrown off by the exclamation
// point. Ahhh, I remember now. That's null safety. That means you can return that value or null.
// Although, I'm not sure why we would need it here. I don't think there would be a case in this
// problem where we would find the complement (find the key in the map), and the complement
// wouldnt be there. Yes. More explanation needed.

// I guess one thing that was sort of implicit was the lists, as an input. We didn't talk
// directly about them. About the index, starting at 0, and how yuo can use i here in this
// for loop to access item swithin that list.

// This is good. This is great. Not sure what I'll do wtih all this, but save it off.


//   List<int> twoSum(List<int> nums, int target) {
//     Map<int, int> numMap = {};
//     for (int i = 0; i < nums.length; i++) {
//       int complement = target - nums[i];
//       if (numMap.containsKey(complement)) {
//         return [numMap[complement]!, i];
//       }
//       numMap[nums[i]] = i;
//     }
//     return []; // No solution found
//   }

void main() {
  Solution solution = Solution();

  // Test Case 1
  List<int> nums1 = [2, 7, 11, 15];
  int target1 = 9;
  List<int> result1 = solution.twoSum(nums1, target1);
  print("Test Case 1: Input: $nums1, Target: $target1, Result: $result1");
  assert(result1.toString() == "[0, 1]");

  // Test Case 2
  List<int> nums2 = [3, 2, 4];
  int target2 = 6;
  List<int> result2 = solution.twoSum(nums2, target2);
  print("Test Case 2: Input: $nums2, Target: $target2, Result: $result2");
  assert(result2.toString() == "[1, 2]");

  //Test Case 3
  List<int> nums3 = [3,3];
  int target3 = 6;
  List<int> result3 = solution.twoSum(nums3, target3);
  print("Test Case 3: Input: $nums3, Target: $target3, Result: $result3");
  assert(result3.toString() == "[0, 1]");

  print("All tests passed!");
}
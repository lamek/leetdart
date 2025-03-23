// https://leetcode.com/problems/merge-two-sorted-lists/description/
// https://gemini.google.com/app/b20072031fe1e93e


// this is just helper code so we can run in dartpad
// it defines what a "ListNode" is. Essentially it's an object that has a val
// and next property. The val you can think of like the "name" or identifer
// for a list node. The next is like a holder, or cup, that holds a pointer
// too a nother ListNode, in for form of a val.
// I think that's right.
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    // our solution function takes 2 ListNodes, so we have to spend some time,
    // like we did above, explaining what at ListNode is.

    // First check if either ListNode is null. If they are, then they are
    // essentially lenght 0, and we don't need to merge them. We can just return
    // the other list.
    if (list1 == null) {
      return list2;
    }
    if (list2 == null) {
      return list1;
    }

    // initilaize variables
    // These are our 2 pointers.
    // We start dummy pointing to a new ListNode that is 1 behind the lowest
    // possible value that either of our input ListNodes COULD be.
    // Then we set current to point to dummy. So both nodes, essentially, point
    // to 1 before the start of our sorted list.
    ListNode? dummy = ListNode(-1);
    ListNode? current = dummy;

    // our loop runs while both input ListNodes still have a valuve. If either
    // input list node is ever null, that means there's no next value, per our
    // definitio, and we've reached the end of that list.
    while (list1 != null && list2 != null) {
      // compare the first value in list1 to list2.
      // if the list1 value is lower, or equal, we put it in the front of our
      // new list.
      if (list1.val <= list2.val) {
        // we put it in the front by assigning current's next value to it.
        // This way, you can think of our linked list as starting at dummy, then
        // pointing to this first sorted node.
        current!.next = list1;
        // if we did add the node from list1, we advance it. Next time through
        // this loop, list1 is pointing to the next node in it's list.
        list1 = list1.next;
      } else {
        // same as above. If list2's current item is lower, add it to our new
        // linked list.
        current!.next = list2;
        // and advance the pointer.
        list2 = list2.next;
      }
      // after thsoe checks to add the next item to our new list, advance our
      // current pointer. This way the next sorted item goes into the next slot.
      current = current.next;
    }

    // we reach this point when one of our 2 lists is empty. This means, we can
    // check both lists. Whichever one is not null still has items, but we don't
    // need to sort them, we can just add them to the end of our current list.
    if (list1 != null) {
      current!.next = list1;
    }
    if (list2 != null) {
      current!.next = list2;
    }

    // dummy was never updated. It's still sitting at on position before our
    // newly sorted list. So, return it's next value, and you're essentially
    // returning the beginning of your sorted list.
    return dummy.next;
  }
}

// key programming concepts in this problem
//
// ListNode is intersting. It's defining a new value type. A bit advanced if you
// ask me.
// Classes and this keyword
// Lots of null checking here. Also advanced, if you ask me.
// While loop
// if and else checks
// not equuals !=
// Maybe you use the idea of iterating through a list to talk more about
// pointers.

void main() {
  Solution solution = Solution();

  // Test Case 1: list1 = [1,2,4], list2 = [1,3,4]
  ListNode? list1_1 = ListNode(1, ListNode(2, ListNode(4)));
  ListNode? list2_1 = ListNode(1, ListNode(3, ListNode(4)));
  ListNode? merged1 = solution.mergeTwoLists(list1_1, list2_1);
  print("Test Case 1:");
  printList(merged1); // Expected: 1 -> 1 -> 2 -> 3 -> 4 -> 4

  // Test Case 2: list1 = [], list2 = []
  ListNode? list1_2 = null;
  ListNode? list2_2 = null;
  ListNode? merged2 = solution.mergeTwoLists(list1_2, list2_2);
  print("\nTest Case 2:");
  printList(merged2); // Expected: null

  // Test Case 3: list1 = [], list2 = [0]
  ListNode? list1_3 = null;
  ListNode? list2_3 = ListNode(0);
  ListNode? merged3 = solution.mergeTwoLists(list1_3, list2_3);
  print("\nTest Case 3:");
  printList(merged3); // Expected: 0

  //Test Case 4: list1 = [5], list2 = [1,2,3,4]

  ListNode? list1_4 = ListNode(5);
  ListNode? list2_4 = ListNode(1, ListNode(2, ListNode(3, ListNode(4))));
  ListNode? merged4 = solution.mergeTwoLists(list1_4, list2_4);
  print("\nTest Case 4:");
  printList(merged4); //Expected 1,2,3,4,5
}

void printList(ListNode? head) {
  ListNode? current = head;
  while (current != null) {
    print(current.val);
    current = current.next;
    if(current!=null){
      print(" -> ");
    }
  }
}
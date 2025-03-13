class KthLargest {
  int findKthLargest(List<int> nums, int k) {
    MinHeap minHeap = MinHeap();
    for (int num in nums) {
      minHeap.insert(num, k);
    }
    return minHeap.peek();
  }
}

class MinHeap {
  List<int> heap = [];

  void insert(int val, int k) {
    heap.add(val);
    bubbleUp();
    if (heap.length > k) {
      extractMin();
    }
  }

  void bubbleUp() {
    int index = heap.length - 1;
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] >= heap[parentIndex]) {
        break;
      }
      int temp = heap[index];
      heap[index] = heap[parentIndex];
      heap[parentIndex] = temp;
      index = parentIndex;
    }
  }

  int? extractMin() {
    if (heap.isEmpty) return null;
    if (heap.length == 1) return heap.removeLast();

    int min = heap[0];
    heap[0] = heap.removeLast();
    sinkDown(0);
    return min;
  }

  void sinkDown(int index) {
    int minIndex = index;
    int leftChildIndex = 2 * index + 1;
    int rightChildIndex = 2 * index + 2;
    int length = heap.length;

    if (leftChildIndex < length && heap[leftChildIndex] < heap[minIndex]) {
      minIndex = leftChildIndex;
    }
    if (rightChildIndex < length && heap[rightChildIndex] < heap[minIndex]) {
      minIndex = rightChildIndex;
    }

    if (minIndex != index) {
      int temp = heap[index];
      heap[index] = heap[minIndex];
      heap[minIndex] = temp;
      sinkDown(minIndex);
    }
  }

  int peek() {
    return heap[0];
  }
}

void main() {
  KthLargest kthLargest = KthLargest();

  // Test cases
  List<int> nums1 = [3, 2, 1, 5, 6, 4];
  int k1 = 2;
  print("Test Case 1: ${kthLargest.findKthLargest(nums1, k1)}"); // Output: 5

  List<int> nums2 = [3, 2, 3, 1, 2, 4, 5, 5, 6];
  int k2 = 4;
  print("Test Case 2: ${kthLargest.findKthLargest(nums2, k2)}"); // Output: 4

  List<int> nums3 = [1];
  int k3 = 1;
  print("Test Case 3: ${kthLargest.findKthLargest(nums3, k3)}"); // Output: 1
    
   List<int> nums4 = [3,2,1,5,6,4];
   int k4 = 3;
    print("Test Case 4: ${kthLargest.findKthLargest(nums4, k4)}"); // Output: 4
}
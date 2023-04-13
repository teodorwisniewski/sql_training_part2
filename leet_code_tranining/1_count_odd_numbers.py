class Solution:
    def countOdds(self, low: int, high: int) -> int:
        outputs = 0
        if low % 2 == 1:
            new_values = range(low,high, 2)
            outputs = len(new_values)
        else:
            new_values = range(low+1,high, 2)
            outputs = len(new_values)
        
        if high % 2 == 1:
            outputs += 1
        return outputs


if __name__ == "__main__":
    s = Solution()
    print(s.countOdds(low=3, high=7))
    print(s.countOdds(low=8, high=10))

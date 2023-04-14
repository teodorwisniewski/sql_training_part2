from typing import List
import math
from decimal import Decimal, getcontext

class Solution:
    def average(self, salary: List[int]) -> float:
        sorted_salaries = sorted(salary)[1:-1]
        average_num = sum(sorted_salaries)/len(sorted_salaries)
        return  Decimal(str(average_num)).quantize(Decimal('0.00001'))


if __name__ == "__main__":
    s = Solution()

    inputs = [4000,3000,1000,2000]
    print(s.average(inputs))
    inputs = [1000,2000,3000]
    print(s.average(inputs))
    inputs = [8000,9000,2000,3000,6000,1000]
    print(s.average(inputs))

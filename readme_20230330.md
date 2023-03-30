Tasks
----------------
### Task 1 Оценить временную сложность следующий алгоритмов:
а) Временная сложность O(2n) => O(n) - линейное время
b - O(1), w - O(n)
```
void test1(int n)
{
if (n==1)
return;
for (int i=1; i<=n; i++)
for (int j=1; j<=n; j++)
System.out.println("");
break;
}
```
б) Временная сложность O(n)*O(n) => O(n^2) - квадратичное время
```
void test2(int n)
{
int a = 0;
for (i = 0; i < n; i++)
for (j = n; j > i; j--)
a = a + i + j;    
}
```
в) Временная сложность O(n/2)*O(Log n) => O(n*Log n) - линейно-логарифмическое время
```
void test3(int n)
{
int i, j, a = 0;
for (i = n/2; i <=n; i++)
for (j = 2; j <=n; j=j2)
a=a+n/2;    
}
```
г)  Временная сложность O(Log n) - логарифмическое время
```
void test4(int n)
{
int a = 0, i = n;
while (i > 0) {
a += i;
i /= 2;
}
}
```
### Task 2. Познакомиться с [Задачей коммивояжёра](https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D0%B4%D0%B0%D1%87%D0%B0_%D0%BA%D0%BE%D0%BC%D0%BC%D0%B8%D0%B2%D0%BE%D1%8F%D0%B6%D1%91%D1%80%D0%B0).
### Task 3. (*)
Write a function to find the longest common prefix string amongst an array of strings. If there is no common prefix, return an empty string "".
```
Example 1:
Input: strs = ["flower","flow","flight"]
Output: "fl"
```
```
Example 2:
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```
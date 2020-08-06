# Given a 32-bit signed integer, reverse digits of an integer.
# Example 1: Input: 123 Output: 321

example = -897420

def reverse_int(n):
    q = 1 

    if n < 0:
        q = -1
        n = n * q

    int_to_string = str(n)
    reverse_string = int_to_string[::-1]
    string_to_int = int(reverse_string)

    return string_to_int * q

print(example)
print (reverse_int(example))
print (type(reverse_int(example)))
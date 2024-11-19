# 1.Квадрат чисел Используйте функцию map() и lambda, чтобы возвести в квадрат все числа из списка.
# [2,4,6] -> [4,16,36]

numbers = [2, 4, 6]
squared_numbers = list(map(lambda x: x ** 2, numbers))

print(squared_numbers)

# 2.Напишите рекурсивную функцию для вычисления произведение чисел в строке n.
# Пример n = “1a2B3c4D5”. Output: 120

def product_of_digits(string, index=0, product=1):
    if index >= len(string):
        return product
    if string[index].isdigit():
        product *= int(string[index])
    return product_of_digits(string, index + 1, product)

n = "1a2B3c4D5"
product_result = product_of_digits(n)


# 3.Напишите функцию которая принимает два **kwargs
# в виде анкеты двух юзеров (name, surname, age, city)
# и выводить keysпо которым анкеты совпадают

def matching_keys(first, second):
    result = []
    for key in first.keys():  
        if key in second.keys():  
            if first[key] == second[key]: 
                result.append(key) 
    return result
first = {
    'name': "Zharaskhan",
    'surname': "Gibatolla",
    "age": 20,
    "city": "Atyrau"
}
second = {
    'name': "Zharas",
    'surname': "Gibatolla",
    "age": 25,
    "city": "Atyrau"
}

matching_keys_result = matching_keys(first, second)
squared_numbers, product_result, matching_keys_result
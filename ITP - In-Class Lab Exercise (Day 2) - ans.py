#!/usr/bin/env python
# coding: utf-8

# <table align="left" width=100%>
#     <tr>
#         <td width="10%">
#             <img src="in_class.png">
#         </td>
#         <td>
#             <div align="center">
#                 <font color="#21618C" size=8px>
#                   <b> In-class Lab <br> (Day 2) </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# ##  Table of Content
# 
# 1. **[String](#string)**
# 2. **[List](#list)**
# 3. **[Tuple](#tuple)**
# 4. **[Set](#set)**
# 5. **[Dictionary](#dict)**
# 

# ### Let's begin with some hands-on practice exercises

# <a id="string"></a>
# ## 1. String Operations

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>11. Create a string with the name 'country' and 'India' as its element. Perform the following on it:
#                     <ol type = "1">
#                         <li>Find its length. </li>
#                         <li>Extract it first two letters. </li>
#                         </ol></b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[1]:


x ='country'
y ='India'
print(len(x))
print(len(y))
print(x[:2])
print(y[:2])


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>2. Given the string 'Today is a sunny day.' 
#                         <ol > <li>  Write a code to get 'Today'  and 'sunny'. </li>
#                              <li>  Obtain the last two letters. </li>
#                              <li>  Write the statement backwards.</li>
#                         </ol> </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[103]:


x = 'Today is a sunny day.'
print(x[:5])
print(x[11:-4])
print(x[11:-1])
print(x[::-1])


# <a id="list"> </a>
# ## 2. List

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>3. Write a program to perform following list operations on the list given below:<br><br>
#                         a. Check the length of mix_list_1<br>
#                         b. Check the membership of '24' in mix_list_1<br> 
#                         c. Concatenate the mix_list_1 and mix_list_2<br>
#                         d. Repeat the mix_list_2 three times </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Lists to perform operations:**
# 
# mix_list_1 = ['Learn', 24, 'Blue', False, -8]
# 
# mix_list_2 = [4, 7, 'Summer']

# **a. Check the length of mix_list_1**

# In[3]:


mix_list_1 = ['Learn', 24, 'Blue', False, -8]
len(mix_list_1)


# **b. Check the membership of '24' in mix_list_1**

# In[4]:


24 in mix_list_1


# **c. Concatenate the mix_list_1 and mix_list_2**

# In[5]:


mix_list_2 = [4, 7, 'Summer']
print(mix_list_1 + mix_list_2)


# **d. Repeat the mix_list_2 three times**

# In[6]:


mix_list_2 * 3 


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>4. Write the program to multiply the two lists</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Lists to perform multiplication:**
# 
# num_list_1 = [1, 2, 3, 4]
# 
# num_list_2 = [0, 5, 2, 1]

# In[7]:


# expected to get an error
num_list_1 = [1, 2, 3, 4]
num_list_2 = [0, 5, 2, 1]
print(num_list_1 * num_list_2)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>5. Write a code to retrieve elements from a list<br><br>
#                        a. First element<br>
#                        b. Second last element<br>
#                        c. First three elements<br>
#                        d. Slice the list from 1st index till the last index with an increment of an index by 2
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the below list**
# 
# mix_list = ['Python', 1, 2, 3, 'Data', True] 

# **a. First element**

# In[8]:


mix_list = ['Python', 1, 2, 3, 'Data', True]
print(mix_list[0])


# **b. Second last element**

# In[9]:


print(mix_list[-2])


# **c. First three elements**

# In[10]:


print(mix_list[:3])


# **d. Slice the list from 1st index till the last index with an increment of an index by 2**

# In[11]:


print(mix_list[1::2])


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>6. Write a program to perform following built-in list operations:<br><br>
#                         a. Min(list)<br>
#                         b. Max(list)<br>
#                         c. Sort the elements (use sort() and sorted() function)<br>
#                         d. Create a copy of a list<br>
#                         e. Remove element '5' from the list</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the below list**
# 
# num_list = [4, 5, 7, -2, 0, 1] 

# **a. Min(list)**

# In[12]:


num_list = [4, 5, 7, -2, 0, 1]
min(num_list)


# **b. Max(list)**

# In[13]:


max(num_list)


# **c. Sort the elements (use sort() and sorted() function)**

# In[14]:


num_list.sort()
num_list
sorted(num_list)


# **d. Create a copy of a list**

# In[15]:


x = num_list.copy()
print(x)


# **e. Remove element '5' from the list**

# In[16]:


num_list.remove(5)
num_list


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>7. Manipulating a list:<br><br>
#                         a. Add a new element 'Data' in the given list<br>
#                         b. Add elements 'Excel' and 'Data' in the given list<br>
#                         c. Replace an element 'C' with 'C++' in the given list<br>
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# #### Use the below list
# 
# languages_list = ['R', 'Python', 'C', 'Java']

# **a. Add a new element 'Data' in the given list**

# In[17]:


languages_list = ['R', 'Python', 'C', 'Java']
languages_list.append('Data')


# **b. Add elements 'Excel' and 'Data' in the given list**

# In[18]:


languages_list.extend(['Data','Excel'])


# **c. Replace an element 'C' with 'C++' in the given list**

# In[19]:


languages_list


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>8. How many times 'Summer' is occuring in a given list?
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# #### Use the below list
# 
# seasons_list = ['Summer', 'Winter', 'Spring', 'Winter', 'Spring' ,'Summer', 'Spring', 'Summer', 'Winter', 'Summer', 'Spring']

# In[21]:


seasons_list = ['Summer', 'Winter', 'Spring', 'Winter', 'Spring' ,'Summer', 'Spring', 'Summer', 'Winter', 'Summer', 'Spring']
seasons_list.count('Summer')


# <a id="tuple"> </a>
# ## 3. Tuple

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>9. Write a code to perform operations on tuple:<br><br>
#                         a. Check the length of num_tuple<br>
#                         b. Concatenate the num_tuple and mix_tuple<br>
#                         c. Repeat the mix_tuple two times
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Tuples to perform operations:**
# 
# num_tuple = (4, 4, 8)
# 
# mix_tuple = 'John', 5, -2

# **a. Check the length of num_tuple**

# In[25]:


num_tuple = (4, 4, 8)

mix_tuple = ('John', 5, -2)
len(num_tuple)


# **b. Concatenate the num_tuple and mix_tuple**

# In[26]:


num_tuple + mix_tuple


# **c. Repeat the mix_tuple two times**

# In[27]:


mix_tuple * 2 


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>10. Add a new element '4' to the given tuple</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the tuple below:**
# 
# mix_tuple = (['a', 1, True], 2, 'Science', -5)

# In[1]:


#tuple do not support append/insert
mix_tuple = (['a', 1, True], 2, 'Science', -5)
mix_tuple.append(4)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>11. Replace the elements in the given tuple: <br><br>
#                         a. Replace '2' with '3'<br>
#                         b. Replace 'True' in first element with 'False'
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the tuple below:**
# 
# mix_tuple = (['a', 1, True], 2, 'Science', -5)

# **a. Replace '2' with '3'**

# In[2]:


#tuple do not support remove function
mix_tuple = (['a', 1, True], 2, 'Science', -5)


# **b. Replace 'True' in first element of the tuple with 'False'**

# In[21]:


x = list(mix_tuple)
x[0][2] = False
x


# <a id="set"> </a>
# ## 4. Set

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>12. Write the program to perform following manipulations:<br><br>
#                         a. Add '7' to the given set<br>
#                         b. Remove '3' from a given set<br>
#                         c. Clear the set
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the below set for manipulation**
# 
# num_set = {1, 2, 3, 4, 5, 6}

# **a. Add '7' to the given set**

# In[36]:


num_set = {1, 2, 3, 4, 5, 6}
num_set.add(7)


# **b. Remove '3' from a given set**

# In[37]:


num_set.remove(3)


# **c. Clear the set**

# In[38]:


num_set.clear()


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>13. Create two sets of words from the given sentences and perform the following operations:<br><br>
#                         a. Find the count of unique words in each of the sentence<br> 
#                         b. Find the common words in both the sentences<br>
#                         c. Find the unique words in both the sentences
#                        </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the sentences given below:**
#     
# sentence_1 = 'We shall analyse the data using python' 
# 
# sentence_2 = 'Python for data science'

# **Create set of words**

# In[48]:


# type your code here
sentence_1 = 'We shall analyse the data using python' 
s1=set(sentence_1.split(" "))
len(s1)
sentence_2 = 'Python for data science'
s2=set(sentence_2.split(" "))


# **a. Find the number of unique words in the sentences**

# In[115]:


print(len(s1))
print(len(s2))


# **b. Find the common words in both the sentences**

# In[54]:


s1&s2


# **c. Find the unique words in both the sentences**

# In[110]:


s1^s2


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>14. Write a program to perform following set operations:<br><br>
#                         a. Union<br> 
#                         b. Intersection<br>
#                         c. Set of all the elements of set A that are not in set B<br>
#                         d. Set of all the elements of set B that are not in set A<br>
#                         e. Symmetric difference
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the below set:**
# 
# A = {1, 4, 5, 2, 6, 3, 40, 7, 87, 4, 71}
# 
# B = {3, 42, 51, 6, 7, 8, 54, 5}

# **a. Union**

# In[57]:


A = {1, 4, 5, 2, 6, 3, 40, 7, 87, 4, 71}
B = {3, 42, 51, 6, 7, 8, 54, 5}
A.union(B)


# **b. Intersection**

# In[58]:


A&B


# **c. Set of all the elements of set A that are not in set B**

# In[63]:


A-B


# **d. Set of all the elements of set B that are not in set A**

# In[106]:


B-A


# **e. Symmetric difference**

# In[65]:


A^B


# <a id="dict"> </a>
# ## 5. Dictionary

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>15. Write a code to add a key to a dictionary
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the given dictionary and add a key (4:16)**
# 
# square_dictionary = {1:1, 2:4, 3:9}

# In[67]:


square_dictionary = {1:1, 2:4, 3:9}
square_dictionary['4']='16'


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>16. Write a program to retrieve the keys/values of dictionary </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the dictionary**
# 
# mix_dictionary = {0:3, 'x':5, 1:2}

# In[72]:


mix_dictionary = {0:3, 'x':5, 1:2}
print(mix_dictionary.keys())
print(mix_dictionary.values())


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>17. Write a program to get the value for 'Age' from the dictionary</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the dictionary**
# 
# emp_record = {'Weight': 67, 'BMI': 25, 'Age': 27, 'Profession': 'CA'}

# In[73]:


emp_record = {'Weight': 67, 'BMI': 25, 'Age': 27, 'Profession': 'CA'}
emp_record['Age']


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>18. Write a program to create a dictionary using given keys and values</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the keys and values to create a dictionary**
# 
# key = ['a','b','c','d']
# 
# value = [1, 2, 3, 4]

# In[112]:


key = ['a','b','c','d']
value = [1, 2, 3, 4]
dict(zip(key,value))


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>19. Set the country of an employee as 'India' in the given employee record</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Use the dictionary**
# 
# emp_record = {'Emp_ID': 'ES001', 'Weight': 67, 'BMI': 25, 'Age': 27, 'Profession': 'CA'}

# In[104]:


emp_record = {'Emp_ID': 'ES001', 'Weight': 67, 'BMI': 25, 'Age': 27, 'Profession': 'CA'}
emp_record['Country'] = 'India'


# In[105]:


emp_record


# In[ ]:





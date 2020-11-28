#!/usr/bin/env python
# coding: utf-8

# <table align="center" width=100%>
#     <tr>
#         <td width="10%">
#             <img src="in_class.png">
#         </td>
#         <td>
#             <div align="center">
#                 <font color="#21618C" size=8px>
#                     <b> Inclass-Lab  <br>(Day 1)
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# ## Table of Content
# 
# 1. **[Using print()](#print)**
# 2. **[Data types](#types)**
# 3. **[Arithmetic Operations](#arithmetic)**
# 4. **[Boolean Operations](#boolean)**
# 5. **[Concatenation](#concatenation)**
# 6. **[Pseudo Codes](#pseudo)**
# 

# ### Let's begin with some hands-on practice exercises

# <a id="print"> </a>
# ## 1. Using print()

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>1. To display a statement. For example, "Hello, How are you?" </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[1]:


a='"Hello, How are you?"'
print(a)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>2. Display the following pattern using print() </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

#             *    
#            ***    
#           *****   
#          *******  
#         ********* 

# In[2]:


print('     *   ')
print('    ***   ')
print('   ******  ')
print('  ******** ')
print(' ********** ')


# In[3]:


for i in (1,3,5,7,9): #doubt 
    for x in (4,3,2):
        print(x*' '+ i*'*' + x*' ')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>3. Write the alphabets 'A', 'B', 'C' on new lines using a single print function. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[4]:


print("'A'\n'B'\n'C'")


# <a id="types"> </a>
# ## 2. Data types

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>4. Create a string, a numeric and boolean variables by assigning variable names. Further, check their datatype. For numeric variable check for whole numbers and numbers with decimal point.</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# **Declare a string variable and check its data type.**

# In[5]:


x = 'hello'
type(x)


# **Declare a numeric variable and check its data type.** <br>
# i. An interger variable.

# In[6]:


y = 51
type(y)


# ii. A fractional variable

# In[7]:


z = 5/2
type(z)


# **Declare a boolean variable and check its data type.**

# In[8]:


b = True
type(b)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>5. Write a complex number and assign it the name 'comp_var'</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[9]:


comp_var = 5 + 4j
type(comp_var)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>6. Convert a float variable f = 23.45 to integer.  </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[10]:


f =23.45; print(int(f))


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>7. Create a numberic variable and convert it to a string.</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[11]:


e = 1
str(e)


# <a id="arithmetic"></a>
# ## 3. Arithmetic Operations

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>8. Evaluate 145 into 354 minus 1345 divided by 45 plus (462 plus 23) divided by 3. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[12]:


(145 * 354) - 1345 / 45 + (462 + 23) / 3


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>9. Evaluate  and print the results of the following <br>
#                         <ol type = '1'> 
#                             <li> 1353 plus 234 </li> 
#                             <li> 2355 minus 346 </li>
#                             <li> 234 times 457 </li>
#                             <li> 25 divided by 6 </li>
#                             <li> Obtain remainder of  25 divided by 6 </li>
#                             <li> 33 raised to 4 </li> 
#                             <li> 45 divided by 6  (floor division)
#                             <li> 2 raised to 10</li></ol>
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[13]:


import math 
print('1.',1353 + 234)
print('2.',2355 - 346)
print('3.',234*457)
print('4.',25/6)
print('5.',math.remainder(25,6)) # % modulus 
print('6.',33**4) 
print('7.',math.floor(45/6)) # // for floor division 
print('8.',2**10)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>10. Calculate BMI of a person (take input for height and weight from user).</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[14]:


x = float(input('enter your weight: ' ))
y = float(input('enter your height: ' ))
print(x/(y**2))


# <a id="boolean"></a>
# ## 4. Boolean Operations

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>11. Check whether the expression (54+34)* 45 is equal to the expression (0.9*2432)/0.9 </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[18]:


(54+34)* 45 ==  (0.9*2432)/0.9


# <a id="concatenation"></a>
# ## 5. Concatenation

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>12. Create two strings and concatenate them using '+' operator. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[19]:


x = 'hello '
y  = 'world'
z = x + y 
print(z)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>13. Concatenate the variables 'num = 34 and 'string ='How old are you?' using '+' operator. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[20]:


num = 34
string = 'How old are you?'
add = num + string 


# <a id="pseudo"> </a>
# ## 6. Pseudo Codes

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>14. Write a pseudo code to print table of 5 using 'for' loop.</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[7]:


# take a variable
# create a range function till 11 
# create a for loop with temp variable and range function 
# print the function, 5 multiply with temp variable 


# In[21]:


for i in range(11):
    print('5','*',i,'=',5*i)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>15. Write a pseudo code for generating a fibonacci series starting with 0 and 1 for 10 values using while loop. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[6]:


# ask user to enter a number till the point fibnocci series is required.
# create a variable , assign value as starting point  0 
# create a new varibale with ,assign value 1 
# use if statement to check whether the number entered by the user is less the 0 
# if the number is less than 0 , show 0 as output 
# if not use else statement to print 


# In[3]:


a=int(input("Enter the terms"))
x=0                                         #first num 
y=1                                         #second num
if a<=0:
    print("The requested series is",a)
else:
    print(x,y,end=" ")
    for i in range(2,a):
        next=x+y                           
        print(next,end=" ")
        x=y
        y=next


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>16. Write a pseudo code to know whether a number is greater than the other using 'if' statement. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[8]:


# ask user to enter a number 
# ask user to enter 2nd number 
# use if else statement to check whether the the number entered is less than or greater than other num.


# In[23]:


x = int(input('enter a number: '))
y = int(input('enter a number: '))
if x > y :
    print(x ,'is greater than', y )
else:
    print(x , ' is less than ', y )


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>17. Write a pseudo code to check whether a number is divisible by 7 or not using if else statement. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[9]:


# ask user input to enter a num.
# use if else statement 
# if x id divisible by 7;print the number is divisible by 7 
# else print the number is not divisible by 7 


# In[24]:


x = int(input('enter a number: '))
if (x%7) == 0 :
    print(x, 'is divisible by 7 ')
else:
    print(x,'not divisible by 7 ')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>18. Write a pseudo code to find factorial of a number using nested if-else statement. </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[ ]:


# ask user to enter a number 
# use if statement to check whether the number entered is less than 0 
# if the the number entered is 0 print the factorial as 1 
# if the number is greater than calculate factorial 
# create a variable assign 1 


# In[18]:


x = int(input('enter a number: '))
factorial = 1

if x < 0:
    print("Factorial does not exist for negative numbers")
    if x == 0 :
        print ('Factorial of 0 is 1 ')
else:
    for i in range(1,x + 1):
        factorial = factorial*i
    print("The factorial of",x,"is",factorial)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>19. Write a pseudo to know whether a number is prime or not using for and if else statement.</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[ ]:


# ask user to enter a number
# create a empty list 
# start checking divisibilty of each number in list staring from 0 

# if the enumber exist in list or is divisible/multiple by any number present in list
# print it is not a prime number 
# if the number is not divisible or multiple of any number present in list print it is prime number 


# In[ ]:





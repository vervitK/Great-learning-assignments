#!/usr/bin/env python
# coding: utf-8

# <table align="center" width=100%>
#     <tr>
#         <td width="15%">
#             <img src="homework.png">
#         </td>
#         <td>
#             <div align="center">
#                 <font color="#21618C" size=8px>
#                     <b> Take-Home <br>(Day 1)
#                     </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# ### Let's begin with some hands-on practice exercises

# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>1. Write a program to convert the value of 'pi' to integer</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>
# 

# In[1]:


import math
x = math.pi
int(x)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>2. Find the remainder after dividing 542 by 16</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[2]:


y = 542 % 16
y


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>3.  Display the following pattern using single print() </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

#                                 *
#                                 **
#                                 ***
#                                 ****

# In[3]:


for i in (1,2,3,4):
    print(i*'*')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>4. Write a pseudo code to check whether an entered letter is a vowel or not </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[ ]:


# create a list with vowel in it as x
# ask user to enter a alphabet 
# convert the user input into  upper or lowwer depenting upon the values entered in x
# use if statement to check wheter if alphabet is presnet in x 
# if it exist in x print its a vowel 
# else print its not a vowel 


# In[4]:


x = ['A', 'E','I','O','U']
a = str(input('enter a alphabet ' ).upper())
if a in x :
    print('True: its a vowel')
else:
    print('Its not a vowel ')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>5. Write a program to swap the two integers passed as runtime variables</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>
# 

# In[8]:



x = 4
y = 151
var = x
x = y
y = var
print(x)
print(y)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>6. Write a program to print the product of two numbers 'x' and 'y' </b>
#                     <br><br>
#                     <b> x = 10 ; y = "15"  </b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[1]:


x = 10
y = "15"
print(x*y)


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b> 7. Write a pseudo code to check whether input is even number or odd number (take input from user)</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[ ]:


# ask user to enter a number 
# use if else statement to check whether the number is divisible by 2 
# if the number is divisible by 2 print "the number is divisible by 2 "
# else print 'this is odd number.'


# In[6]:


x = int(input('enter a number: ' ))
if (x%2)==0:
    print('This is a even number ', x)
else:
    print('This is odd number')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>8. Write a pseudo code to print whether a number is divisible by 9 and a multiple of 6 (take input from the user)</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[3]:


# ask user to enter a number 
# if the the number is divisible by 9 and multiple of 9 
# else print 'not a multiple of 6 or divisible by 9 '


# In[2]:


x = int(input('enter a number: ' ))
if (x%9)==0 and (x%6)==0  :
    print(x, 'is divisible by 9 and multiple of 6' )
else:
    print('not a multiple of 6 or divisible by 9 ')


# <table align="left">
#     <tr>
#         <td width="6%">
#             <img src="question_icon.png">
#         </td>
#         <td>
#             <div align="left", style="font-size:120%">
#                 <font color="#21618C">
#                     <b>9. Write a pseudo to take 5 values from user and print their average using while loop (take input from user)</b>
#                 </font>
#             </div>
#         </td>
#     </tr>
# </table>

# In[4]:


# create a empty list 
# create variable and assign 0 
# use while function to to run a loop 5 times 
# ask user to enter a number in a loop of 5 
# append the numbers into empty list 
# use sum function to add all the numbers in list and devide it by 5 
# use print to show output 


# In[8]:


y = []
x = 0 
while x < 5:
    x +=1
    a = int(input('enter a number: '))
    y.append(a)
print (sum(y)/5)
    


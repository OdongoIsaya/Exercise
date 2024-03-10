##object oreitned programmimg
class Computer:
    """class suite _Atrributes na dbehaviour or methods or behavoiur"""
    def config(self):
        print("i5 ,16gb ,1tb")
comp1=Computer()#object creation ,construction and inistantaition

comp2=Computer()
print(type(comp1))
Computer.config(comp1)
comp1.config()
comp2.config()




#### PRIVATE KEYS



""""Simple attempt to model a classs"""
class User:
    def __init__(self,first_name,last_name,**user_info):
        self.first_name=first_name
        self.last_name=last_name
        self.user_info=user_info
        user_info={"name":first_name, "last":last_name, **user_info}
    def describe_users(self):
        for key ,value in self.user_info.items():
            print(f"{key} --> {value}")


    def  greet_users(self):
        print(f"Hello {self.first_name} {self.last_name} Welcome to Silicon Valley ,Califonia")

user1 = User("isaya", "Rahul", Location="Mumbai", software_engineer="Solutions", jobcategory="CEO")
user1.greet_users()
user1.describe_users()
print(user1)




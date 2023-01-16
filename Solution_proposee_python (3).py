#print("launched on Anaconda")
#Conception time and Testing took me 1h222, including understanding the exercice. 
#Self-critic : 
  # Implementing the "two loop system" solution was the challenging thing i've faced in this exercice.
  # Even thought this method is adapted to this exercice, creating a two loop system isn't ideal in terms of complexity, if i had to deal with more results

height = [1,8,6,2,5,4,8,3,7]
class Solution:
    def maxArea(self, height: list[int]) -> int:
        gauche=0
        droite=len(height) - 1
        area= 0
        #print("French language : gauche = Left, droite = Right. French language allows me to distinguish variable names from other functions. I can do everything in ENG if need be")
        #print("Starting at line 0. This value cannot be negative, given the nature of the exercice")
        while gauche<droite:
            min_height=min(height[gauche], height[droite])
            area = max(area, (droite - gauche) * min_height)
            #print("Area is defined like this due to our container being a rectangle => multiply the length of the rectangle by the width of the rectangle")
            #print("First loop system, out of 2")
            if height[gauche] < height[droite]:
                gauche +=1
                while height[gauche]<min_height:
                    gauche +=1
                    #print("Second loop system, if not implemented the loop will only be activated once")
            else:
                droite -=1
                while height[droite]<min_height:
                    droite -=1
                    #print("Second loop system, if not implemented the loop will only be activated once")
        return area
#for execution
if __name__ == "__main__": #in case i want to use the class Solution with another file
    Classe1=Solution()
    print(Classe1.maxArea(height))
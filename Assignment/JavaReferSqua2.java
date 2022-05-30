// COMPLETE SQUARE
// EXPLANATION
// https://www.javatpoint.com/how-to-print-pattern-in-java
import java.util.Scanner;  
public class Main
{

public static void main(String[] args)    
{   
// input
int i, j, min, n; //n is the number up to you want to print  
System.out.print("Enter the value of n: ");  
Scanner sc= new Scanner(System.in);  
n=sc.nextInt();  
//-----------------------------------------
//loo for upper left part  
for (i = 1; i <= n; i++)    
{   
for (j = 1; j <= n; j++)   
{   
//is i < j; then min = i else min = j
min = i < j ? i : j;   
System.out.print(n - min + 1+ " ");   
}  
//loop for upper right part  
for (j = n - 1; j >= 1; j--)   
{   
min = i < j ? i : j;   
System.out.print(n - min + 1+ " ");   
}   
System.out.println();   
}   
//loop for lower left part  
for (i = n - 1; i >= 1; i--)    
{   
for (j = 1; j <= n; j++)    
{   
min = i < j ? i : j;   
System.out.print(n - min + 1+ " ");   
}   
//loop for lower right part  
for (j = n - 1; j >= 1; j--)    
{   
min = i < j ? i : j;   
System.out.print(n - min + 1+ " ");   
}   
System.out.println();   
}   
}   
}


package draft;

// COMPLETE SQUARE
// EXPLANATION
// https://www.javatpoint.com/how-to-print-pattern-in-java
import java.util.Scanner;

public class CSLLTSqua {

    public static void main(String[] args) {
// input
        int i, j, min, n; //n is the number up to you want to print  
//        System.out.print("Enter the value of n: ");
//        Scanner sc = new Scanner(System.in);
//        n = sc.nextInt();
        i=1;
        n = 4;
       
//-----------------------------------------
//loo for upper left part  
        for (i = 1; i <= 4; i++) { //---column - bx
            for (j = 1; j <= 4; j++) { // ||| row - cx
//is i < j; then min = i else min = j
//                min = i < j ? i : j; //4-1....1
                if (i < j) {
                    System.out.print(n - i + 1 + " ");
                } else {
                   System.out.print(n - j + 1 + " ");
                }
//                System.out.print(n - min + 1 + " ");
            }
//loop for upper right part  
//            for (j = n - 1; j >= 1; j--) {
//                min = i < j ? i : j;
//                System.out.print(n - min + 1 + " ");
//            }
            System.out.println();
        }
//loop for lower left part  
//        for (i = n - 1; i >= 1; i--) {
//            for (j = 1; j <= n; j++) {
//                min = i < j ? i : j;
//                System.out.print(n - min + 1 + " ");
//            }
////loop for lower right part  
//            for (j = n - 1; j >= 1; j--) {
//                min = i < j ? i : j;
//                System.out.print(n - min + 1 + " ");
//            }
//            System.out.println();
//        }
    }
}

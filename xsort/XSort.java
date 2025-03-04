/**
 * XSort class.
 * Demonstrates the use of external sorting algorithms on plain text.
 * 
 * @see     HeapSort
 * @see     MergeSort
 */
public class XSort {

    /**
     * Entry point.
     * Starts the XSort program in the command-line.
     * 
     * @param   args    The name of the plain text file to sort.
     */
    public static void main(String[] args) {
        
        System.out.println("Test for XSort...");

        if (args.length <1) {
            System.out.println("Usage: cat MobyDick.txt | java XSort 512 > Result.txt");
            System.exit(1);
        } else {
            /* Take input */
            /* Read input */
            /* Initial sort */
            /* Merge step */
        }
    }
}

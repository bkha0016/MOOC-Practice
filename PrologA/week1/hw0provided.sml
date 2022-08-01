(* Dan Grossman, Coursera PL, HW0 Provided Code *)



(* Do not change these: They should be correct after fixing the code above *)
(* 
C-x C-c: Quit Emacs

C-g: Cancel the current action

C-x C-f: Open a file (whether or not it already exists)

C-x C-s: Save a file

C-x C-w: Write a file (probably more familiar to you as Save as...)

Cut, copy, paste:

Highlight text with the mouse or by hitting C-Space to set a mark and then moving the cursor to highlight a region.

C-w: Cut a highlighted region

M-w: Copy a highlighted region

C-k: Cut (kill) from the cursor to the end of the line

C-y: Paste (yank)

Some other useful commands:

C-x 2: Split the window into 2 buffers, one above the other (Use the mouse or C-x o to switch between them)

C-x 0: Undo window-splitting so there is only 1 buffer

C-x b: Switch to another buffer by entering its name

C-x C-b: See a list of all current buffers

C-c C-s: to run the file 
*)

(* The line below is wrong -- replacing the addition, +, with
multiplication, *, will fix it *)

fun f(x,y) = x * y

fun double x = f(x,2)

fun triple x = f(3,x)

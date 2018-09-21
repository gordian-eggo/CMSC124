      * Ruz, Julianne Marie
      * 2014-04280
      * CMSC 124 B-3L
      * Exer 1.2: Continuation of exer01

       IDENTIFICATION DIVISION. 
        PROGRAM-ID. exer01-CMSC124.

       DATA DIVISION. 
        WORKING-STORAGE SECTION. 
        77 EXITED PIC 9 VALUE 0. 
        77 CHOICE PIC 9. 
        77 SCOUNT PIC 99 VALUE 1. 
      * variable for searching for student via student number
        77 looking_for PIC X(10). 
      * name iterator for for loop
        77 name_iterator PIC 9 VALUE 1. 
      * subject iterator 
        77 subj_iterator PIC 9 VALUE 1.
        77 chosen_one PIC 9 VALUE 0. 
      * temporary values for editing
        77 fname_temp PIC X(30). 
        77 lname_temp PIC X(20).
        77 course_temp PIC X(10).
        77 section_temp PIC X(5).
        77 found_student PIC 9 value 0.
      * yes or no choice
        77 yes_or_no PIC X(1). 
        01 students. 
         02 student OCCURS 10 TIMES. 
          03 surname PIC X(20). 
          03 firstname PIC X(30). 
          03 sNum PIC X(10). 
      * 1 if student has subjects, 0 if no subjects
          03 has_subjects PIC 9 VALUE 0.
          03 subj_slot PIC 9 VALUE 5.
          03 subj_count PIC 9 VALUE 1. 
          03 subjects. 
      * number of subjects
           04 subject OCCURS 5 TIMES. 
            05 csection PIC X(5). 
            05 coursecode PIC X(10). 

       PROCEDURE DIVISION. 
        MENU.  
        DISPLAY "[1] Add student". 
        DISPLAY "[2] Add subject to student". 
        DISPLAY "[3] Edit student". 
        DISPLAY "[4] Delete student". 
        DISPLAY "[5] View info of ONE student". 
        DISPLAY "[6] View info of ALL students". 
        DISPLAY "[7] Exit". 
        DISPLAY "Choice: " WITH NO ADVANCING. 
        ACCEPT CHOICE.
      
      * Add student function
        IF CHOICE = 1

         IF SCOUNT = 11
          DISPLAY " "
          DISPLAY "Student limit reached. Returning to menu..."
         ELSE 
          DISPLAY " "
          DISPLAY "Enter first name: " WITH NO ADVANCING
          ACCEPT firstname(SCOUNT)
          DISPLAY "Enter surname: " WITH NO ADVANCING
          ACCEPT surname(SCOUNT) 
          DISPLAY "Enter student number: " WITH NO ADVANCING
          ACCEPT sNum(SCOUNT) 
          DISPLAY " "
          DISPLAY "Student record successfully updated."
          DISPLAY " "
          DISPLAY "Current number of students: " SCOUNT
          DISPLAY " "
          ADD 1 TO SCOUNT GIVING SCOUNT
         END-IF 

        ELSE 
      * Add subject to student
        IF CHOICE = 2

         DISPLAY " "
         DISPLAY "Enter student number: " WITH NO ADVANCING
         ACCEPT looking_for
         PERFORM FIND_STUDENT VARYING name_iterator FROM 0 BY 1 UNTIL n
      -ame_iterator = 9
         DISPLAY " "
         DISPLAY "Name: " firstname(chosen_one)
         DISPLAY "Surname: " surname(chosen_one)
         DISPLAY " "
         COMPUTE subj_count(chosen_one) = subj_count(chosen_one) - 1
         DISPLAY "Number of subjects: " subj_count(chosen_one)
         COMPUTE subj_count(chosen_one) = subj_count(chosen_one) + 1
         DISPLAY "Enter course code: " WITH NO ADVANCING
         ACCEPT course_temp
         DISPLAY "Enter course section: " WITH NO ADVANCING
         ACCEPT section_temp
         DISPLAY " "
         DISPLAY "Course: " course_temp
         DISPLAY "Section: " section_temp
         DISPLAY " "
         DISPLAY "Accept changes? [y/n]: " WITH NO ADVANCING
         ACCEPT yes_or_no
          IF yes_or_no = "y"
           MOVE course_temp TO coursecode(chosen_one, subj_count(chosen
      -_one))
           MOVE section_temp TO csection(chosen_one, subj_count(chosen_
      -one))
           DISPLAY " "
           DISPLAY "Subject successfully added."
           DISPLAY " "
           COMPUTE subj_slot(chosen_one) = subj_slot(chosen_one) - 1
           COMPUTE subj_count(chosen_one) = subj_count(chosen_one) + 1
           MOVE 1 TO chosen_one
          ELSE

           DISPLAY " "
           DISPLAY "Operation terminated."
           DISPLAY " "

          END-IF

         ELSE

      * Edit student
        IF CHOICE = 3

         DISPLAY " "
         DISPLAY "Enter student number: " WITH NO ADVANCING
         ACCEPT looking_for
         PERFORM FIND_STUDENT VARYING name_iterator FROM 0 BY 1 UNTIL n
      -ame_iterator = 9
          DISPLAY " "
          DISPLAY "Name: " firstname(chosen_one)
          DISPLAY "Surname: " surname(chosen_one)
          DISPLAY " "
          DISPLAY "Edit which information?"
          DISPLAY "[1] First name"
          DISPLAY "[2] Surname"
          DISPLAY "[3] Both"
          DISPLAY "Choice: " WITH NO ADVANCING
          ACCEPT CHOICE

      * inner if statement for editing
          IF CHOICE = 1
           DISPLAY " "
           DISPLAY "Enter first name: " WITH NO ADVANCING
           ACCEPT fname_temp
           DISPLAY " "
           DISPLAY "First name: " fname_temp
           DISPLAY " "
           DISPLAY "Accept changes? [y/n]: " WITH NO ADVANCING
           ACCEPT yes_or_no

           IF yes_or_no = "y"

            MOVE fname_temp to firstname(chosen_one)
            DISPLAY " "
            DISPLAY "First name successfully changed."
            DISPLAY " "
            MOVE 1 TO chosen_one

           ELSE 

            DISPLAY " "
            DISPLAY "Operation terminated. Returning to menu..."
            DISPLAY " "

           END-IF

          ELSE

          IF CHOICE = 2

           DISPLAY " "
           DISPLAY "Enter last name: " WITH NO ADVANCING
           ACCEPT lname_temp
           DISPLAY " "
           DISPLAY "Last name: " lname_temp
           DISPLAY " "
           DISPLAY "Accept changes? [y/n]: " WITH NO ADVANCING
           ACCEPT yes_or_no

           IF yes_or_no = "y"

            MOVE lname_temp to surname(chosen_one)
            DISPLAY " "
            DISPLAY "Last name successfully changed."
            DISPLAY " "

           ELSE 

            DISPLAY " "
            DISPLAY "Operation terminated. Returning to menu..."
            DISPLAY " "

           END-IF

          ELSE

          IF CHOICE = 3

           DISPLAY " "
           DISPLAY "Enter first name: " WITH NO ADVANCING
           ACCEPT fname_temp
           DISPLAY "Enter last name: " WITH NO ADVANCING
           ACCEPT lname_temp
           DISPLAY " "
           DISPLAY "First name: " fname_temp
           DISPLAY "Last name: " lname_temp
           DISPLAY " "
           DISPLAY "Accept changes? [y/n]: " WITH NO ADVANCING
           ACCEPT yes_or_no

           IF yes_or_no = "y"

            MOVE fname_temp to firstname(chosen_one)
            MOVE lname_temp to surname(chosen_one)
            DISPLAY " "
            DISPLAY "First name and surname successfully changed."
            DISPLAY " "

           ELSE 

            DISPLAY " "
            DISPLAY "Operation terminated. Returning to menu..."
            DISPLAY " "

           END-IF

          END-IF

         ELSE 
      
      * Delete a student
        IF CHOICE = 4
         DISPLAY "under construction"
        ELSE

      * search for individual student
        IF CHOICE = 5

         DISPLAY " "
         DISPLAY "Enter student number: " WITH NO ADVANCING
         ACCEPT looking_for
         PERFORM FIND_STUDENT VARYING name_iterator FROM 0 BY 1 UNTIL n
      -ame_iterator = 9
         PERFORM SHOW_STUDENT
         MOVE 1 TO name_iterator
         MOVE 1 TO subj_iterator

        ELSE

      * Exit function
        IF CHOICE = 7 

         MOVE 1 TO EXITED

        ELSE

      * catching invalid input
         DISPLAY " "
         DISPLAY "Invalid input. Plase choose again."
         DISPLAY " "
         END-IF

        END-IF.  
        PERFORM MENU UNTIL EXITED = 1. 
        NEXT SENTENCE.

        FIND_STUDENT.
         IF looking_for EQUAL TO sNum(name_iterator)
          DISPLAY " "
          DISPLAY "Found student number " sNum(name_iterator) " in fil"
      - "es."
          DISPLAY " "
          MOVE name_iterator TO chosen_one
         ELSE 
          COMPUTE found_student = found_student + 1
          NEXT SENTENCE
         END-IF. 


        SHOW_STUDENT. 
         DISPLAY " ". 
         DISPLAY "Name: " firstname(chosen_one). 
         DISPLAY "Surname: " surname(chosen_one). 
         DISPLAY "Student number: " sNum(chosen_one). 
         DISPLAY " ". 
         DISPLAY "                  SUBJECTS". 
         DISPLAY " ". 
         PERFORM SHOW_ALL_SUBJECTS VARYING subj_iterator FROM 1 BY 1 UN
      -TIL subj_iterator GREATER THAN subj_count(chosen_one).

        SHOW_ALL_SUBJECTS.
         IF subj_iterator < subj_count(chosen_one) OR subj_iterator <5
          DISPLAY "Course: " coursecode(chosen_one, subj_iterator)
          DISPLAY "Course section: " csection(chosen_one, subj_itera
      -tor)
          DISPLAY " "
         ELSE
          NEXT SENTENCE
         END-IF.

        STOP RUN. 
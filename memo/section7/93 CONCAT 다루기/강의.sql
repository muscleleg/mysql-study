select CONCAT(author_fname," ", author_lname) from books;

select CONCAT_WS(" ",books.author_fname,books.author_lname) from  books; # 김 재준

select CONCAT_WS("-","2024","3","11") from  books; #2024-3-11
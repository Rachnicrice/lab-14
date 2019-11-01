-- Creating the bookshelves table in database
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Retrieving unique values from books table and insert into the bookshelves table
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

-- Adding a column to the books table containing the bookshelf_id for each book in the books table
 ALTER TABLE books ADD COLUMN bookshelf_id INT;

-- Connecting the bookshelves and books tables
 UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

-- Take out the bookshelf column from the books table
 ALTER TABLE books DROP COLUMN bookshelf;

-- Modifying the data type of the bookshelf_id to be a foreign key
 ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
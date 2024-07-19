#JIHAN HAIFA NABILAH 
#41823010096
#TUGAS BESAR 2


from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
import logging
from db import conn
app = FastAPI()



# Define the Book class
class Book:
    def __init__(self, judul, penulis, penerbit, tahun_terbit, konten, iktisar):
        self.judul = judul
        self.penulis = penulis
        self.penerbit = penerbit
        self.tahun_terbit = tahun_terbit
        self.konten = konten
        self.iktisar = iktisar

    def read(self, start_page, end_page):
        return '\n'.join(self.konten[start_page-1:end_page])

    def __str__(self):
        return f"{self.judul} by {self.penulis}"


class BookData(BaseModel):
    id: int
    judul: str
    penulis: str
    penerbit: str
    tahun_terbit: int
    konten: List[str]
    iktisar: str

log_config = logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("book_api")


#Create Buku
@app.post("/books/", response_model=BookData)
def create_book(book_data: BookData):
    logger.info(f"Creating new book: {book_data}")
    try:
        cursor = conn.cursor()
        query = "INSERT INTO books (judul, penulis, penerbit, tahun_terbit, konten, iktisar) VALUES (%s, %s, %s, %s, %s, %s)"
        values = (book_data.judul, book_data.penulis, book_data.penerbit, book_data.tahun_terbit, '\n'.join(book_data.konten), book_data.iktisar)
        cursor.execute(query, values)
        conn.commit()
        book_data.id = cursor.lastrowid
        cursor.close()
        return book_data
    except Exception as e:
        logger.error(f"Error creating book: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")

#Get Buku
@app.get("/books/{book_id}", response_model=BookData)
def get_book(book_id: int):
    logger.info(f"Getting book with ID: {book_id}")
    try:
        cursor = conn.cursor()
        query = "SELECT id, judul, penulis, penerbit, tahun_terbit, konten, iktisar FROM books WHERE id=%s"
        cursor.execute(query, (book_id,))
        book_data = cursor.fetchone()
        cursor.close()
        if book_data is None:
            raise HTTPException(status_code=404, detail="Not Found")
        return BookData(
            id=book_data[0], judul=book_data[1], penulis=book_data[2], penerbit=book_data[3], tahun_terbit=book_data[4], konten=book_data[5].splitlines(), iktisar=book_data[6]
        )
    except HTTPException as e:
        logger.warning(f"Book not found: {book_id}")
        raise e
    except Exception as e:
        logger.error(f"Error getting book: {e}")
        raise HTTPException(status_code=500, detail="Internal Server Error")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="localhost", port=8000)
<?php

declare(strict_types=1);

require_once __DIR__ . '/vendor/autoload.php'; // si usas Composer y PSR-4

use App\Entities\Article;
use App\Entities\Book;
use App\Entities\Author;
use App\Repositories\AuthorRepository;
use App\Repositories\BookRepository;
use App\Repositories\ArticleRepository;

// Instancia del repositorio
$repository = new BookRepository();
$repositoryAr = new ArticleRepository();
$repositoryAut = new AuthorRepository();

// Probar findAll()
$books = $repository->findAll();
$articles = $repositoryAr->findAll();
$autors = $repositoryAut->findALL();

/*
echo "LISTA DE LIBROS \n";
foreach ($books as $book) {
    echo "Publication ID:".$book->getId().PHP_EOL;
    echo "Título: " . $book->getTitle() . PHP_EOL;
    echo "Autor: " . $book->getAuthor()->getFirstName() . PHP_EOL;
    echo "ISBN: " . $book->getIsbn() . PHP_EOL;
    echo "-----" . PHP_EOL;
}

 echo "LISTA DE ARTICULOS \n";
foreach ($articles as $article) {
    echo "Publication ID:".$article->getId().PHP_EOL;
    echo "Título: " . $article->getTitle() . PHP_EOL;
    echo "Autor: " . $article->getAuthor()->getFirstName(). PHP_EOL;
    echo "DOI: " . $article->getDoi() . PHP_EOL;
    echo "-----" . PHP_EOL;
}

 echo "LISTA DE AUTORES \n";
foreach ($autors as $autor) {
    echo "Autor ID: ".$autor->getId().PHP_EOL;
    echo "Nombre: " .$autor->getFirstName() . PHP_EOL;
    echo "Apellido: " .$autor->getLastName() . PHP_EOL;
    echo "Password: " .$autor->getPassword() . PHP_EOL;
    echo "Orcid: " . $autor->getOrcid() . PHP_EOL;
    echo "-----" . PHP_EOL;
}

//Probar FindById

 echo "BOOK por ID \n";
 $bookID=$repository->findByID(1);
 echo "Publication ID: ".$bookID->getId().PHP_EOL;
 echo "Titulo: ".$bookID->getTitle().PHP_EOL;
 echo "Descripcion: ".$bookID->getDescription().PHP_EOL;
 echo "Fecha: ".$bookID->getId().PHP_EOL;
 echo "Author ID: ".$bookID->getAuthor()->getId().PHP_EOL;
 echo "Author Firstname: ".$bookID->getAuthor()->getFirstName().PHP_EOL;
 echo "Author Lastname: ".$bookID->getAuthor()->getLastName().PHP_EOL;
 echo "ISBN: ".$bookID->getIsbn().PHP_EOL;
 echo "Genero: ".$bookID->getEdition().PHP_EOL;
 echo "Edicion: " .$bookID->getGender().PHP_EOL;
  echo "-----" . PHP_EOL;

 echo "ARTICLE por ID \n";
 $articleID=$repositoryAr->findByID(2);
 echo "Publication ID: ".$articleID->getId().PHP_EOL;
 echo "Titulo: ".$articleID->getTitle().PHP_EOL;
 echo "Descripcion: ".$articleID->getDescription().PHP_EOL;
 echo "Fecha: ".$articleID->getId().PHP_EOL;
 echo "Author ID: ".$articleID->getAuthor()->getId().PHP_EOL;
 echo "Author Firstname: ".$articleID->getAuthor()->getFirstName().PHP_EOL;
 echo "Author Lastname: ".$articleID->getAuthor()->getLastName().PHP_EOL;
 echo "DOI: ".$articleID->getDoi().PHP_EOL;
 echo "Abstract: ".$articleID->getAbstract().PHP_EOL;
 echo "Keywords: " .$articleID->getKeywords().PHP_EOL;
 echo "Indexacion: " .$articleID->getIndexacion().PHP_EOL;
 echo "Magazine: " .$articleID->getMagazine().PHP_EOL;
 echo "Area: " .$articleID->getArea().PHP_EOL;
  echo "-----" . PHP_EOL;

 echo "AUTHOR por ID \n";
 $authorID=$repositoryAut->findByID(1);
 echo "Autor ID: ".$authorID->getId().PHP_EOL;
 echo "Nombre: " .$authorID->getFirstName() . PHP_EOL;
 echo "Apellido: ".$authorID->getLastName() . PHP_EOL;
 echo "Password: ".$authorID->getPassword() . PHP_EOL;
 echo "Orcid: " .$authorID->getOrcid() . PHP_EOL;
 echo "-----" . PHP_EOL;
 
//Probar create (Crear un objeto de la entidad)
// Probar create Book
$bookObject = new Book(
    (int)null, // ID (null para nuevo registro)
    'New Book Title 2', // Título
    'This is a new book description.', // Descripción
    new \DateTime('2024-10-02'), // Fecha
    $repositoryAut->findByID(1), // Autor (objeto Author)
    '978-3-16-148410-0', // ISBN
    'Fiction', // Género
    1 // Edición
);
$createBook = $repository->create($bookObject);
if ($createBook) {
    echo "Libro creado correctamente.\n";
} else {
    echo "Error al crear el libro.\n";
}

// Probar create Author
$authorObject = new Author(
    0, // ID autoincremental
    'Ibeth', // Nombre
    'Arevalo', // Apellido
    'ibetharevalo', // Username
    'ibarevalo@espe.edu.ec', // Email
    'password125', // Password plano
    '0000-0006-7890-1234', // Orcid
    'UFA-ESPE' // Affiliation
);
$authorObject->setPassword('password125'); // Hashea el password
$createAuthor = $repositoryAut->create($authorObject);
if ($createAuthor) {
    echo "Autor creado correctamente.\n";
} else {
    echo "Error al crear el autor.\n";
}

// Probar create Article
$articleObject = new Article(
    (int)null, // ID (null para nuevo registro)
    'New Article Title 2', // Título
    'This is a new article description.', // Descripción
    new \DateTime('2024-10-03'), // Fecha
    $repositoryAut->findByID(1), // Autor (objeto Author)
    '10.1234/abcd.2024.01', // DOI
    'Resumen del artículo', // Abstract
    'PHP, MySQL', // Keywords
    'Scopus', // Indexacion
    'Magazine Name', // Magazine
    'Programming' // Area
);
$createArticle = $repositoryAr->create($articleObject);
if ($createArticle) {
    echo "Artículo creado correctamente.\n";
} else {
    echo "Error al crear el artículo.\n";
}

*/


// Probar Update Book
$bookToUpdate = new Book(
    117, // ID existente
    'Updated Book Title 2',
    'Updated book description 2.',
    new \DateTime('2024-11-01'),
    $repositoryAut->findByID(1),
    '978-3-16-148410-3', // Es unico, si se repite no funciona la transaccion
    'Drama',
    2
);
$updateBook = $repository->update($bookToUpdate);
if ($updateBook) {
    echo "Libro actualizado correctamente.\n";
} else {
    echo "Error al actualizar el libro.\n";
}

/*
// Probar Delete Book
$deleteBook = $repository->delete(73); // ID existente
if ($deleteBook) {
    echo "Libro eliminado correctamente.\n";
} else {
    echo "Error al eliminar el libro.\n";
}

// Probar Update Author
$authorToUpdate = new Author(
    6, // ID existente
    'Betsy',
    'Gomez',
    'betsygomez2',
    'ana.gomez@espe.edu.ec',
    'password123',
    '0000-0006-7890-1234', 
    'UFA-ESPE'
);
$authorToUpdate->setPassword('newpassword456');
$updateAuthor = $repositoryAut->update($authorToUpdate);
if ($updateAuthor) {
    echo "Autor actualizado correctamente.\n";
} else {
    echo "Error al actualizar el autor.\n";
}

// Probar Delete Author

$deleteAuthor = $repositoryAut->delete(7); // ID existente
if ($deleteAuthor) {
    echo "Autor eliminado correctamente.\n";
} else {
    echo "Error al eliminar el autor.\n";
}

// Probar Update Article
$articleToUpdate = new Article(
    74, // ID existente
    'Updated Article Title 2',
    'Updated article description 2.',
    new \DateTime('2024-11-02'),
    $repositoryAut->findByID(1),
    '10.1234/abcd.2024.02',
    'Nuevo resumen del artículo',
    'PHP, MySQL, Update',
    'Scopus',
    'Updated Magazine',
    'Web Development'
);
$updateArticle = $repositoryAr->update($articleToUpdate);
if ($updateArticle) {
    echo "Artículo actualizado correctamente.\n";
} else {
    echo "Error al actualizar el artículo.\n";
}

// Probar Delete Article
$deleteArticle = $repositoryAr->delete(70); // ID existente
if ($deleteArticle) {
    echo "Artículo eliminado correctamente.\n";
} else {
    echo "Error al eliminar el artículo.\n";
}

*/

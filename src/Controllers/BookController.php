<?php

declare(strict_types=1);

namespace App\Controllers;

use App\Entities\Book;
use App\Repositories\AuthorRepository;
use App\Repositories\BookRepository;

class BookController
{
    private BookRepository $bookRepository;
    private AuthorRepository $authorRepository;

    public function __construct()
    {
        $this->bookRepository = new BookRepository();
        $this->authorRepository = new AuthorRepository();
    }

    public function bookToArray(Book $book): array
    {
        return [
            'id' => $book->getId(),
            'title' => $book->getTitle(),
            'description' => $book->getDescription(),
            'publication_date' => $book->getPublicationDate()->format('Y-m-d'),
            'author' => [
                'id' => $book->getAuthor()->getId(),
                'first_name' => $book->getAuthor()->getFirstName(),
                'last_name' => $book->getAuthor()->getLastName()
            ],
            'isbn' => $book->getIsbn(),
            'gender' => $book->getGender(),
            'edition' => $book->getEdition()
        ];
    }

    public function handle(): void
    {
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];


        if ($method === 'GET') {
            if (isset($_GET['id'])) {
                $book = $this->bookRepository->findById((int)$_GET['id']);
                echo json_encode($book ? $this->bookToArray($book) : null);
            } else {
                $list = array_map(
                    fn(Book $book) => $this->bookToArray($book),
                    $this->bookRepository->findAll()
                );
                echo json_encode($list);
            }
            return;
        }

        $payLoad = json_decode(file_get_contents('php://input'), true);

        if ($method === 'POST') {
            $author = $this->authorRepository->findById((int)$payLoad['author']) ?? 0;
            if (!$author) {
                http_response_code(400);
                echo json_encode(['error' => 'Autor no encontrado']);
                return;
            }

            $book = new Book(
                0,
                $payLoad['title'],
                $payLoad['description'],
                new \DateTime($payLoad['publication_date'] ?? 'now'),
                $author,
                $payLoad['isbn'],
                $payLoad['gender'],
                $payLoad['edition']
            );

            echo json_encode(['Success' => $this->bookRepository->create($book)]);

        }

        if($method === 'PUT'){
            $id =(int)$payLoad['id'] ?? 0;
            $existting = $this->bookRepository->findByID($id);
            //Verificar que el libro exista
            if(!$existting){
                http_response_code(404);
                echo json_encode(['error'=>'Book not found']);
                return;
            }
            //Verificar que el autor exista
            if(isset($payLoad['author'])){
                $author = $this->authorRepository->findById((int)$payLoad['author']);
                if ($author) $existting->setAuthor($author);
            }

            //verificar que los campos esten llenos

            if (isset($payLoad['title'])) $existting->setTitle($payLoad['title']);
            if (isset($payLoad['description'])) $existting->setTitle($payLoad['description']);
            if (isset($payLoad['publication_date'])) {
                 $existting->setPublicationDate( new \DateTime ($payLoad['publication_date']));
                }
            if (isset($payLoad['isbn'])) $existting->setIsbn($payLoad['isbn']);
            if (isset($payLoad['gender'])) $existting->setGender($payLoad['gender']);
            if (isset($payLoad['edition'])) $existting->setEdition($payLoad['edition']);



        }

        if($method === 'DELETE'){
            echo json_encode(['Success'=> $this->bookRepository->delete((int)$payLoad['id'] ?? 0)]);
        }

        http_response_code(405);
        echo json_encode(['error'=>'Metodo no permitido']);
    }
}
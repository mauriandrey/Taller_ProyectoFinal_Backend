<?php
declare(strict_types=1);
namespace App\Controllers;

use App\Entities\Author;
use App\Repositories\AuthorRepository;


class AuthorController
{
    //Aqui se realizan todas las operaciones relacionadas con los Autores
    private AuthorRepository $authorRepository;
    

    public function __construct()
    {
        $this->authorRepository = new AuthorRepository;
    }

    //Metodo hace fechas

    public function authorToArray(Author  $author): array
    {
        return [
                'id' => $author->getId(),
                'first_name' => $author->getFirstName(),
                'last_name' => $author->getLastName(),
        ];
    }

    public function handle():void{
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];

        if($method === 'GET'){
            if(isset($_GET['id'])){
                $author = $this->authorRepository->findByID((int) $_GET['id']);
                echo json_encode($author?$this->authorToArray($author) : null);
            }else{
                $list = array_map([$this, 'authorToArray'], $this->authorRepository->findAll());
                echo json_encode($list);
            }
            return;
        }

        $payload = json_decode(file_get_contents('php://input'),true);

        if($method === 'POST'){
            $author=$this->authorRepository->findByID((int)$payload['authorid']) ?? 0;
            if($author){
                http_response_code(400);
                echo json_encode(['error'=>'Invalid Author']);
                return;
            }

            $author = new Author (
                (int)null,
                $payload['first_name'],
                $payload['last_name'],
                $payload['username'],
                $payload['email'],
                $payload['password'],
                $payload['orcid'],
                $payload['affiliation']
            );
            echo json_encode(['Success' =>$this->authorRepository -> create($author)]);
        }
        
    }
}
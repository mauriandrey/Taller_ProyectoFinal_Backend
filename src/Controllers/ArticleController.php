<?php
declare(strict_types=1);
namespace App\Controllers;


use App\Entities\Article;
use App\Repositories\AuthorRepository;
use App\Repositories\ArticleRepository;


class ArticleController
{
    //Aqui se realizan todas las operaciones relacionadas con los Articulos
    private ArticleRepository $articleRepository;
    private AuthorRepository $authorRepository;
    

    public function __construct()
    {
        $this->articleRepository = new ArticleRepository;
        $this->authorRepository = new AuthorRepository;
    }

    //Metodo hace fechas

    public function articleToArray(Article  $article): array
    {
        return [
            'id' => $article->getId(),
            'title' => $article->getTitle(),
            'description' => $article->getDescription(),
            'publication_date' => $article->getPublicationDate()->format('Y-m-d'),
            'author' => [
                'id' => $article->getAuthor()->getId(),
                'first_name' => $article->getAuthor()->getFirstName(),
                'last_name' => $article->getAuthor()->getLastName(),
            ],
            'doi' => $article->getDoi(),
            'abstract' => $article->getAbstract(),
            'keywords' => $article->getKeywords(),
            'indexacion' => $article->getIndexacion(),
            'magazine' => $article->getMagazine(),
            'area' => $article->getArea()
        ];
    }

    public function handle():void{
        header('Content-Type: application/json');
        $method = $_SERVER['REQUEST_METHOD'];

        if($method === 'GET'){
            if(isset($_GET['id'])){
                $article = $this->articleRepository->findByID((int) $_GET['id']);
                echo json_encode($article?$this->articleToArray($article) : null);
            }else{
                $list = array_map([$this, 'articleToArray'], $this->articleRepository->findAll());
                echo json_encode($list);
            }
            return;
        }

        $payload = json_decode(file_get_contents('php://input'),true);

        if($method === 'POST'){
            $author=$this->authorRepository->findByID((int)$payload['author']) ?? null;
            if(!$author){
                http_response_code(400);
                echo json_encode(['error'=>'Invalid Author']);
                return;
            }

            $article = new Article (
                (int)null,
                $payload['title'],
                $payload['description'],
                new \DateTime( $payload['publication_date'] ?? 'now'),
                $author,
                $payload['doi'],
                $payload['abstract'],
                $payload['keywords'],
                $payload['indexacion'],
                $payload['magazine'],
                $payload['area']

            );

            echo json_encode(['Success' =>$this->articleRepository -> create($article)]);
        }

        
        if($method === 'PUT'){
            $id = (int)($payload['id'] ?? 0);
            $existing = $this->articleRepository->findByID($id);
            // Verificar que el articulo exista
            if(!$existing){
                http_response_code(404);
                echo json_encode(['error'=>'Article not found']);
                return;
            }
            // Verificar que el autor exista
            if(isset($payload['author'])){
                $author = $this->authorRepository->findByID((int)$payload['author']);
                if ($author) $existing->setAuthor($author);
            }
            // Actualizar campos si están presentes
            if (isset($payload['title'])) $existing->setTitle($payload['title']);
            if (isset($payload['description'])) $existing->setDescription($payload['description']);
            if (isset($payload['publication_date'])) {
                $existing->setPublicationDate(new \DateTime($payload['publication_date']));
            }
            if (isset($payload['doi'])) $existing->setDoi($payload['doi']);
            if (isset($payload['abstract'])) $existing->setAbstract($payload['abstract']);
            if (isset($payload['keywords'])) $existing->setKeywords($payload['keywords']);
            if (isset($payload['indexacion'])) $existing->setIndexacion($payload['indexacion']);
            if (isset($payload['magazine'])) $existing->setMagazine($payload['magazine']);
            if (isset($payload['area'])) $existing->setArea($payload['area']);

            // Ejecutar la actualización
            $success = $this->articleRepository->update($existing);
            if ($success) {
                echo json_encode(['Success'=>'Articulo actualizado correctamente']);
            } else {
                http_response_code(500);
                echo json_encode(['error'=>'Error al actualizar el articulo']);
            }
            return;
        }

        if($method === 'DELETE'){
            $id = (int)($payload['id'] ?? 0);
            $success = $this->articleRepository->delete($id);
            if ($success) {
                echo json_encode(['Success'=>'Articulo eliminado correctamente']);
            } else {
                http_response_code(500);
                echo json_encode(['error'=>'Error al eliminar el articulo']);
            }
            return;
        }

        http_response_code(405);
        echo json_encode(['error'=>'Metodo no permitido']);
 
        
    }
}
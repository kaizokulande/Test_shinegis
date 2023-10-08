<?php

namespace App\Controller;

use App\Entity\Equipement;
use App\Repository\EquipementRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class EquipementsController extends AbstractController
{
    // fonction API pour ajouter un equipement
    #[Route('api/ajouter', name:'ajouter', methods:'POST')]
    public function ajout_equipement(Request $request, SerializerInterface $serializer, EntityManagerInterface $em, ValidatorInterface $validator): Response
    {
        $req = $request->getContent();
        try {
            $equipement = $serializer->deserialize($req, Equipement::class, 'json');
            $errors = $validator->validate($equipement);
            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }
            $em->persist($equipement);
            $em->flush();
            return $this->json($equipement);
        } catch (NotEncodableValueException $e) {
            return $this->json([
                'status' => 400,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    // fonction API pour modifier un équipement
    #[Route('/api/modifier/{id<\d+>}', name:'modifier', methods:'PUT')]
    public function modifier_equipement(Request $request, EquipementRepository $eqprepository, $id, EntityManagerInterface $em, ValidatorInterface $validator, SerializerInterface $serializer): Response
    {
        $equipement = $eqprepository->find($id);
        $req = $request->getContent();
        try {
            $serializer->deserialize($req, Equipement::class, 'json', [AbstractNormalizer::OBJECT_TO_POPULATE => $equipement]);
            $errors = $validator->validate($equipement);
            if (count($errors) > 0) {
                return $this->json($errors, 400);
            }
            $em->persist($equipement);
            $em->flush();
            return $this->json($equipement);
        } catch (NotEncodableValueException $e) {
            return $this->json([
                'status' => 400,
                'message' => $e->getMessage(),
            ], 400);
        }
    }

    // fonction API pour supprimer un équipement
    #[Route('/api/supprimer/{id<\d+>}', name: 'supprimer', methods:'DELETE')]
    public function suppr_voiture(EquipementRepository $eqprepository, $id, EntityManagerInterface $em): Response
    {
        $equipement = new Equipement();
        $equipement = $eqprepository->find($id);
        $em->remove($equipement);
        $em->flush();
        return $this->json('Equipement supprimé.');
    }

    // fonction API pour afficher les équipements non supprimé avec filtre par categorie   order_name(ex:name,categorie,created_at,...)    order(desc ou asc)
    #[Route('/api/equipements/{categorie?}/{order_name?}/{order?}', name: 'equipements', methods: 'GET')]
    public function index(EquipementRepository $equipRepository, $categorie, $order_name, $order): Response
    {
        $order_name = $order_name ?: 'createdAt';
        $order = $order ?: 'desc';
        if (null == $categorie) {
            $equipements = $equipRepository->findOrderby($order_name, $order);
        } else {
            $equipements[] = $equipRepository->findBy(['categorie' => $categorie], [$order_name => $order]);
        }
        return $this->json($equipements);
    }
}

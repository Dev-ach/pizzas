<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;
use App\Entity\Pizza;
use App\Entity\Ingredient;
use App\Entity\commande;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\DataType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/")
     */
/**
 * @Route("/")
 * @Template()
 */
public function indexAction()
{
    return [];
}
  

    /**
     * @Route("/pizzas", name="pizzas_list")
     * @Template()
     */
    public function pizzasAction()
    {  
        $em = $this->getDoctrine()->getManager();
        
        $pizzas = $em->getRepository(Pizza::class)
        ->findAll();
     
        return $this->render('default/pizzas.html.twig', ['pizzas' => $pizzas]);
        
    }
        /**
     * @Route("/ingredients", name="ingredients_list")
     * @Template()
     */
    public function ingredientsAction()
    {  
        $em = $this->getDoctrine()->getManager();
        
        $ingredients = $em->getRepository(Ingredient::class)
        ->findAll();
     
        return $this->render('default/ingredients.html.twig', ['ingredients' => $ingredients]);
        
    }
    /**
     * @Route("ajouter-pizza",name="ajouter-pizza")
     */

     public function register_pizza(Request $request)
     {
         $pz =new Pizza();


         $form= $this->createFormBuilder($pz)
         ->add('name',TextType::class)
         ->add('description',TextType::class)
         ->add('price',TextType::class)
         ->add('Register',SubmitType::class,array('label'=>'create pizza'))
         ->getForm();
        // die("sub");

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
           

            $nom = $form['name']->getData();
            $description = $form['description']->getData();
            $prix = $form['price']->getData();
           
            $pz->setPrice($prix);
            $pz->setName($nom);
            $pz->setDescription($description);

            $em=$this->getDoctrine()->getManager();

            $em->persist($pz);

            $em->flush();
    
    
        }


         return $this->render('default/pizza_form.html.twig',array('form'=>$form->createView(),
        ));
     }

     /**
     * @Route("ajouter-commande",name="ajouter-commande")
     */

     public function register_commande(Request $request)
     {
         $cm =new commande();


         $form= $this->createFormBuilder($cm)
         ->add('adresse',TextType::class)
         ->add('nom',TextType::class)
         ->add('numt',TextType::class)
         ->add('Register',SubmitType::class,array('label'=>'create commande'))
         ->getForm();
        // die("sub");

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
           

            $adresse = $form['adresse']->getData();
            $nom = $form['nom']->getData();
            $numt = $form['numt']->getData();
           
            $cm->setAdresse($adresse);
            $cm->setNom($nom);
            $cm->setNumt($numt);

            $em=$this->getDoctrine()->getManager();

            $em->persist($cm);

            $em->flush();
    
    
        }


         return $this->render('default/command_form.html.twig',array('form'=>$form->createView(),
        ));
     }

     /**
     * @Route("commander",name="commande")
     */
    public function commandesAction()
    {  
        $em = $this->getDoctrine()->getManager();
        
        $commandes = $em->getRepository(commande::class)
        ->findAll();
     
        return $this->render('default/commandes.html.twig', ['commandes' => $commandes]);
        
    }
}
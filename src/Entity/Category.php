<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CategoryRepository")
 */
class Category
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Beer", mappedBy="category")
     */
    private $beers;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function __toString()
    {
        return $this->name;
    }

    /**
     * Get the value of beers
     */ 
    public function getBeers()
    {
        return $this->beers;
    }

    /**
     * Set the value of beers
     *
     * @return  self
     */ 
    public function setBeers($beers)
    {
        $this->beers = $beers;

        return $this;
    }
}

<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=BeerRepository::class)
 */
class Beer
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $name;

    /**
     * @ORM\Column(type="decimal", precision=3, scale=1)
     */
    private $alcohol;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $origin;

    /**
     * @ORM\Column(type="string", length=30)
     */
    private $brewingType;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class)
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\OneToMany(targetEntity=BeerScoreComment::class, mappedBy="beer")
     */
    private $Id;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="beers")
     * @ORM\JoinColumn(nullable=false)
     */
    private $user;

    /**
     * @ORM\OneToOne(targetEntity=Image::class, cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $image;

    public function __construct()
    {
        $this->Id = new ArrayCollection();
    }

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

    public function getAlcohol(): ?string
    {
        return $this->alcohol;
    }

    public function setAlcohol(string $alcohol): self
    {
        $this->alcohol = $alcohol;

        return $this;
    }

    public function getOrigin(): ?string
    {
        return $this->origin;
    }

    public function setOrigin(string $origin): self
    {
        $this->origin = $origin;

        return $this;
    }

    public function getBrewingType(): ?string
    {
        return $this->brewingType;
    }

    public function setBrewingType(string $brewingType): self
    {
        $this->brewingType = $brewingType;

        return $this;
    }

    public function getCategory(): ?category
    {
        return $this->category;
    }

    public function setCategory(?category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function addId(BeerScoreComment $id): self
    {
        if (!$this->Id->contains($id)) {
            $this->Id[] = $id;
            $id->setBeer($this);
        }

        return $this;
    }

    public function removeId(BeerScoreComment $id): self
    {
        if ($this->Id->contains($id)) {
            $this->Id->removeElement($id);
            // set the owning side to null (unless already changed)
            if ($id->getBeer() === $this) {
                $id->setBeer(null);
            }
        }

        return $this;
    }

    public function getUser(): ?user
    {
        return $this->user;
    }

    public function setUser(?user $user): self
    {
        $this->user = $user;

        return $this;
    }

    public function getImage(): ?image
    {
        return $this->image;
    }

    public function setImage(image $image): self
    {
        $this->image = $image;

        return $this;
    }
}

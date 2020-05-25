<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @UniqueEntity(fields={"username"}, message="There is already an account with this username")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @ORM\Column(type="string", length=16)
     */
    private $username;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;    

    /**
     * @ORM\OneToMany(targetEntity=Beer::class, mappedBy="user")
     */
    private $beers;

    /**
     * @ORM\OneToMany(targetEntity=BeerScoreComment::class, mappedBy="user")
     */
    private $scoreComments;

    public function __construct()
    {
        $this->beers = new ArrayCollection();
        $this->Id = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

   public function getRoles(): array
   {
       $roles = $this->roles;
       // guarantee every user at least has ROLE_USER
       $roles[] = 'ROLE_USER';

       return array_unique($roles);
   }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    public function getUsername(): ?string
    {
        return $this->username;
    }

    public function setUsername(string $username): self
    {
        $this->username = $username;

        return $this;
    }

    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @return Collection|Beer[]
     */
    public function getBeers(): Collection
    {
        return $this->beers;
    }

    public function addBeer(Beer $beer): self
    {
        if (!$this->beers->contains($beer)) {
            $this->beers[] = $beer;
            $beer->setUser($this);
        }

        return $this;
    }

    public function removeBeer(Beer $beer): self
    {
        if ($this->beers->contains($beer)) {
            $this->beers->removeElement($beer);
            // set the owning side to null (unless already changed)
            if ($beer->getUser() === $this) {
                $beer->setUser(null);
            }
        }

        return $this;
    }

    public function addId(BeerScoreComment $id): self
    {
        if (!$this->Id->contains($id)) {
            $this->Id[] = $id;
            $id->setUser($this);
        }

        return $this;
    }

     /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
    
    public function removeId(BeerScoreComment $id): self
    {
        if ($this->Id->contains($id)) {
            $this->Id->removeElement($id);
            // set the owning side to null (unless already changed)
            if ($id->getUser() === $this) {
                $id->setUser(null);
            }
        }

        return $this;
    }

    public function __toString()
    {
        return $this->getUsername();
    }

    /**
     * Get the value of scoreComments
     */ 
    public function getScoreComments()
    {
        return $this->scoreComments;
    }

    /**
     * Set the value of scoreComments
     *
     * @return  self
     */ 
    public function setScoreComments($scoreComments)
    {
        $this->scoreComments = $scoreComments;

        return $this;
    }
}
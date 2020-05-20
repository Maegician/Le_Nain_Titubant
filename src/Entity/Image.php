<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints as Assert;


/**
 * @ORM\Entity(repositoryClass="App\Repository\ImageRepository")
 * @ORM\HasLifecycleCallbacks
 */
class Image
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
    private $name = '';

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $path;

    /**
     * @var UploadedFile
     * 
     * @Assert\Image()
     */
    private $file;

    /**
     * @var ?string
     * 
     * Chemin de l'ancien fichier en cas de modification
     */
    private $oldPath;

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

    public function getPath(): ?string
    {
        return $this->path;
    }

    public function setPath(string $path): self
    {
        $this->path = $path;

        return $this;
    }

    /**
     * Get the value of file
     *
     * @return  UploadedFile
     */ 
    public function getFile()
    {
        return $this->file;
    }

    /**
     * Set the value of file
     *
     * @param  UploadedFile  $file
     *
     * @return  self
     */ 
    public function setFile(UploadedFile $file)
    {
        $this->oldPath = $this->path; // enregistre le path avant de le mettre à vide pour supprimer l'ancien fichier lors de l'upload
        $this->path = ''; // Modifie le path pour forcer Doctrine à faire la requête et uploader le nouveau fichier
        $this->file = $file;

        return $this;
    }
    
    /**
    * Retourne l'emplacement des fichiers
    */
    public function getPublicRootDir()
    {
        return __DIR__.'/../../public/uploads/images/';
    }

    /**
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function generatePath()
    {
        if ($this->file instanceof UploadedFile) {
            // Génére le chemin (nom) du fichier à uploader, guessExtension retourne l'extension du fichier uploadé
            $this->path = uniqid('img_').'.'.$this->file->guessExtension();
            // path à img_154a854f8ds6d9.png
            $this->name = $this->file->getClientOriginalName();
        }
    }

    /**
    * @ORM\PostPersist()
    * @ORM\PostUpdate()
    */
    public function upload()
    {
        // Supprime l'ancien fichier s'il existe
        if (is_file($this->getPublicRootDir().$this->oldPath)) {
            unlink($this->getPublicRootDir().$this->oldPath);
        }
        // Test si $file est bien du bon type
        if ($this->file instanceof UploadedFile) {
            // Déplace le fichier uploadé vers le dossier uploads
            $this->file->move($this->getPublicRootDir(), $this->path);
        }
    }

     /**
     * @ORM\PreRemove()
     */
    public function remove()
    {
        // Test si le fichier existe
        if (is_file($this->getPublicRootDir().$this->path)) {
            unlink($this->getPublicRootDir().$this->path);
        }
    }

    public function __toString()
    {
        return $this->name;
    }

    /**
     * Retourne le lien pour afficher l'image (peut être inclus dans une balise img)
     */
    public function getWebPath()
    {
        return '/uploads/images/'.$this->path;
    }

}



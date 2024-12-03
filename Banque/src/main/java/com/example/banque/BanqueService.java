package com.example.banque;
import java.math.BigDecimal;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;

@Path("banque")

public class BanqueService {
	@Autowired
	private CompteRepository compteRepository;

	@GET
	@Path("/comptes/{numeroCompte}")
	@Produces(MediaType.APPLICATION_JSON)
	public Compte getCompte(@PathParam("numeroCompte") String numeroCompte) {
		Optional<Compte> compte = compteRepository.findById(numeroCompte);
		return compte.orElse(null);
	}
	
	@PUT
	@Path("/comptes/{numeroCompte}/crediter/{montant}")
	@Produces(MediaType.APPLICATION_JSON)
	public Compte crediterCompte(@PathParam("numeroCompte") String numeroCompte, @PathParam("montant") BigDecimal montant) {
		Optional<Compte> compte = compteRepository.findById(numeroCompte);
		if (compte.isPresent()) {
			Compte c = compte.get();
			c.setSolde(c.getSolde().add(montant));
			compteRepository.save(c);
			return c;
		}
		return null;
	}
	@Path("/comptes/{numeroCompte}")
    @DELETE
    @Produces(MediaType.TEXT_PLAIN)
    public Response supprimerCompte(@PathParam("numeroCompte") String numeroCompte) {
        Optional<Compte> compte = compteRepository.findById(numeroCompte);
        if (compte.isPresent()) {
            compteRepository.delete(compte.get());
            return Response.ok("Le compte avec le numéro " + numeroCompte + " a été supprimé.").build();
        } else {
            return Response.status(Response.Status.NOT_FOUND)
                    .entity("Le compte avec le numéro " + numeroCompte + " n'a pas été trouvé.")
                    .build();
        }
	}
	@Path("/comptes")
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response ajouterCompte(Compte nouveauCompte) {
        if (compteRepository.existsById(nouveauCompte.getNumeroCompte())) {
            return Response.status(Response.Status.CONFLICT)
                    .entity("Le compte avec le numéro " + nouveauCompte.getNumeroCompte() + " existe déjà.")
                    .build();
        }
        compteRepository.save(nouveauCompte);
        return Response.status(Response.Status.CREATED).entity(nouveauCompte).build();
    }
}

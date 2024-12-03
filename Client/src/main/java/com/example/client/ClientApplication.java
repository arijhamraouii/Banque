package com.example.client;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.core.MediaType;

@SpringBootApplication
@RestController
public class ClientApplication {

	public static void main(String[] args) {
		SpringApplication.run(ClientApplication.class, args);
	}

	@GetMapping("/consulterCompte")
	public String consulterCompte() {
		Client client = ClientBuilder.newClient();
		String result = client.target("http://localhost:8084/banque/comptes/123456")
				.request(MediaType.APPLICATION_JSON).get(String.class);
		return result;
	}
}
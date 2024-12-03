package com.example.banque;
import org.glassfish.jersey.server.ResourceConfig;
import org.springframework.context.annotation.Configuration;

@Configuration

public class JerseyConfig extends ResourceConfig{
	public JerseyConfig() {
		register(BanqueService.class);
	}
}

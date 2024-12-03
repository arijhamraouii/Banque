package com.example.satisfaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;

@RestController
@RequestMapping("/satisfactions")
public class SatisfactionController {

    @Autowired
    private SatisfactionRepository satisfactionRepository;
    
    @PostMapping("/ajouter")
    public ResponseEntity<Satisfaction> ajouterSatisfaction(@RequestBody Satisfaction satisfaction) {
        satisfaction.setDateHeure(LocalDateTime.now());
        Satisfaction nouvelleSatisfaction = satisfactionRepository.save(satisfaction);
        return ResponseEntity.ok(nouvelleSatisfaction);
    }
}

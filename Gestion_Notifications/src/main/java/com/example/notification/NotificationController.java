package com.example.notification;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/notifications")
public class NotificationController {

    @Autowired
    private NotificationRepository notificationRepository;

    @PostMapping("/envoyer")
    public Notification envoyerNotification(@RequestBody Notification notification) {
        return notificationRepository.save(notification);
    }

    @GetMapping("/historique/{numeroCompte}")
    public List<Notification> historiqueNotifications(@PathVariable String numeroCompte) {
        return notificationRepository.findAll().stream()
                .filter(n -> n.getNumeroCompte().equals(numeroCompte))
                .toList();
    }
}

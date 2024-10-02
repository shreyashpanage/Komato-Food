package com.example.fullstack_java_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.*;

@RestController
@CrossOrigin(origins = "*")
public class ControllerClass {

    @Autowired
    private ServiceClass serviceClass;

    @Autowired
    private EmailServiceClass emailServiceClass;

    @Autowired
    OrderStoringServiceClass orderStoringServiceClass;


    @PostMapping("/register")
    public ResponseEntity<String> registration(@RequestBody UserModalRegistrationClass newUser) {
        serviceClass.registration(newUser);
        return ResponseEntity.ok("Registration successful");
    }

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestBody UserModalLoginClass user) {
        String name = serviceClass.isOldUser(user);
        if (!name.equals(null)) {
            return ResponseEntity.ok(name);
        }
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body("No account found");
    }

    @PostMapping("/order")
    public ResponseEntity<String> order(@RequestBody OrderRequestClass orderRequest) {
        
        emailServiceClass.sendEmail(orderRequest.getEmail(), "Thanks for Ordering , Enjoy your meal , Have a nice day");
        return ResponseEntity.ok("Sent Successfully");
    
    }

    @PostMapping("/storedata")
    public ResponseEntity<String> storeOrder(@RequestBody OrderStoreModalClass orderStoreModalClass){
        orderStoringServiceClass.storeOrder(orderStoreModalClass);
        return ResponseEntity.ok("Order Store to Database "+orderStoreModalClass.getEmail()+orderStoreModalClass.getImage()+orderStoreModalClass.getName());
    }

    @GetMapping("/retrieveData")
    public List<OrderStoreModalClass> retrieveWholeData(@RequestParam String email){
        List<OrderStoreModalClass> data = orderStoringServiceClass.retrieveOrder(email);
        return data;
    }

}

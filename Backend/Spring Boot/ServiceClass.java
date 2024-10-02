package com.example.fullstack_java_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceClass {

    @Autowired
    RegistorUserRepository registorUserRepository;

    public String isOldUser(UserModalLoginClass user){
        UserModalRegistrationClass user1 = registorUserRepository.findByEmailAndPassword(user.getEmail(), user.getPassword());
        if(user.getEmail().equals(user1.getEmail()) && user.getPassword().equals(user1.getPassword())){
            return user1.getFirstName();
        }else{
            return null;
        }
    }
    
    public void registration(UserModalRegistrationClass newUser){
        registorUserRepository.save(newUser);
    }

}

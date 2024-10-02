package com.example.fullstack_java_project;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistorUserRepository extends JpaRepository<UserModalRegistrationClass,Long>{
    public UserModalRegistrationClass findByEmailAndPassword(String email,String password);
}

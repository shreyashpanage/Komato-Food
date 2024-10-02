package com.example.fullstack_java_project;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;


public interface StoringFoodDataRepository extends JpaRepository<OrderStoreModalClass,Long> {
    List<OrderStoreModalClass> findByEmail(String email);
}

package com.example.fullstack_java_project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderStoringServiceClass {

    @Autowired
    StoringFoodDataRepository storingFoodDataRepository;

    public void storeOrder(OrderStoreModalClass orderStoreModalClass){
        storingFoodDataRepository.save(orderStoreModalClass);
    }

    public List<OrderStoreModalClass> retrieveOrder(String email){
        return storingFoodDataRepository.findByEmail(email);
    }
    
}

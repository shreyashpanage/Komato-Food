package com.example.fullstack_java_project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceClass {

    @Autowired
    private JavaMailSender javaMailSender;
    private String fromEmailId = "patilsburger@gmail.com";

    public void sendEmail(String recipient, String body){

        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        simpleMailMessage.setFrom(fromEmailId);
        simpleMailMessage.setTo(recipient);
        simpleMailMessage.setText(body);
        simpleMailMessage.setSubject("Patil's Burger");
        javaMailSender.send(simpleMailMessage);

    }

}

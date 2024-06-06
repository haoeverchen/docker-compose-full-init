package com.example.backend.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

@CrossOrigin
@RestController
@RequestMapping("/")
public class TestController {
    @GetMapping("/get")
    public String getMessageFromBack() {
        return "Hello from Back!";
    }

    @GetMapping("/getRandom")
    public Map<String, String> getRandom() {
        Map<String, String> returnMap = new HashMap<>();
        returnMap.put("message", "Random num is: " + Math.random());
        return returnMap;
    }
}

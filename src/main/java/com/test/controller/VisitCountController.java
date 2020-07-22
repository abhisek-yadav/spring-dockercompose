package com.test.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.Jedis;

@RestController
public class VisitCountController {

    @GetMapping("/ping")
    public String ping() {
        System.err.println("ping call");
        return "Hello World!";
    }

    @GetMapping("/visits")
    public String visitCount() {
        Jedis jedis = new Jedis("redis");

        String visits = jedis.get("visit");
        if (visits != null) {
            jedis.set("visit", String.valueOf(Integer.parseInt(visits) + 1));
            return visits;
        } else {
            jedis.set("visit", String.valueOf(1));
            return String.valueOf(0);
        }
    }

}

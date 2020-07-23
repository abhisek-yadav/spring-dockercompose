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
    try (Jedis jedis = new Jedis(System.getenv("REDIS_HOST"))) {

      // to test the environment variables passed via docker-compose file
      //  System.err.println(System.getenv("REDIS_HOST"));
      // System.err.println(System.getenv("REDIS_PORT"));

      // to test the restart policy
      // System.exit(0);

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

}

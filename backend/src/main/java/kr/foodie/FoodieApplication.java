package kr.foodie;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class FoodieApplication implements WebMvcConfigurer {

    public static void main(String[] args) {
        SpringApplication.run(FoodieApplication.class, args);
    }

}

package org.example.last_java_project.Config;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.client.WebClient;


import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConfigurationProperties(prefix = "openrouter.api")
@Data
public class OpenRouterConfig {
    private String key;
    private String baseUrl;
    private String model;
    private Double temperature = 0.7;
    private Integer maxTokens = 1000;
}
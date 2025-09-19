package com.spring_metrics_demo.demo;

import java.util.Random;

import io.micrometer.core.instrument.Gauge;
import org.springframework.stereotype.Component;

import io.micrometer.core.instrument.MeterRegistry;

@Component
public class RandomMetricConfig {

    private final Random random = new Random();
    private double currentValue = 0;

    public RandomMetricConfig(MeterRegistry registry) {
        Gauge.builder("custom_random_metric", this, RandomMetricConfig::getCurrentValue)
                .description("Random value between 10 and 50")
                .register(registry);
    }

    public double getCurrentValue() {
        currentValue = 10 + random.nextInt(41); // 10–50
        return currentValue;
    }
}
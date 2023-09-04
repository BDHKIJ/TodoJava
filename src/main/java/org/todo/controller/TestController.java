package org.todo.controller;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class TestController {
	@Scheduled(cron = "*/10 * * * * *")
	public void ina() {
		log.info("확인용");
	}
}

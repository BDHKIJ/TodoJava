package org.todo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.todo.domain.DataVO;
import org.todo.mapper.DataMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class DataServicelmpi implements DataService {
	@Setter(onMethod_ = {@Autowired})
	private DataMapper mapper;

	@Override
	public void register(DataVO dvo) {
		mapper.datainsert(dvo);
	}

	@Override
	public List<DataVO> show(DataVO dvo) {
		return mapper.show(dvo);
	}

	@Override
	public int del(DataVO dvo) {
		log.info("매퍼 확인 : ");
		return mapper.remove(dvo);
	}
	
	
}

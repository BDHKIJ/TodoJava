package org.todo.service;

import java.util.List;

import org.todo.domain.DataVO;

public interface DataService {
	public void register(DataVO dvo);
	public List<DataVO> show(DataVO dvo);
	public int del(DataVO dvo);
}

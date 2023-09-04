package org.todo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.todo.domain.DataVO;

public interface DataMapper {
	public void datainsert(DataVO dvo);
	public List<DataVO> show(DataVO dvo);
	public int remove(DataVO dvo);
}

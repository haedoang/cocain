package kr.co.cocain.repository.mapper;

import java.util.List;

import kr.co.cocain.repository.domain.Qna;

public interface QnaMapper {

	List<Qna> listqna();
	
	int listqnaCount();

	void writeqna(Qna qna);
	
	Qna detailqna(int no);

	void deleteqna(int no);

	void updateqna(Qna qna);
	
}

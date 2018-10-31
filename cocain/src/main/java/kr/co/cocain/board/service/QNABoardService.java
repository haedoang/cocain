package kr.co.cocain.board.service;

import java.util.List;

import kr.co.cocain.repository.domain.Qna;


public interface QNABoardService {
	
	List<Qna> listqna();
	int listCount();
	
	void write(Qna qna);
	
	Qna detail(int no);

	void delete(int no);
	
	void update(Qna qna);
	
}

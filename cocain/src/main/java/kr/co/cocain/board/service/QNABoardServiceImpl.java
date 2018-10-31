package kr.co.cocain.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.mapper.QnaMapper;

@Service
public class QNABoardServiceImpl  implements QNABoardService{

    @Autowired
    QnaMapper mapper;
    
	@Override
	public List<Qna> listqna() {
		return mapper.listqna();
	}
	@Override
	public void write(Qna qna) {
		mapper.writeqna(qna);
	}
	@Override
	public Qna detail(int no) {
		return mapper.detailqna(no);
	}
	@Override
	public void delete(int no) {
		mapper.deleteqna(no);
	}
	@Override
	public int listCount() {
		return mapper.listqnaCount();
	}
	@Override
	public void update(Qna qna) {
		mapper.updateqna(qna);
		
	}

}

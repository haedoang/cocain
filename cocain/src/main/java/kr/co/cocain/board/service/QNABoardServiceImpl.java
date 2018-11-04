package kr.co.cocain.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.board.service.QNABoardService;
import kr.co.cocain.repository.domain.Qna;
import kr.co.cocain.repository.domain.QnaComment;
import kr.co.cocain.repository.domain.QnaPage;
import kr.co.cocain.repository.mapper.QnaMapper;

@Service
public class QNABoardServiceImpl  implements QNABoardService{

    @Autowired
    QnaMapper mapper;
    
	@Override
	public Map<String,Object> listqna(QnaPage qnaPage) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.listqna(qnaPage));
		return map;
	}
	@Override
	public void write(Qna qna) {
		mapper.writeqna(qna);
	}
	@Override
	public Qna detail(int no) {
		mapper.viewCnt(no);
		return mapper.detailqna(no);
	}
	@Override
	public void delete(int no) {
		mapper.deleteqna(no);
	}
	@Override
	public int listCount() {
		return mapper.listCount();
	}
	@Override
	public void viewCnt(int no) {
		mapper.viewCnt(no);
	}
	@Override
	public void update(Qna qna) {
		mapper.updateqna(qna);
	}
	@Override
	public List<QnaComment> listComment(int no) {
		return mapper.listComment(no);
	}
	@Override
	public void insertComment(QnaComment comment) {
		mapper.insertComment(comment);
	}
	@Override
	public void deleteComment(int no) {
		mapper.deleteComment(no);
	}
	@Override
	public void updateComment(QnaComment comment) {
		mapper.updateComment(comment);
	}
	@Override
	public int commentCnt(int no) {
		return mapper.commentCount(no);
	}
	@Override
	public void selectAnswerList(int no) {
		mapper.selectAnswerList(no);
		
	}
	@Override
	public void selectAnswerComment(int no) {
		mapper.selectAnswerComment(no);
		
	}
	// 채택답변여부 확인하기
	@Override
	public int answerCount(int no) {
		return mapper.answerCount(no);
	}

}

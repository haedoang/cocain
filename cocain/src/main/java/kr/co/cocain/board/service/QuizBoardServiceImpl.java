package kr.co.cocain.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.QuizBoard;
import kr.co.cocain.repository.domain.QuizBoardSearch;
import kr.co.cocain.repository.domain.QuizComment;
import kr.co.cocain.repository.domain.QuizPage;
import kr.co.cocain.repository.domain.QuizSubmit;
import kr.co.cocain.repository.mapper.QuizMapper;

@Service
public class QuizBoardServiceImpl  implements QuizBoardService{
	
	@Autowired
	QuizMapper mapper;
	
	//dqlist.. 
	@Override
	public Map<String,Object> selectDQList(QuizPage quizPage) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectDQList(quizPage));
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());
			
		return map;
	}

	//uqlist..
	@Override
	public Map<String, Object> selectUQList(QuizPage quizPage) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectUQList(quizPage));
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());		
		return map;	
	}

	@Override
	public Map<String, Object> onLoadForm() {
		Map<String,Object> map = new HashMap<>();
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());
		return map;
	}

	@Override
	public void insertQuizBoard(QuizBoard quizBoard) {
		mapper.insertQuizBoard(quizBoard);
	}

	@Override
	public Map<String, Object> selectQuizBoardByNo(int quizNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("category", mapper.selectCategory());
		map.put("level", mapper.selectLevel());
		map.put("detail", mapper.selectQuizBoardByNo(quizNo));
		map.put("comment", mapper.selectCommentByNo(quizNo));
		
		return map;
	}
	
	//정답 호출 ajax 
	@Override
	public int selectQuizCorrect(QuizBoard quizBoard) {
		return mapper.selectQuizCorrect(quizBoard);
	}

	@Override
	public void deleteQuizBoard(int quizNo) {
		mapper.deleteQuizBoard(quizNo);	
	}


	@Override
	public int selectDQListCount() {
		return mapper.selectDQListCount();
	}

	@Override
	public int selectUQListCount() {
		return mapper.selectUQListCount();
	}

	@Override
	public Map<String, Object> selectSubmitList(QuizPage quizPage) {
		Map<String,Object> map = new HashMap<>();
		map.put("list", mapper.selectSubmitList(quizPage));
		return map;
	}

	@Override
	public int selectSubmitListCount() {
		return mapper.selectSubmitListCount();
	}

	@Override
	public void insertQuizSubmit(QuizSubmit quizSubmit) {
		//submit 등록 및 quizBoard tryCnt 추가하기 
		mapper.insertQuizSubmit(quizSubmit);
		mapper.updateBoardTryCnt(quizSubmit.getQuizNo());
	}

	@Override
	public void updateQuizBoard(QuizBoard quizBoard) {
		mapper.updateQuizBoard(quizBoard);	
	}

	@Override
	public void insertComment(QuizComment quizComment) {
		mapper.insertComment(quizComment);		
	}

	@Override
	public List<QuizComment> selectCommentByNo(int QuizNo) {
		return mapper.selectCommentByNo(QuizNo);		
	}

	@Override
	public void deleteComment(int comNo) {
		mapper.deleteComment(comNo);
		
	}

	@Override
	public void updateComment(QuizComment quizComment) {
		mapper.updateComment(quizComment);	
	}

	@Override
	public Map<String,Object> selectSearchBoard(QuizBoardSearch quizBoardSearch) {
		Map<String,Object> map = new HashMap<>();
		map.put("list",mapper.selectSearchBoard(quizBoardSearch));
		map.put("category",mapper.selectCategory());
		map.put("level",mapper.selectLevel());
		return map;
	}

	@Override
	public int selectSearchBoardCount(QuizBoardSearch quizBoardSearch) {
		return mapper.selectSearchBoardCount(quizBoardSearch);
	}

	@Override
	public int selectSubmitUser(QuizSubmit quizSubmit) {
		return mapper.selectSubmitUser(quizSubmit);
	}

	@Override
	public void updateSubmitEvaluation(QuizSubmit quizSubmit) {
		//evaluation 변경 
		mapper.updateSubmitEvaluation(quizSubmit);
		
		//y이면  해당 게시글 정답 증가. // 회원점수증가.
		String result = quizSubmit.getEvaluation();
		if(result.charAt(0)=='y') {
			mapper.updateBoardAnsCnt(quizSubmit.getQuizNo());	
			mapper.updateUserPoint(quizSubmit);
		}
		
	}
	

	
}

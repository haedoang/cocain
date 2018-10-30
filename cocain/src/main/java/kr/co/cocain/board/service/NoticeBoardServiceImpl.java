package kr.co.cocain.board.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.cocain.repository.domain.Notice;
import kr.co.cocain.repository.domain.NoticeComment;
import kr.co.cocain.repository.domain.NoticePage;
import kr.co.cocain.repository.domain.NoticeRecom;
import kr.co.cocain.repository.mapper.NoticeMapper;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

    @Autowired
    NoticeMapper mapper;
    
    @Override
    public int listCount() {
        return mapper.listCount();
    }

    public List<Notice> listNotice(NoticePage page) {
        return mapper.listNotice(page);
    }

    @Override
    public Notice detail(int no) {
        return mapper.detailNotice(no);
    }

    @Override
    public void write(Notice notice) {
        mapper.writeNotice(notice);
    }

    @Override
    public void delete(int no) {
        mapper.deleteNotice(no);
    }

    @Override
    public void update(Notice notice) {
        mapper.updateNotice(notice);
    }

	@Override
	public int recom(NoticeRecom notice) {
		return mapper.selectRecom(notice);
	}

	@Override
	public int insertRecom(NoticeRecom recom) {
		return mapper.insertRecom(recom);
	}

	@Override
	public int deleteRecom(NoticeRecom recom) {
		return mapper.deleteRecon(recom);
	}
	
	@Override
	public List<NoticeComment> listComment(int no) {
		return mapper.listComment(no);
	}


    
}

package com.greedy.shortcut.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.BoardMapper;
import com.greedy.shortcut.board.model.dto.BoardDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;
	
	 @Autowired
	   public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	 }
	
	
	@Override
	public boolean newBoard(BoardDTO board) {
		
		int result = boardMapper.newBoard(board);
		
	      return result >= 1 ? true : false;
	   }
	


	@Override
	public List<MemberDTO> selectMember(int pjtNo) {
		return boardMapper.selectMember(pjtNo);
	}


	@Override
	public boolean insertnewBoard(BoardDTO newboard) {
		
		return boardMapper.insertnewBoard(newboard);
	}


	@Override
	public List<BoardDTO> selectboardList(int sprNo) {
		
		return boardMapper.selectboardList(sprNo);
	}


	@Override
	public int modifyBoardOrder(List<BoardDTO> boardList) {
		
		Map<String, List<BoardDTO>> boardMap = new HashMap<>();
		boardMap.put("boardList", boardList);
		 
		return boardMapper.modifyBoardOrder(boardMap);
	}

}

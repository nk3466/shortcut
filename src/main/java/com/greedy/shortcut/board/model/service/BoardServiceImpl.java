package com.greedy.shortcut.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greedy.shortcut.board.model.dao.BoardMapper;
import com.greedy.shortcut.board.model.dto.BoardDTO;

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
	public List<BoardDTO> selectBoard() {
		  return boardMapper.selectBoard();
	   }

}

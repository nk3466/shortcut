package com.greedy.shortcut.board.model.service;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BoardDTO;

public interface BoardService {

	boolean newBoard(BoardDTO board);

	List<BoardDTO> selectBoard();


}

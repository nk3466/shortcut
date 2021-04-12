package com.greedy.shortcut.board.model.dao;

import java.util.List;

import com.greedy.shortcut.board.model.dto.BoardDTO;

public interface BoardMapper {

	int newBoard(BoardDTO board);

	List<BoardDTO> selectBoard();

}

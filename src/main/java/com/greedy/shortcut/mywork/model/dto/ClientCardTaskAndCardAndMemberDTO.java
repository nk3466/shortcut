package com.greedy.shortcut.mywork.model.dto;

import com.greedy.shortcut.board.model.dto.CardDTO;
import com.greedy.shortcut.member.model.dto.MemberDTO;

public class ClientCardTaskAndCardAndMemberDTO {

	private CardDTO card;
	private ClientCardDTO cardDTO;
	private MemberDTO memberDTO;
	
	public ClientCardTaskAndCardAndMemberDTO() {}

	public ClientCardTaskAndCardAndMemberDTO(CardDTO card, ClientCardDTO cardDTO, MemberDTO memberDTO) {
		super();
		this.card = card;
		this.cardDTO = cardDTO;
		this.memberDTO = memberDTO;
	}

	public CardDTO getCard() {
		return card;
	}

	public void setCard(CardDTO card) {
		this.card = card;
	}

	public ClientCardDTO getCardDTO() {
		return cardDTO;
	}

	public void setCardDTO(ClientCardDTO cardDTO) {
		this.cardDTO = cardDTO;
	}

	public MemberDTO getMemberDTO() {
		return memberDTO;
	}

	public void setMemberDTO(MemberDTO memberDTO) {
		this.memberDTO = memberDTO;
	}

	@Override
	public String toString() {
		return "ClientCardTaskAndCardAndMember [card=" + card + ", cardDTO=" + cardDTO + ", memberDTO=" + memberDTO
				+ "]";
	}
	
	
}

package com.greedy.shortcut.mywork.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.greedy.shortcut.member.model.dto.MemberDTO;
import com.greedy.shortcut.mywork.model.dto.ClientCardDTO;
import com.greedy.shortcut.mywork.model.dto.ClientTaskDTO;
import com.greedy.shortcut.mywork.model.dto.MyworkResponseCardAndTaskDTO;
import com.greedy.shortcut.mywork.model.service.MyworkService;

@Controller
@RequestMapping("/*")
public class MyworkController {
	private MyworkService myworkService;
	
	@Autowired
	public MyworkController(MyworkService myworkService) {
		this.myworkService = myworkService;
	}
	
	
	@GetMapping("mywork/mywork")
	public String Mywork(Principal principal, Model model) {
		/*1. 전체 카드 개수  */ // selectAllCardCount (memNo)
		/*2. 요청 전체 카드 개수 */ // selectTaskTypeCount(memNo, int type)
		/*3. 진행 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*4. 완료 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*5. 보류 전체 카드 개수  */ // selectTaskTypeCount(memNo, int type)
		/*6. 요청 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		//   (PageNum*3 - 2 ) ~ (PageNum*3) 번호까지 조회 해서 전달  
		/*7. 완료 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		/*8. 진행 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		/*9. 보류 카드 3개 (최초 1번부터 3번까지) */ // selectTaskTypeList(memNo, int type, PageNum)
		
		
		System.out.println("메소드 진입 ");
		
		String userName = principal.getName();
		System.out.println("userName: " + userName);
		
		MemberDTO member = myworkService.selectUserInfoOne(userName);
		System.out.println("member : " + member);
		
		//List<ClientCardDTO> cardList = new ArrayList<>();
		//cardList = myworkService.selectCardList(member.getNo()); 
		List<MyworkResponseCardAndTaskDTO> cardList = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress1List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress2List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress3List = new ArrayList<>();
		List<MyworkResponseCardAndTaskDTO> cardProgress4List = new ArrayList<>();
		
		cardList = myworkService.selectTaskList(member.getNo()); 
		
		for(MyworkResponseCardAndTaskDTO card : cardList) {
			System.out.println("card: " + card);
			switch(card.getTkProgress()) {
			case 1: cardProgress1List.add(card); break;
			case 2: cardProgress2List.add(card); break;
			case 3: cardProgress3List.add(card); break;
			case 4: cardProgress4List.add(card); break;
			default : /* 에러 페이지 발생 필요 */
			}
		}
		
		model.addAttribute("cardProgress1List",cardProgress1List);
		model.addAttribute("cardProgress2List",cardProgress2List);
		model.addAttribute("cardProgress3List",cardProgress3List);
		model.addAttribute("cardProgress4List",cardProgress4List);
		
		return "mywork/mywork";
		
		
	}
	

}

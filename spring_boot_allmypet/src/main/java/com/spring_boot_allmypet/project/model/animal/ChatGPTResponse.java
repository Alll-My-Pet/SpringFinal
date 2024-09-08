package com.spring_boot_allmypet.project.model.animal;

import java.util.ArrayList;
import java.util.List;

public class ChatGPTResponse {
	private List<Choice> choices;

	// 기본 생성자 추가
	public ChatGPTResponse(String reply) {
		this.choices = new ArrayList<>();
		this.choices.add(new Choice(new Message("assistant", reply)));
	}

	// Getters and Setters
	public List<Choice> getChoices() {
		return choices;
	}

	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}

	public static class Choice {
		private Message message;

		// 생성자 추가
	    public Choice(Message message) {
	        this.message = message;
	    }

		// Getters and Setters
		public Message getMessage() {
			return message;
		}

		public void setMessage(Message message) {
			this.message = message;
		}
	}

	public static class Message {
		// role: 메시지를 보낸 주체(예: "user" 또는 "assistant")를 저장
		private String role;
		private String content;

		 // 생성자 추가
	    public Message(String role, String content) {
	        this.role = role;
	        this.content = content;
	    }

		// Getters and Setters
		public String getRole() {
			return role;
		}

		public void setRole(String role) {
			this.role = role;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}
	}
}

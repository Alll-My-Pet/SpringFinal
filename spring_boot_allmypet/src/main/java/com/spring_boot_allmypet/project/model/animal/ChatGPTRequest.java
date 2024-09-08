package com.spring_boot_allmypet.project.model.animal;

import java.util.ArrayList;
import java.util.List;

public class ChatGPTRequest {
	 private String model;
	    private List<Message> messages;

	    public ChatGPTRequest(String userMessage) {
	        this.model = "gpt-3.5-turbo"; // 사용할 모델
	        this.messages = new ArrayList<>();
	        this.messages.add(new Message("user", userMessage));
	    }

	    // Getters and Setters
	    public String getModel() {
	        return model;
	    }

	    public void setModel(String model) {
	        this.model = model;
	    }

	    public List<Message> getMessages() {
	        return messages;
	    }

	    public void setMessages(List<Message> messages) {
	        this.messages = messages;
	    }

	    public static class Message {
	    	// role: 메시지를 보낸 주체(예: "user" 또는 "assistant")를 저장
	        private String role;
	        private String content;

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

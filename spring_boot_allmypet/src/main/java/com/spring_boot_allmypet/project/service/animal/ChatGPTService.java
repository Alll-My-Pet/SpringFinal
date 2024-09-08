package com.spring_boot_allmypet.project.service.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.spring_boot_allmypet.project.model.animal.ChatGPTRequest;
import com.spring_boot_allmypet.project.model.animal.ChatGPTResponse;

@Service
public class ChatGPTService {
	@Autowired
	private RestTemplate restTemplate;
	@Value("${openai.api.key}")
	private String apiKey;

	private static final String CHATGPT_API_URL = "https://api.openai.com/v1/chat/completions";
	/* private static final String API_KEY = "YOUR_API_KEY"; */

	public ChatGPTResponse processMessage(ChatGPTRequest request) {
		ChatGPTRequest chatGPTRequest = new ChatGPTRequest(request.getMessages().get(0).getContent());

		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + apiKey);
		headers.set("Content-Type", "application/json");

		HttpEntity<ChatGPTRequest> entity = new HttpEntity<>(chatGPTRequest, headers);

		try {
			ResponseEntity<ChatGPTResponse> responseEntity = restTemplate.exchange(CHATGPT_API_URL, HttpMethod.POST,
					entity, ChatGPTResponse.class);

			if (responseEntity.getStatusCode() == HttpStatus.OK && responseEntity.getBody() != null) {
				String reply = responseEntity.getBody().getChoices().get(0).getMessage().getContent();
				return new ChatGPTResponse(reply); // ChatGPTResponse 객체로 반환
			} else {
				return new ChatGPTResponse("응답을 받을 수 없습니다.");
			}

		} catch (Exception e) {
			// 로깅 추가
			System.err.println("API 호출 중 오류 발생: " + e.getMessage());
			return new ChatGPTResponse("API 호출 중 오류가 발생했습니다.");
		}
	}
}

package com.spring_boot_allmypet.project.controller.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_allmypet.project.model.animal.ChatGPTRequest;
import com.spring_boot_allmypet.project.model.animal.ChatGPTResponse;
import com.spring_boot_allmypet.project.service.animal.ChatGPTService;

@RestController
@RequestMapping("/api/chatgpt")
public class ChatGptController {
    @Autowired
    private ChatGPTService chatGptService;

    @RequestMapping(value = "/chat", method = RequestMethod.GET)
    public String showChatPage() {
        return "animal/chat"; // chat.jsp 페이지로 이동
    }

    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public String sendMessage(@RequestParam String userMessage, Model model) {
        ChatGPTRequest request = new ChatGPTRequest(userMessage);
        ChatGPTResponse response = chatGptService.processMessage(request);
        model.addAttribute("response", response.getChoices().get(0).getMessage().getContent());
        return "animal/chat"; // 다시 chat.jsp 페이지로 이동
    }
}
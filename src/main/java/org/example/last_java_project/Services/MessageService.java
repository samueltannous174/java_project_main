package org.example.last_java_project.Services;


import org.example.last_java_project.Models.ChatMessage;
import org.example.last_java_project.Repositories.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;
    public ChatMessage save(ChatMessage chatMessage){
        return  messageRepository.save(chatMessage);
    }
}

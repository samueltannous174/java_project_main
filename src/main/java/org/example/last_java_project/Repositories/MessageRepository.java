package org.example.last_java_project.Repositories;

import org.example.last_java_project.Models.ChatMessage;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MessageRepository  extends CrudRepository<ChatMessage,Long> {

}

package org.example.project_java.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "chat_messages")
public class ChatMessage {
    @Id
    @Column(name = "id", nullable = true)
    private Long id;
    @NotBlank
    @Column(name = "content", nullable = true, length = -1)
    private String content;
    @NotBlank
    @Column(name = "type", nullable = true)
    private Byte type;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "created_at", nullable = true)
    private Timestamp createdAt;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "updated_at", nullable = true)
    private Timestamp updatedAt;

    @ManyToMany
    @JoinTable(
            name = "users_events",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    Set<Event> events= new HashSet<>();


    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }



}

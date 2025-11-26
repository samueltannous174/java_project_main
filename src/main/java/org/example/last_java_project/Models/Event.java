package org.example.last_java_project.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.*;

@Entity
@Table(name = "events")
public class Event {
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @NotBlank
    @Column(name = "title", nullable = true, length = 45)
    private String title;

    @NotBlank
    @Column(name = "category", nullable = true, length = 45)
    private String category;
    @NotBlank
    @Column(name = "description", nullable = true, length = -1)
    private String description;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "start_date", nullable = true)
    private Timestamp startDate;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "end_date", nullable = true)
    private Timestamp endDate;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "created_at", nullable = true)
    private Date createdAt;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "updated_at", nullable = true)
    private Date updatedAt;

    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Task> tasks = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "organizer_id")
    private User organizer;

    @ManyToMany
    @JoinTable(
            name = "users_events",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private Set <Event> courses = new HashSet<>();


    @ManyToMany
    @JoinTable(
            name = "events_skills",
            joinColumns = @JoinColumn(name = "event_id"),
            inverseJoinColumns = @JoinColumn(name = "skill_id")
    )
    Set<Skill> skills= new HashSet<>();


    @OneToMany(mappedBy = "event", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<ChatMessage> messages = new ArrayList<>();


    @GeneratedValue(strategy = GenerationType.IDENTITY)


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public String toString() {
        return "Events{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", description='" + description + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}

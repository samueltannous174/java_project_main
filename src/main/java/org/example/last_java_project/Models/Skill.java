package org.example.last_java_project.Models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "skills")
public class Skill {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @NotBlank
    @Column(name = "name", nullable = true, length = 45)
    private String name;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "created_at", nullable = true)
    private Date createdAt;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "updated_at", nullable = true)
    private Date updatedAt;


    @ManyToMany
    @JoinTable(
            name = "skills_users",
            joinColumns = @JoinColumn(name = "skill_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    Set <User> users= new HashSet<>();



    @ManyToMany
    @JoinTable(
            name = "events_skills",
            joinColumns = @JoinColumn(name = "skill_id"),
            inverseJoinColumns = @JoinColumn(name = "event_id")
    )
    Set <Event> events= new HashSet<>();




    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

}

package org.example.last_java_project.Repositories;

import org.example.last_java_project.Models.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository  extends CrudRepository<User,Long> {
    public Optional<User> findByEmail(String email);

    @Query("SELECT u FROM User u WHERE u.role = 'VOLUNTEER'")
    List<User> getVolunteers();

    List<User> findAll();
}

package org.example.last_java_project.Repositories;

import org.example.last_java_project.Models.Event;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventRepository extends CrudRepository<Event,Long> {
    List<Event> findByDescriptionContains(String description);

    List<Event> findByTitleContainsIgnoreCase(String title);
}

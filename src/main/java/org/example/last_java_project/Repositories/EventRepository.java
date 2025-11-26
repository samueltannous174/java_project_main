package org.example.last_java_project.Repositories;

import org.example.last_java_project.Models.Event;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends CrudRepository<Event,Long> {

}

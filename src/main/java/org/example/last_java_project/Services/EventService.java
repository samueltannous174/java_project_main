package org.example.last_java_project.Services;


import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Repositories.EventRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EventService {

    private  final EventRepository eventRepository;

    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    public List<Event>  getAll(){

        return (List<Event>) eventRepository.findAll();
    }
    public void saveALl( List<Event> events){
        eventRepository.saveAll(events);
    }
    public void deleteAll( ){
        eventRepository.deleteAll();
    }
    public List<Event> findAll(){
        return (List<Event>) eventRepository.findAll();
    }

    public Event findById(Long id) {
        return eventRepository.findById(id).orElse(null);
    }


}

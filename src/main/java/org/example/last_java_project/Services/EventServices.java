package org.example.last_java_project.Services;


import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Repositories.EventRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServices {

    private  final EventRepository eventRepository;

    public EventServices(EventRepository eventRepository) {
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


}

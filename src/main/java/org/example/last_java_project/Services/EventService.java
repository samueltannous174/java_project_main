package org.example.last_java_project.Services;


import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Repositories.EventRepository;
import org.springframework.stereotype.Service;

import java.util.List;

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

    public List<Event> findByTitleContainsIgnoreCase(String title){
        return eventRepository.findByTitleContainsIgnoreCase(title);
    }
    public Event findById(Long id){
        return  eventRepository.findById(id).orElse(null);
    }

    public void save(Event event){
        eventRepository.save(event);
    }


    public List<String> getUniqueCategories(){
        return eventRepository.getAllCategories();
    }

    public List<Event> getEventsByCategory(String category){
        return eventRepository.getEventsByCategory(category);
    }

}

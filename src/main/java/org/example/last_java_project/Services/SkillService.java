package org.example.last_java_project.Services;

import org.example.last_java_project.Models.Event;
import org.example.last_java_project.Models.Skill;
import org.example.last_java_project.Repositories.SkillRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkillService {
    @Autowired
    private SkillRepository skillRepository;

    public void createSkill(Skill skill){
        skillRepository.save(skill);
    }

    public void deleteAll(){
        skillRepository.deleteAll();
    }
    public void deleteById(Long  id){
        skillRepository.deleteById(id);
    }
    public Skill findById(Long id){
        return  skillRepository.findById(id).orElse(null);
    }

    public List<Skill> getAll(){
       return (List<Skill>) skillRepository.findAll();
    }
    public List<Skill> findAllByIds(List<Long> ids) {
        return (List<Skill>) skillRepository.findAllById(ids);
    }



}

package org.example.last_java_project.Services;

import org.example.last_java_project.Models.LoginUser;
import org.example.last_java_project.Models.Skill;
import org.example.last_java_project.Models.User;
import org.example.last_java_project.Repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public void save(User user){
        userRepository.save(user);
    }
    public User register(User newUser, BindingResult result) {

        System.out.println(newUser);


        if (userRepository.findByEmail(newUser.getEmail()).isPresent()) {
            result.rejectValue("email", "Unique", "Email is already in use!");
        }

        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Matches", "Passwords must match!");
        }


        if (result.hasErrors()) {
            return null;
        }

        String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashed);

        return userRepository.save(newUser);
    }

    public User findUser(Long id) {
        Optional optional = userRepository.findById(id);
        if (optional.isPresent()) {
            return (User) optional.get();
        }
        return null;
    }

    public User login(LoginUser newLoginUser, BindingResult result) {
        Optional<User> potentialUser = userRepository.findByEmail(newLoginUser.getEmail());
        if (!potentialUser.isPresent()) {
            result.rejectValue("email", "NotFound", "Invalid email or  password!");
            return null;
        }

        User user = potentialUser.get();

        if (!BCrypt.checkpw(newLoginUser.getPassword(), user.getPassword())) {
            result.rejectValue("email", "Invalid", "Invalid email or  password!");
        }

        if (result.hasErrors()) {
            return null;
        }

        return user;
    }


    public void updateUser(Long id, String firstname, String lastname, String imageUrl, String role, List<Skill> skills) {
        User user = userRepository.findById(id).orElseThrow();

        user.setFirstname(firstname);
        user.setLastname(lastname);
        user.setImage_url(imageUrl);
        user.setRole(role);
        user.setSkills((skills != null) ? new HashSet<>(skills) : new HashSet<>());

        userRepository.save(user);
    }
}

package com.keyboardTraining.repos;

import com.keyboardTraining.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepos extends JpaRepository<Role, Long> {
}
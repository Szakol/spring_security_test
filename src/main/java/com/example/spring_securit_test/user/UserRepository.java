package com.example.spring_securit_test.user;

import org.springframework.data.repository.CrudRepository;
import java.util.Optional;

interface UserRepository extends CrudRepository<User, Long> {
    Optional<User> findByEmail(String email);
}
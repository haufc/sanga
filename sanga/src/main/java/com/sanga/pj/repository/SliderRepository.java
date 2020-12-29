package com.sanga.pj.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.sanga.pj.entity.Slider;

public interface SliderRepository extends JpaRepository<Slider, Long>{
	@Query("select count(e) from Slider e")
	long countAllSlider();
}

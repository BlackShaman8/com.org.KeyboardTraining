package com.keyboardTraining.controllers;

import com.keyboardTraining.model.DifficultyLevel;
import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.service.DifficultyLevelServiceImpl;
import com.keyboardTraining.service.ExerciseServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ExerciseController {
    private final ExerciseServiceImpl exerciseService;
    private final DifficultyLevelServiceImpl difficultyLevelService;

    public ExerciseController(ExerciseServiceImpl exerciseService, DifficultyLevelServiceImpl difficultyLevelService) {
        this.exerciseService = exerciseService;
        this.difficultyLevelService = difficultyLevelService;
    }

    @GetMapping("/exercises")
    public String getAllExercise(Model model) {
        model.addAttribute("allExercise", exerciseService.getAll());
        model.addAttribute("allDifficultyLevels", exerciseService.getAllDifficultyLevels());
        return "exercises";
    }

    @GetMapping("/difficultyLevels")
    public String getAllDifficultyLevels(Model model) {
        model.addAttribute("allDifficultyLevel", difficultyLevelService.getAll());
        return "difficultyLevels";
    }

    @GetMapping("/editDifficultyLevel/{difficultyLevelId}")
    public String getDifficultyLevel(Model model, @PathVariable String difficultyLevelId) {
        model.addAttribute("difficultyLevel", difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevelId)));
        return "editDifficultyLevel";
    }

    @GetMapping("/createExercise")
    public String createExercise() {
        return "createExercise";
    }

    @PostMapping("/createExercise")
    public String createNewExercise(@RequestParam String difficultyLevel, @RequestParam String exercise) {
        Exercise ex = new Exercise();
        ex.setMyDifficultyLevel(difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevel)));
        ex.setExercise(exercise);
        exerciseService.saveExercise(ex);
        return "redirect:/exercises";
    }

    @PostMapping("/exercises")
    public String postExercise(@RequestParam String exerciseId) {
        exerciseService.deleteExerciseId(Long.parseLong(exerciseId));
        return "redirect:/exercises";
    }

    @PostMapping("/difficultyLevels")
    public String postAllDifficultyLevels(@RequestParam(required = true, defaultValue = "") Long difficultyLevelId, Model model) {
        model.addAttribute("difficultyLevel", difficultyLevelService.getDifficultyLevel(difficultyLevelId));
        return "editDifficultyLevel";
    }

    @PostMapping("/editDifficultyLevel/{difficultyLevelId}")
    public String postEditDifficultyLevel(@PathVariable String difficultyLevelId,
                                          @RequestParam String minLength,
                                          @RequestParam String maxLength,
                                          @RequestParam String maxNumberOfErrors,
                                          @RequestParam String pressingTime,
                                          @RequestParam(required = true, defaultValue = "") String action) {
        if (action.equals("change")) {
            DifficultyLevel difficultyLevel = difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevelId));
            difficultyLevel.setMinLength(Integer.parseInt(minLength));
            difficultyLevel.setMaxLength(Integer.parseInt(maxLength));
            difficultyLevel.setMaxNumberOfErrors(Integer.parseInt(maxNumberOfErrors));
            difficultyLevel.setPressingTime(Double.parseDouble(pressingTime));
            difficultyLevelService.changeDifficultyLevel(difficultyLevel);
        } else if (action.equals("back")) {
            return "redirect:/difficultyLevels";
        }


        return "redirect:/difficultyLevels";
    }

    @PostMapping("/editExercise")
    public String editExercise(@RequestParam(required = true, defaultValue = "") Long exerciseId,
                               @RequestParam(required = true, defaultValue = "") String action,
                               Model model) {
        if (action.equals("delete")) {
            exerciseService.deleteExercise(exerciseService.getExercise(exerciseId));
        }
        return "redirect:/editExercise";
    }

}

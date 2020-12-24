package com.keyboardTraining.controllers;

import com.keyboardTraining.JaxbWorker;
import com.keyboardTraining.model.DifficultyLevel;
import com.keyboardTraining.model.Exercise;
import com.keyboardTraining.model.Statistics;
import com.keyboardTraining.service.DifficultyLevelServiceImpl;
import com.keyboardTraining.service.ExerciseServiceImpl;
import com.keyboardTraining.service.StatisticsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ExerciseController {
    private final ExerciseServiceImpl exerciseService;
    private final DifficultyLevelServiceImpl difficultyLevelService;
    private final StatisticsService statisticsService;

    public ExerciseController(ExerciseServiceImpl exerciseService, DifficultyLevelServiceImpl difficultyLevelService, StatisticsService statisticsService) {
        this.exerciseService = exerciseService;
        this.difficultyLevelService = difficultyLevelService;
        this.statisticsService = statisticsService;
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
    public String createExercise(Model model) {
        List<DifficultyLevel> list = difficultyLevelService.getAll();
        for (int i = 0; i < list.size(); i++)
            model.addAttribute("difficulteLevel" + i, list.get(i));
        if (exerciseService.getAll().size() != 0) {
            model.addAttribute("number", exerciseService.getAll().get(exerciseService.getAll().size() - 1).getId() + 1);
        } else
            model.addAttribute("number", "0");
        return "createExercise";
    }

    @GetMapping("/createExercise/error")
    public String createExerciseError(Model model) {
        List<DifficultyLevel> list = difficultyLevelService.getAll();
        for (int i = 0; i < list.size(); i++)
            model.addAttribute("difficulteLevel" + i, list.get(i));
        if (exerciseService.getAll().size() != 0) {
            model.addAttribute("number", exerciseService.getAll().get(exerciseService.getAll().size() - 1).getId() + 1);
        } else
            model.addAttribute("number", "0");
        model.addAttribute("errorMessage","Текст упражнения не введен");
        return "createExercise";
    }

    @PostMapping("/createExercise")
    public String createNewExercise(@RequestParam String difficultyLevel, @RequestParam String exercise, @RequestParam String buttonCreate, @RequestParam String fileName) {
        if (buttonCreate.equals("create")) {
            if(exercise.equals("")){
                return "redirect:/createExercise/error";
            }
            Exercise ex = new Exercise();
            ex.setMyDifficultyLevel(difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevel)));
            ex.setExercise(exercise);
            exerciseService.saveExercise(ex);
            return "redirect:/exercises";
        } else {
            Exercise unmarshExercise = JaxbWorker.fromXmlToObject(fileName);
            if (unmarshExercise != null) {
                exerciseService.saveExercise(unmarshExercise);
            }
            return "redirect:/exercises";
        }
    }

    @GetMapping("exercises/changeExercise/{exerciseId}")
    public String getExerciseChangeView(@PathVariable String exerciseId,Model model) {
        model.addAttribute("exercise", exerciseService.getExercise(Long.parseLong(exerciseId)));
        List<DifficultyLevel> list = difficultyLevelService.getAll();
        for (int i = 0; i < list.size(); i++)
            model.addAttribute("difficulteLevel" + i, list.get(i));
        if (exerciseService.getAll().size() != 0) {
            model.addAttribute("number", exerciseService.getAll().get(exerciseService.getAll().size() - 1).getId() + 1);
        } else
            model.addAttribute("number", "0");
        return "changeExercise";
    }

    @PostMapping("/exercises/save")
    public String postExerciseSave(@RequestParam String exerciseId) {
        String file = "exercises" + exerciseId + ".XML";
        Exercise exercise = exerciseService.getExercise(Long.parseLong(exerciseId));
        JaxbWorker.convertObjectToXml(exercise, file);
        return "redirect:/exercises";
    }


    @PostMapping("/exercises/changeExercise/{exerciseId}")
    public String postExerciseChange(@PathVariable String exerciseId,@RequestParam String difficultyLevel, @RequestParam String exercise, @RequestParam String buttonCreate, @RequestParam String fileName) {
        if(exercise.equals("")){
            return "redirect:/createExercise/error";
        }
        Exercise ex = exerciseService.getExercise(Long.parseLong(exerciseId));
        ex.setMyDifficultyLevel(difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevel)));
        ex.setExercise(exercise);
        exerciseService.changeExercise(ex);
        return "redirect:/createExercise";
    }


    @PostMapping("/exercises")
    public String postExercise(@RequestParam String exerciseId) {
        statisticsService.deleteAllByExercide(Long.parseLong(exerciseId));
        List<Statistics> stat=statisticsService.getAll();
        List<Exercise> exer=exerciseService.getAll();

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
                                          @RequestParam String pressingTime) {
        DifficultyLevel difficultyLevel = difficultyLevelService.getDifficultyLevel(Long.parseLong(difficultyLevelId));
        difficultyLevel.setMinLength(Integer.parseInt(minLength));
        difficultyLevel.setMaxLength(Integer.parseInt(maxLength));
        difficultyLevel.setMaxNumberOfErrors(Integer.parseInt(maxNumberOfErrors));
        difficultyLevel.setPressingTime(Double.parseDouble(pressingTime));
        difficultyLevelService.changeDifficultyLevel(difficultyLevel);


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

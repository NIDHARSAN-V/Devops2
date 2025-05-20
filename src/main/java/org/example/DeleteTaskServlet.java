package org.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import com.google.gson.reflect.TypeToken;
import com.google.gson.Gson;

public class DeleteTaskServlet extends HttpServlet {
    private static final String FILE_PATH = "tasks.json";
    private Gson gson = new Gson();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int index = Integer.parseInt(request.getParameter("taskIndex"));
        List<String> tasks = loadTasks();
        if (index >= 0 && index < tasks.size()) {
            tasks.remove(index);
            saveTasks(tasks);
        }
        response.sendRedirect("list.jsp");
    }

    private List<String> loadTasks() throws IOException {
        File file = new File(FILE_PATH);
        if (!file.exists()) return new ArrayList<>();
        Reader reader = Files.newBufferedReader(file.toPath());
        List<String> tasks = gson.fromJson(reader, new TypeToken<List<String>>(){}.getType());
        reader.close();
        return tasks != null ? tasks : new ArrayList<>();
    }

    private void saveTasks(List<String> tasks) throws IOException {
        Writer writer = Files.newBufferedWriter(Paths.get(FILE_PATH));
        gson.toJson(tasks, writer);
        writer.close();
    }
}

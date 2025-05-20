<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, java.nio.file.*, com.google.gson.reflect.TypeToken, com.google.gson.Gson" %>
<%
    Gson gson = new Gson();
    List<String> tasks = new ArrayList<>();
    try {
        Path path = Paths.get("tasks.json");
        if (Files.exists(path)) {
            String json = new String(Files.readAllBytes(path));
            tasks = gson.fromJson(json, new TypeToken<List<String>>(){}.getType());
            if (tasks == null) tasks = new ArrayList<>();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<html>
<head>
    <title>Task List</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 40px;
            min-height: 100vh;
            animation: fadeIn 0.6s ease-out;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 600;
            text-align: center;
        }

        .no-tasks {
            text-align: center;
            color: #7f8c8d;
            font-size: 18px;
            padding: 20px;
        }

        .task-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .task-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            margin-bottom: 10px;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #3498db;
            animation: slideIn 0.4s ease-out forwards;
            transition: all 0.3s ease;
        }

        .task-item:hover {
            transform: translateX(5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .task-text {
            flex-grow: 1;
            font-size: 16px;
            color: #34495e;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
            margin-left: 15px;
        }

        .delete-btn:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(231, 76, 60, 0.3);
        }

        .delete-btn:active {
            transform: translateY(0);
        }

        .back-link {
            display: inline-block;
            margin-top: 30px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .back-link:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .task-count {
            text-align: center;
            color: #7f8c8d;
            margin-bottom: 20px;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            .task-item {
                flex-direction: column;
                align-items: flex-start;
            }

            .delete-btn {
                margin-left: 0;
                margin-top: 10px;
                align-self: flex-end;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Tasks</h2>

    <% if (tasks.isEmpty()) { %>
    <div class="no-tasks">
        <p>No tasks found. Add some tasks to get started!</p>
    </div>
    <% } else { %>
    <div class="task-count">
        You have <%= tasks.size() %> <%= tasks.size() == 1 ? "task" : "tasks" %>
    </div>
    <ul class="task-list">
        <% for (int i = 0; i < tasks.size(); i++) { %>
        <li class="task-item" style="animation-delay: <%= i * 0.1 %>s">
            <span class="task-text"><%= tasks.get(i) %></span>
            <form method="post" action="deleteTask" style="display:inline;">
                <input type="hidden" name="taskIndex" value="<%= i %>" />
                <button type="submit" class="delete-btn">Delete</button>
            </form>
        </li>
        <% } %>
    </ul>
    <% } %>

    <a href="index.jsp" class="back-link">← Back to Home</a>
</div>

<script>
    // Add confirmation for delete actions
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to delete this task?')) {
                e.preventDefault();
            }
        });
    });
</script>
</body>
</html>
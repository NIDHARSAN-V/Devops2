<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Task</title>
    <style>
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes slideIn {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #eef2f7 0%, #d6e4f0 100%);
            padding: 40px;
            min-height: 100vh;
            animation: fadeIn 0.6s ease-out;
        }

        h2 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
            max-width: 450px;
            margin: auto;
            transition: all 0.3s ease;
            animation: slideIn 0.5s ease-out;
        }

        form:hover {
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.12);
            transform: translateY(-2px);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #34495e;
            transition: all 0.3s ease;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px 15px;
            margin: 8px 0 20px;
            font-size: 16px;
            border: 2px solid #dfe6e9;
            border-radius: 8px;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        button {
            margin-top: 15px;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 500;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        button:hover {
            background: linear-gradient(135deg, #2980b9 0%, #3498db 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        button:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .back-link {
            display: block;
            margin: 30px auto;
            text-align: center;
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            padding: 8px 16px;
            border-radius: 6px;
            max-width: 120px;
        }

        .back-link:hover {
            color: #fff;
            background-color: #3498db;
            text-decoration: none;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
        }

        .back-link:active {
            transform: translateY(0);
        }

        /* Floating animation for the form */
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        /* Add this class to any element you want to float */
        .floating {
            animation: float 6s ease-in-out infinite;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            body {
                padding: 20px;
            }

            form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<h2>Add a New Task</h2>
<form method="post" action="todo" class="floating">
    <label for="task">Task Description:</label>
    <input type="text" name="task" id="task" required placeholder="Enter your task here...">
    <button type="submit" class="pulse-on-hover">Add Task</button>
</form>
<a class="back-link" href="index.jsp">← Back to Home</a>

<script>
    // Add pulse animation to button when hovered
    document.querySelector('button').addEventListener('mouseenter', function() {
        this.style.animation = 'pulse 1.5s infinite';
    });

    document.querySelector('button').addEventListener('mouseleave', function() {
        this.style.animation = '';
    });

    // Add focus effect to input when page loads
    window.onload = function() {
        setTimeout(function() {
            document.getElementById('task').focus();
        }, 300);
    };
</script>
</body>
</html>
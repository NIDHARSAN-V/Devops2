<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>ToDo Home</title>
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

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            animation: fadeIn 0.8s ease-out;
        }

        .container {
            text-align: center;
            background-color: white;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            width: 90%;
            transition: all 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-weight: 600;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .nav-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .nav-link {
            display: inline-block;
            padding: 12px 25px;
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .nav-link:hover {
            background: linear-gradient(135deg, #2980b9 0%, #3498db 100%);
            transform: translateY(-3px);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            animation: pulse 1.5s infinite;
        }

        .nav-link:active {
            transform: translateY(0);
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .app-icon {
            font-size: 60px;
            margin-bottom: 20px;
            color: #3498db;
            text-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 500px) {
            .nav-links {
                flex-direction: column;
                gap: 15px;
            }

            .nav-link {
                width: 100%;
                text-align: center;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="app-icon">✓</div>
    <h1>Welcome to ToDo App</h1>
    <div class="nav-links">
        <a href="add.jsp" class="nav-link">Add Task</a>
        <a href="list.jsp" class="nav-link">View Tasks</a>
    </div>
</div>

<script>
    // Add animation to links when hovered
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('mouseenter', function() {
            this.style.animation = 'pulse 1.5s infinite';
        });

        link.addEventListener('mouseleave', function() {
            this.style.animation = '';
        });
    });
</script>
</body>
</html>
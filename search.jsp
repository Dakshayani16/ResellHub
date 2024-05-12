<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search with Filters</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        /* Add your custom CSS styles here */
        .dropdown-menu {
            display: none;
        }
        .dropdown-menu.show {
            display: block;
        }
        .dropdown-submenu:hover .dropdown-menu {
            display: block;
            position: absolute;
            top: 0;
            left: 100%;
        }
        .dropdown-submenu .dropdown-submenu:hover .dropdown-menu {
            top: 0;
            left: 100%;
        }
    </style>
</head>
<body>
    <section id="search">
        <div class="container">
            <form id="searchForm" action="#" method="GET">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">All</button>
                        <div class="dropdown-menu">
                            <!-- Dropdown options here -->
                            <a class="dropdown-item" href="#">Option 1</a>
                            <a class="dropdown-item" href="#">Option 2</a>
                            <a class="dropdown-item" href="#">Option 3</a>
                        </div>
                    </div>
                    <input type="text" class="form-control" name="search" id="searchInput" placeholder="Search...">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="submit"><i class="fas fa-search"></i></button>
                        <div class="dropdown">
                            <button id="filterIcon" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-filter"></i>
                            </button>
                            <div id="filterDropdowns" class="dropdown-menu" aria-labelledby="filterIcon">
                                <div class="dropdown-item" href="#">By Price - All</div>
                                
                                    <a class="dropdown-item" href="#">Subprice $0 - $50.1</a>
                                    <a class="dropdown-item" href="#">Subprice $0 - $50.2</a>
                                    <!-- Add more subprices as needed -->
                                    <a class="dropdown-item" href="#">Subprice $50.1 - $100.2</a>
                                    <a class="dropdown-item" href="#">Subprice $100.2 - $200.3</a>
                                    <a class="dropdown-item" href="#">Subprice $200.3 - $500.4</a>
                                    <!-- Add more subprices as needed -->
                                
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    
    <!-- Bootstrap JS (required) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#filterIcon").click(function(){
                $("#filterDropdowns").toggleClass("show");
            });
        });
    </script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html class="bootstrap-layout">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Dashboard</title>

  <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
  <meta name="robots" content="noindex">

  <!-- Material Design Icons  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- Roboto Web Font -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" rel="stylesheet">

  <!-- App CSS -->
  <link type="text/css" href="assets/css/style.min.css" rel="stylesheet">

</head>

<body class="layout-container ls-top-navbar si-l3-md-up">

  <!-- Navbar -->
  <nav class="navbar navbar-dark bg-primary navbar-full navbar-fixed-top">

    <!-- Toggle sidebar -->
    <button class="navbar-toggler pull-xs-left" type="button" data-toggle="sidebar" data-target="#sidebarLeft"><span class="material-icons">menu</span></button>

    <!-- Brand -->
    <a href="index.html" class="navbar-brand"><i class="material-icons">school</i> LearnPlus</a>

    <!-- Search -->
    <form class="form-inline pull-xs-left hidden-sm-down">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search">
        <span class="input-group-btn"><button class="btn" type="button"><i class="material-icons">search</i></button></span>
      </div>
    </form>
    <!-- // END Search -->

    <ul class="nav navbar-nav hidden-sm-down">

      <!-- Menu -->
      <li class="nav-item">
        <a class="nav-link" href="forum.html">Forum</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="get-help.html">Get Help</a>
      </li>
    </ul>

    <!-- Menu -->
    <ul class="nav navbar-nav pull-xs-right">

      <li class="nav-item">
        <a href="cart.html" class="nav-link">
          <i class="material-icons">shopping_cart</i>
        </a>
      </li>

      <!-- User dropdown -->
      <li class="nav-item dropdown">
        <a class="nav-link active dropdown-toggle p-a-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false">
          <img src="assets/images/people/50/guy-6.jpg" alt="Avatar" class="img-circle" width="40">
        </a>
        <div class="dropdown-menu dropdown-menu-right dropdown-menu-list" aria-labelledby="Preview">
          <a class="dropdown-item" href="account-edit.html"><i class="material-icons md-18">lock</i> <span class="icon-text">Edit Account</span></a>
          <a class="dropdown-item" href="profileName.html"><i class="material-icons md-18">person</i> <span class="icon-text">Public ProfileName</span></a>
          <a class="dropdown-item" href="login.html">Logout</a>
        </div>
      </li>
      <!-- // END User dropdown -->

    </ul>
    <!-- // END Menu -->

  </nav>
  <!-- // END Navbar -->
  <!-- Sidebar -->
  <div class="sidebar sidebar-left sidebar-light sidebar-visible-md-up si-si-3 ls-top-navbar-xs-up sidebar-transparent-md" id="sidebarLeft" data-scrollable>
    <div class="sidebar-heading">APPLICATIONS</div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="instructor-dashboard.html">
          <i class="sidebar-menu-icon material-icons">school</i> Instructor
        </a>
      </li>
      <li class="sidebar-menu-item active">
        <a class="sidebar-menu-button" href="index.html">
          <i class="sidebar-menu-icon material-icons">account_box</i> Student
        </a>
      </li>
    </ul>
    <div class="sidebar-heading">Student</div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="browse-courses.html">
          <i class="sidebar-menu-icon material-icons">search</i> Browse Courses
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="view-course.html">
          <i class="sidebar-menu-icon material-icons">import_contacts</i> View Course
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="take-course.html">
          <i class="sidebar-menu-icon material-icons">class</i> Take Course
          <span class="sidebar-menu-label label label-default">PRO</span>
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="take-quiz.html">
          <i class="sidebar-menu-icon material-icons">dvr</i> Take a Quiz
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="quiz-results.html">
          <i class="sidebar-menu-icon material-icons">poll</i> Quiz Results
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="account-edit.html">
          <i class="sidebar-menu-icon material-icons">account_box</i> Edit Account
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="my-courses.html">
          <i class="sidebar-menu-icon material-icons">school</i> My Courses
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="chat.html">
          <i class="sidebar-menu-icon material-icons">comment</i> Messages
          <span class="sidebar-menu-label label label-default">2</span>
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="billing.html">
          <i class="sidebar-menu-icon material-icons">monetization_on</i> Billing
          <span class="sidebar-menu-label label label-default">$25</span>
        </a>
      </li>
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="login.html">
          <i class="sidebar-menu-icon material-icons">lock_open</i> Logout
        </a>
      </li>
    </ul>
    <!-- Components menu -->
    <div class="sidebar-heading">UI Components</div>
    <ul class="sidebar-menu">
      <li class="sidebar-menu-item">
        <a class="sidebar-menu-button" href="#">
          <i class="sidebar-menu-icon material-icons">tune</i> UI Components
        </a>
        <ul class="sidebar-submenu sm-condensed">
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-buttons.html">Buttons</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-cards.html">Cards</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-tabs.html">Tabs</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-tree.html">Tree</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-nestable.html">Nestable</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-notifications.html">Notifications</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-progress.html">Progress Bars</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-forms.html">Forms</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-tables.html">Tables</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-charts.html">Charts</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-calendar.html">Calendar</a>
          </li>
          <li class="sidebar-menu-item">
            <a class="sidebar-menu-button" href="ui-maps-vector.html">Maps Vector</a>
          </li>
        </ul>
      </li>
    </ul>
    <!-- // END Components Menu -->
  </div>
  <!-- // END Sidebar -->

  <!-- Content -->
  <div class="layout-content" data-scrollable>
    <div class="container-fluid">

      <ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
      <div class="card card-stats-primary">
        <div class="card-block">
          <div class="media">
            <div class="media-left media-middle">
              <i class="material-icons text-muted-light">credit_card</i>
            </div>
            <div class="media-body media-middle">
              Your subscription ends on
              <strong>25 February 2015</strong>
            </div>
            <div class="media-right">
              <a class="btn btn-success btn-rounded" href="pay.html">Upgrade</a>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-7">
          <div class="card">
            <div class="card-header bg-white">
              <div class="media">
                <div class="media-body">
                  <h4 class="card-title">Courses</h4>
                  <p class="card-subtitle">Your recent courses</p>
                </div>
                <div class="media-right media-middle">
                  <a class="btn btn-white" href="#"> View All</a>
                </div>
              </div>
            </div>
            <ul class="list-group list-group-fit m-b-0">
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <a href="take-course.html">Basics of HTML</a>
                  </div>
                  <div class="media-right media-middle">
                    <div class="center">
                      <span class="label label-pill label-primary m-b-05">25%</span>
                      <progress class="progress progress-primary m-b-0" value="25" max="100" style="width:100px">25%</progress>
                    </div>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <a href="take-course.html">Angular in Steps</a>
                  </div>
                  <div class="media-right media-middle">
                    <div class="center">
                      <span class="label label-pill label-success m-b-05">100%</span>
                      <progress class="progress progress-success m-b-0" value="100" max="100" style="width:100px">100%</progress>
                    </div>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <a href="take-course.html">Bootstrap Foundations</a>
                  </div>
                  <div class="media-right media-middle">
                    <div class="center">
                      <span class="label label-pill label-warning m-b-05">80%</span>
                      <progress class="progress progress-warning m-b-0" value="80" max="100" style="width:100px">80%</progress>
                    </div>
                  </div>

                </div>
              </li>
            </ul>
          </div>
          <div class="card">
            <div class="card-header bg-white">
              <div class="media">
                <div class="media-body">
                  <h4 class="card-title">Quizzes</h4>
                  <p class="card-subtitle">Your Performance</p>
                </div>
                <div class="media-right media-middle">
                  <a class="btn btn-white" href="#"> View All</a>
                </div>
              </div>
            </div>
            <ul class="list-group list-group-fit m-b-0">
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <div>
                      <a href="take-quiz.html">Title of quiz goes here?</a>
                    </div>
                    <small class="text-light">Course: <a href="view-course.html">Basics of HTML</a></small>
                  </div>
                  <div class="media-right center">
                    <h4 class=" m-b-0">5.8</h4>
                    <span class="text-muted-light">Good</span>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <div>
                      <a href="take-quiz.html">Directives &amp; Routing</a>
                    </div>
                    <small class="text-light">Course: <a href="view-course.html">Angular in Steps</a></small>
                  </div>
                  <div class="media-right center">
                    <h4 class=" m-b-0 text-success">9.8</h4>
                    <span class="text-muted-light">Great</span>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media">
                  <div class="media-body media-middle">
                    <div> <a href="take-quiz.html">Responsive &amp; Retina</a> </div>
                    <small class="text-light">Course: <a href="view-course.html">Bootstrap Foundations</a></small>
                  </div>
                  <div class="media-right center">
                    <h4 class=" m-b-0 text-danger">2.8</h4>
                    <span class="text-muted-light">Failed</span>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-5">
          <div class="card">
            <div class="card-header bg-white">
              <h4 class="card-title">Rewards</h4>
              <p class="card-subtitle">Your latest achievements</p>
            </div>
            <div class="card-block center">
              <div class="btn btn-primary btn-circle"><i class="material-icons">thumb_up</i></div>
              <div class="btn btn-danger btn-circle"><i class="material-icons">grade</i></div>
              <div class="btn btn-success btn-circle"><i class="material-icons">bubble_chart</i></div>
              <div class="btn btn-warning btn-circle"><i class="material-icons">keyboard_voice</i></div>
              <div class="btn btn-info btn-circle"><i class="material-icons">event_available</i></div>
            </div>
          </div>
          <div class="card">
            <div class="card-header bg-white">
              <div class="media">
                <div class="media-body media-middle">
                  <h4 class="card-title">Forum Activity</h4>
                  <p class="card-subtitle">Latest forum topics &amp; comments</p>
                </div>
                <div class="media-right media-middle">
                  <a class="btn btn-white" href="forum.html"> <i class="material-icons">keyboard_arrow_right</i></a>
                </div>
              </div>
            </div>
            <ul class="list-group list-group-fit">
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-9.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Can someone help me with the basic Setup?</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Adrian D.</a></small>
                    </p>
                    <small class="text-muted-light">5 min ago</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/guy-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Great work Guys. How do I create a Sidebar?</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Andrew B.</a></small>
                    </p>
                    <small class="text-muted-light">1 day ago</small>
                  </div>
                </div>
              </li>
              <li class="list-group-item">
                <div class="media m-b-0">
                  <div class="media-left media-middle">
                    <a href="#">
                      <img src="assets/images/people/110/woman-5.jpg" alt="Guy" width="40" class="img-circle">
                    </a>
                  </div>
                  <div class="media-body media-middle">
                    <p class="m-b-0">
                      <a href="forum-thread.html">Looking for the Best</a>
                      <br>
                    </p>
                    <p class="m-b-0">
                      <small>by: <a href="#">Michelle S.</a></small>
                    </p>
                    <small class="text-muted-light">2 days ago</small>
                  </div>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>

    </div>
  </div>

  <!-- jQuery -->
  <script src="assets/vendor/jquery.min.js"></script>

  <!-- Bootstrap -->
  <script src="assets/vendor/tether.min.js"></script>
  <script src="assets/vendor/bootstrap.min.js"></script>

  <!-- AdminPlus -->
  <script src="assets/vendor/adminplus.js"></script>

  <!-- App JS -->
  <script src="assets/js/main.min.js"></script>

</body>

</html>
</body>
</html>
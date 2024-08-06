<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="bootstrap-layout">
<head>
  <jsp:include page="headTag.jsp">
	<jsp:param value="Dashborad" name="title"/>
	</jsp:include>
</head>

<body >
   <jsp:include page="header.jsp"></jsp:include> 
   
   	<div class="container-fluid">
	 	<div class="row">
	 		<jsp:include page="sidedrawer.jsp"></jsp:include>
	 		
		<div class="col-10 ml-sm-auto">

      <div class="card p-3">
        <ul class="nav nav-tabs">
          <li class="nav-item">
            <a class="nav-link active" href="#first" data-toggle="tab">Account</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#second" data-toggle="tab">Billing</a>
          </li>
        </ul>
        <div class="p-a-2 tab-content p-3">
          <div class="tab-pane active" id="first">
            <form action="#" class="form-horizontal">
              <div class="form-group row">
                <label for="avatar" class="col-sm-3 form-control-label">Avatar</label>
                <div class="col-sm-9">
                  <div class="media">
                    <div class="media-left">
                      <div class="icon-block">
                        <i class="material-icons text-muted-light md-36">photo</i>
                      </div>
                    </div>
                    <div class="media-body media-middle">
                      <label class="fileName">
                        <input type="fileName" id="fileName">
                        <span class="fileName-custom"></span>
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="name" class="col-sm-3 form-control-label">Full Name</label>
                <div class="col-sm-8">
                  <div class="row">
                    <div class="col-md-6">
                      <input type="text" class="form-control" placeholder="First Name" value="Nelson">
                    </div>
                    <div class="col-md-6">
                      <input type="text" class="form-control" placeholder="Last Name" value="Soans">
                    </div>
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="email" class="col-sm-3 form-control-label">Email</label>
                 <div class="col-sm-6 col-md-6">
				<div class="input-group mb-2">
			        <div class="input-group-prepend">
			          <div class="input-group-text"><i class="material-icons md-18 text-muted">mail</i></div>
			        </div>
                    <input type="text" class="form-control" placeholder="Email Address" value="shiv.golani.ext@nmims.edu" disabled>
                  </div>
                 </div> 
              </div>
              <div class="form-group row">
                <label for="website" class="col-sm-3 form-control-label">Website</label>
                <div class="col-sm-6 col-md-4">
                  <div class="input-group mb-2">
			        <div class="input-group-prepend">
			          <div class="input-group-text"><i class="material-icons md-18 text-muted">language</i></div>
			        </div>
                    
                    <input type="text" class="form-control" placeholder="www." value="nelsonsoans.com">
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="password" class="col-sm-3 form-control-label">Change Password</label>
                <div class="col-sm-6 col-md-4">
                  <div class="input-group mb-2">
			        <div class="input-group-prepend">
			          <div class="input-group-text"><i class="material-icons md-18 text-muted">lock</i></div>
			        </div>
                    <input type="text" class="form-control" placeholder="Enter new password">
                  </div>
                </div>
              </div>
              <div class="form-group">
			    <div class="form-check">
			      <input class="form-check-input" type="checkbox" id="gridCheck">
			      <label class="form-check-label" for="gridCheck">
			        Subscribe to Newsletter
			      </label>
			    </div>
			  </div>
              <div class="form-group row">
                <div class="col-sm-8 col-sm-offset-3">
                  <div class="media">
                    <div class="media-left">
                      <a href="#" class="btn btn-success btn-rounded">Save Changes</a>
                    </div>
                    <!-- <div class="media-body media-middle p-l-1">
                      <label class="c-input c-checkbox">
                        <input type="checkbox" checked>
                        <span class="c-indicator"></span> Subscribe to Newsletter
                      </label>
                    </div> -->
                  </div>
                </div>
              </div>
            </form>
          </div>

          <div class="tab-pane" id="second">
            <form action="#" class="form-horizontal">
              <div class="form-group row">
                <label for="name_on_invoice" class="col-sm-3 form-control-label">Name on Invoice</label>
                <div class="col-sm-6 col-md-4">
                  <input type="text" class="form-control" value="Nelson Soans">
                </div>
              </div>
              <div class="form-group row">
                <label for="address" class="col-sm-3 form-control-label">Address</label>
                <div class="col-sm-6 col-md-4">
                  <input type="text" class="form-control" value="A-18 Maharaja Surajmal Apts, Juhu Versova Link Road Mumbai Maharahtra">
                </div>
              </div>
              <div class="form-group row">
                <label for="country" class="col-sm-3 form-control-label">Country</label>
                <div class="col-sm-6 col-md-4">
                  <select class="c-select form-control">
                    <option value="1" >USA</option>
                    <option value="2" selected>India</option>
                    <option value="3">United Kingdom</option>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-sm-6 col-md-4 col-sm-offset-3">
                  <a href="#" class="btn btn-success btn-rounded"> Update Billing</a>
                </div>
              </div>
            </form>
            <div class="card m-t-2">
              <div class="card-header bg-white">
                <div class="media">
                  <div class="media-body media-middle">
                    <h4 class="card-title">Payment Info</h4>
                  </div>
                  <div class="media-right media-middle">
                    <a href="#" class="btn btn-primary-outline"><i class="material-icons">add</i></a>
                  </div>
                </div>
              </div>
              <div class="card-footer">
                <ul class="list-group m-b-0">
                  <li class="list-group-item active">
                    <div class="media">
                        <span class="btn btn-primary btn-circle mr-3"><i class="fa-solid fa-credit-card"></i></span>
                      <div class="media-body media-middle">
                        <p class="m-b-0">**** **** **** 2422</p>
                        <small class="text-muted">Updated on 12/02/2016</small>
                      </div>
                      <div class="media-right media-middle">
                        <a href="#" class="btn btn-primary btn-sm">
                          <i class="material-icons">edit</i> EDIT
                        </a>
                      </div>
                    </div>
                  </li>
                  <li class="list-group-item">
                    <div class="media">
                      <span class="btn btn-white btn-circle mr-3"><i class="fa-solid fa-credit-card"></i></span>
                      <div class="media-body media-middle">
                        <p class="m-b-0">**** **** **** 6321</p>
                        <small class="text-muted">Updated on 11/01/2016</small>
                      </div>
                      <div class="media-right media-middle">
                        <a href="#" class="btn btn-white btn-sm">
                          <i class="material-icons">edit</i> EDIT
                        </a>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

</div>
	 	</div>
	</div>
   <!-- Content -->
<!--   <div class="layout-content" data-scrollable>
    
  </div> -->
    <jsp:include page="footer.jsp">
	<jsp:param value=" " name="title"/>
	</jsp:include>
</body>

</html>
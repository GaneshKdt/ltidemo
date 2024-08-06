<%-- <jsp:include page="headTag.jsp">
	<jsp:param value="Digital" name="title"/>
</jsp:include>
<jsp:include page="header.jsp"></jsp:include> --%>

<head>
<style type="text/css">
.chart {
	position: relative;
	width: 165px;
	height: 165px;
	margin: 0 auto;
	font-weight: 300;
}

canvas {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
}

spans {
	color: #555;
	display: block;
	line-height: 165px;
	text-align: center;
	width: 165px;
	font-size: 40px;
	font-weight: 300;
	margin-left: 5px;
}
</style>
</head>

<div class="container-fluid">
	<div class="card mb-3 mt-3">
		<div class="card-header">
			<ul class="nav nav-tabs">
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Select Subject</a>
					<div class="dropdown-menu">
				      <a class="dropdown-item" data-toggle="tab" href="#tab4default">Business Economics</a>
				      <a class="dropdown-item" data-toggle="tab" href="#tab5default">Project Management</a>
				      <a class="dropdown-item" data-toggle="tab" href="#tab6default">Finance Structure</a>
				    </div>
				</li>
			</ul>
		</div>

		<div class="card-body">
			<div class="tab-content">
				<!-- Subject 1 -->
				<div class="tab-pane active" id="tab4default">
					<h4>
						<i class="fa-solid fa-chart-column"></i> Analysis
					</h4>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph1" data-percent="70"
										data-color="#d74680"></div>
									<figcaption>
										<h5>Product Theory</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph2" data-percent="90"
										data-color="#15c7a8"></div>
									<figcaption>
										<h5>Public Seeking</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph3" data-percent="30"
										data-color="#cc3300"></div>
									<figcaption>
										<h5>Demand Analysis</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph4" data-percent="50"
										data-color="#eb7d4b"></div>
									<figcaption>
										<h5>Market Structure</h5>
									</figcaption>
								</figure>
							</div>
						</div>
					</div>

					<h4>
						<i class="fa-solid fa-book"></i> Books
					</h4>

					<div class="card-deck mb-3">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Product Theory
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">25%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Public Seeking
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 15%;" aria-valuenow="15" aria-valuemin="0"
										aria-valuemax="100">15%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Demand Analysis
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 32%;" aria-valuenow="32" aria-valuemin="0"
										aria-valuemax="100">32%</div>
								</div>
							</div>
						</div>
					</div>

					<h4>
						<i class="fa-solid fa-file-lines"></i> Resources
					</h4>

					<div class="card-deck">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-pdf"></i> Case Studies
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-regular fa-file-word"></i> Supply Analysis
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-powerpoint"></i> Market Structure
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
							</div>
						</div>
					</div>
				</div>

				<!-- Subject 2 -->
				<div class="tab-pane " id="tab5default">
					
					<h4>
						<i class="fa-solid fa-chart-column"></i> Analysis
					</h4>
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph5" data-percent="10"
										data-color="#ff0000"></div>
									<figcaption>
										<h5>Product Theory</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph6" data-percent="80"
										data-color="#a3cd10"></div>
									<figcaption>
										<h5>Public Seeking</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph7" data-percent="40"
										data-color="#c84404"></div>
									<figcaption>
										<h5>Demand Analysis</h5>
									</figcaption>
								</figure>
								<figure class="col-md-3 col-sm-3 text-center">
									<div class="chart" id="graph8" data-percent="100"
										data-color="#13ca53"></div>
									<figcaption>
										<h5>Market Structure</h5>
									</figcaption>
								</figure>
							</div>
						</div>
					</div>
					
					
					<h4>
						<i class="fa-solid fa-book"></i> Books
					</h4>

					<div class="card-deck mb-3">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Product Theory
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 25%;" aria-valuenow="25" aria-valuemin="0"
										aria-valuemax="100">25%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Public Seeking
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 15%;" aria-valuenow="15" aria-valuemin="0"
										aria-valuemax="100">15%</div>
								</div>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-book-open"></i> Demand Analysis
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
								<div class="progress">
									<div class="progress-bar bg-success" role="progressbar"
										style="width: 32%;" aria-valuenow="32" aria-valuemin="0"
										aria-valuemax="100">32%</div>
								</div>
							</div>
						</div>
					</div>

					<h4>
						<i class="fa-solid fa-file-lines"></i> Resources
					</h4>

					<div class="card-deck">
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-pdf"></i> Case Studies
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-regular fa-file-word"></i> Supply Analysis
								</h5>
								<p class="card-text">This card has supporting text below as
									a natural lead-in to additional content.</p>
							</div>
						</div>
						<div class="card">

							<div class="card-body">
								<h5 class="card-title">
									<i class="fa-solid fa-file-powerpoint"></i> Market Structure
								</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<%-- <jsp:include page="footer.jsp"></jsp:include> --%>


<script type="text/javascript">
	
</script>
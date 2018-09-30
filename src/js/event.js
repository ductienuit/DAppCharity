App = {
    web3Provider: null,
	contracts: {},
	account: '0x0',
	init: function () {
		return App.initWeb3();
    },
    initWeb3: function () {
		if (typeof web3 !== 'undefined') {
			// If a web3 instance is already provided by Meta Mask.
			App.web3Provider = web3.currentProvider;
			web3 = new Web3(web3.currentProvider);
		} else {
			// Specify default instance if no web3 instance provided
			App.web3Provider = new
			Web3.providers.HttpProvider('http://localhost:7545');
			web3 = new Web3(App.web3Provider);
		}
		return App.initContract();
    },
    initContract: function () {
		$.getJSON("Charity.json", charity => {
			// Instantiate a new truffle contract from the artifact
			App.contracts.Charity = TruffleContract(charity);
			// Connect provider to interact with contract
			App.contracts.Charity.setProvider(App.web3Provider);
			return App.render();
		});
    },
    render: () => {
        var charityInstance;
        App.contracts.Charity.deployed().then(i => {
            charityInstance = i;
            return charityInstance.eventCount();
        }).then(eventCount => {
			var eventlist = $("#list-events");
			eventlist.empty();
			for (var i = 1; i <= eventCount; i++) {
				charityInstance.events(i).then(e => {
					var id = e[0];
                    var name = e[1];
                    var startDate = e[2];
                    var loc = e[4];
                    var receiver = e[5];
					var des = e[6];
					var img = e[7];
					console.log(img);
					// Render candidate Result
                    // var eventTemplate = '<div class="col-md-4 d-flex ftco-animate"><div class="blog-entry align-self-stretch"><a href="blog-single.html" class="block-20" style="background-image: url(images/' + img + ');"></a><div class="text p-4 d-block"><div class="meta mb-3"><div><a href="#">Sep. 10, 2018</a></div><div><a href="#">' + receiver + '</a></div><div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div></div><h3 class="heading mb-4"><a href="#">' + name + '</a></h3><p class="time-loc"><span class="mr-2"><i class="icon-clock-o"></i> 10:30AM-03:30PM</span> <span><i class="icon-map-o"></i>' + loc + '</span></p><p>' + des + '</p><p data-scrollax="properties: { translateY: "30%", opacity: 1.6 }"><a href="view-info-event.html" class="btn btn-black btn-outline-white px-5 py-1 popup-vimeo">View Detail <i class="ion-ios-arrow-forward"></i></a></p><div></div></div>';
                    var eventTemplate = '<div class="item"><div class="cause-entry"><a href="#" class="img" style="background-image: url(images/' + img + ');"></a><div class="text p-3 p-md-4"><h3><a href="#">' + name + '</a></h3><p>' + des + '</p><span class="donation-time mb-3 d-block">Last donation 1w ago</span><div class="progress custom-progress-success"><div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div></div><span class="fund-raised d-block">$12,000 raised of $30,000</span></div></div></div>'
                    // var eventTemplate = '<p>' + name + loc + '</p>'
					eventlist.append(eventTemplate);
				});
            }
        });
    },
    addEvent: function() {
        var name = $('#name').val();
        var startDate = $('#startDate').val();
        var goal = $('#goal').val();
        var loc = $("#loc.form-control").val();
        var receiver = 'Hai';
        var des = $("#des.form-control").val();
        var img = 'bg_5.jpg';
        // console.log(name, startDate, goal, loc, receiver, des, img)
        var charityInstance;
        App.contracts.Charity.deployed().then(i => {
            charityInstance = i;
            return i.eventCount();
        }).then(count => {
            idevent = count + 1;
            charityInstance.addEvents(idevent, name, startDate, goal, loc, receiver, des, img, {from: App.account});
            console.log(count.toNumber());
        });
    }
};
$(function() {
    $(window).load(function() {
        App.init();
    });
});
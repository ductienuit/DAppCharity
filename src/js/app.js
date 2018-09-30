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
	render: function () {
		var charityInstance;
			
		// Load account data
		// web3.eth.getCoinbase(function (err, account) {
		// 	if (err === null) {
		// 		App.account = account;
		// 		$("#accountAddress").html("Your Account: " + account);
		// 	}
		// });
		// Load event data
		App.contracts.Charity.deployed().then(instance => {
			charityInstance = instance;
			return charityInstance.eventCount();
		}).then(eventCount => {
			var eventlist = $("#list-events");
			eventlist.empty();
			for (var i = 1; i <= eventCount; i++) {
				console.log(eventCount);
				charityInstance.events(i).then(e => {
					var id = e[0];
					var name = e[1];
					var des = e[6];
					var img = e[7];
					console.log(img);
					// Render candidate Result
					var eventTemplate = '<div class="item"><div class="cause-entry"><a href="#" class="img" style="background-image: url(images/' + img + ');"></a><div class="text p-3 p-md-4"><h3><a href="#">' + name + '</a></h3><p>' + des + '</p><span class="donation-time mb-3 d-block">Last donation 1w ago</span><div class="progress custom-progress-success"><div class="progress-bar bg-primary" role="progressbar" style="width: 28%" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"></div></div><span class="fund-raised d-block">$12,000 raised of $30,000</span></div></div></div>'
					eventlist.append(eventTemplate);
				});
			}
			// return charityInstance.voters(App.account);
		// }).then(function (hasVoted) {
		// 	// Do not allow a user to vote
		// 	if (hasVoted) {
		// 		$('form').hide();
		// 	}
		// 	loader.hide();
		// 	content.show();
		}).catch(function (error) {
			console.warn('err: '+ error);
		});
	},
	// castVote: function () {
	// 	var candidateId = $('#candidatesSelect').val();
	// 	App.contracts.Election.deployed().then(function (instance) {
	// 		return instance.vote(candidateId, {
	// 			from: App.account
	// 		});
	// 	}).then(function (result) {
	// 		// Wait for votes to update
	// 		$("#content").hide();
	// 		$("#loader").show();
	// 	}).catch(function (err) {
	// 		console.error(err);
	// 	});
	// }
};
$(function () {
	$(window).load(function () {
		App.init();
	});
});
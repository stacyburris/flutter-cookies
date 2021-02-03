'use strict';

var parentElement = document.getElementById('table');
var totalOfAllTotals = 0;
var form = document.getElementById('form');
var allStores=[];


// Generate header row
function generateHeader() {
  var tableRow = document.createElement('tr');
  var blank = document.createElement('td');
  tableRow.appendChild(blank);
  for (var i = 0; i < clock.length; i++) {
    var tableHead = document.createElement('th');
    tableHead.textContent = clock[i];
    tableRow.appendChild(tableHead);
  }
  var total = document.createElement('th');
  total.textContent = 'Daily Location Total';
  tableRow.appendChild(total);
  parentElement.appendChild(tableRow);
}


// Constructor function to create Location instances
function Location(name, minPeople, maxPeople, avgCookie) {
  this.locationName = name;
  this.minPeople = minPeople;
  this.maxPeople = maxPeople;
  this.avgCookie = avgCookie;
  this.hourlyCookies = [];
  this.cookieTotal = 0;
  allStores.push(this);
}

var clock = ['6am', '7am', '8am', '9am', '10am', '11am', '12pm', '1pm', '2pm', '3pm', '4pm', '5pm', '6pm', '7pm'];


// Function to determine cookies baked each hour
Location.prototype.cookiesPerHour = function() {
  this.hourlyCookies = [];
  this.cookieTotal = 0;
  for (var i = 0; i < clock.length; i++){
    var Customers = Math.random() * (this.maxPeople - this.minPeople) + this.minPeople;
    var cookieNumber = Customers * this.avgCookie;
    var cookiesBaked = Math.ceil(cookieNumber);
    this.hourlyCookies.push(cookiesBaked);
    this.cookieTotal = this.cookieTotal + cookiesBaked;
  }
};

// Function to render table rows for each location
Location.prototype.renderTableList = function(){
  var tableRow = document.createElement('tr');
  var storeName = document.createElement('td');
  storeName.textContent = this.locationName;
  tableRow.appendChild(storeName);
  for (var i=0; i < this.hourlyCookies.length; i++){
    var cookiesList = document.createElement('td');
    cookiesList.textContent = this.hourlyCookies[i];
    tableRow.appendChild(cookiesList);
  }
  var dailyTotal = document.createElement('td');
  dailyTotal.textContent = this.cookieTotal;
  tableRow.appendChild(dailyTotal);
  parentElement.appendChild(tableRow);
};


var seattle = new Location ('Seattle', 23, 65, 6.3);
var tokyo = new Location ('Tokyo', 3, 24, 1.2);
var dubai = new Location ('Dubai', 11, 38, 3.7);
var paris = new Location ('Paris', 20, 38, 2.3);
var lima = new Location ('Lima', 2, 16, 4.6);

function footer() {
  var footerRow = document.createElement('tr');
  var dailyTotalAllStores = document.createElement('td');
  dailyTotalAllStores.textContent = 'All Stores Hourly Total';
  footerRow.appendChild(dailyTotalAllStores);
  for (var i = 0; i < clock.length; i++) {
    var hourlyTotals = 0;
    for (var j = 0; j < allStores.length; j++) {
      hourlyTotals += allStores[j].hourlyCookies[i];
      totalOfAllTotals += allStores[j].hourlyCookies[i];
      console.log(totalOfAllTotals);
    }
    var footerData = document.createElement('td');
    footerData.textContent = hourlyTotals;
    footerRow.appendChild(footerData);
  }
  footerData = document.createElement('td');
  footerData.textContent = totalOfAllTotals;
  footerRow.appendChild(footerData);
  parentElement.appendChild(footerRow);
}


// Listener for input form for a new location
form.addEventListener('submit', function (event) {
  event.preventDefault();
  var storeName = event.target.storename.value;
  var storeName = storeName.charAt(0).toUpperCase() + storeName.slice(1);
  // the above capitalization code from https://flaviocopes.com/how-to-uppercase-first-letter-javascript/
  var minCust = parseInt(event.target.mincustomer.value);
  var maxCust = parseInt(event.target.maxcustomer.value);
  var avgCookie = parseInt(event.target.avgcookie.value);
  var storeName = new Location(storeName, minCust, maxCust, avgCookie);
  parentElement.innerHTML = '';
  renderFullTable();
});

function renderFullTable() {
  generateHeader();
  for (var i=0; i< allStores.length; i++){
    allStores[i].cookiesPerHour();
    allStores[i].renderTableList();
  }
  footer();
}
renderFullTable();






/** This is the Javascript file for MyApp **/

angular.module('MyApp', ['ngMaterial'])
.config(function($mdIconProvider) {
    $mdIconProvider.defaultIconSet('img/icons/sets/core-icons.svg', 24);
})
.controller('BookListCtrl', function($scope, $http) {
    $http.get("booklist_json").then( function( $data ) {
        $scope.books = $data.data.data;
        console.log($data.data.data[0]);
    });
}); 

$(document).ready( function() {
    
    var MyApp = React.createClass({
        render: function() {
            var elapsed = Math.round(this.props.elapsed  / 100);
            var seconds = elapsed / 10 + (elapsed % 10 ? '' : '.0' );
            var message = 'React has been successfully running for ' + seconds + ' seconds.';
            return React.DOM.p(null, message);
        }
    });
    
    var MyAppFactory = React.createFactory(MyApp);
    
    var start = new Date().getTime();
    setInterval(function() {
        ReactDOM.render(
            MyAppFactory({elapsed: new Date().getTime() - start}),
            document.getElementById('react-ticker')
        );
    }, 50); 
});
var PeopleComponent = function() {
    
    var eventPullDownInfo = function(e) {
        console.log(this.id);
    };

    return {
        init: function() {
            eventPullDownInfo();
        }
    }
}();

document.addEventListener('DOMContentLoaded', function() {
    PeopleComponent.init();
});
